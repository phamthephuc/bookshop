package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.DetailOrder;
import model.bean.Order;
import model.dao.DetailOrderDao;
import model.dao.OrderDao;
import model.dao.BookDao;
import model.dao.StatusDao;
import service.CallApiService;
import util.SlugUtil;

@Controller
@RequestMapping("/admin")
public class AdminOrderController {
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private StatusDao statusDao;
	
	@Autowired
	private DetailOrderDao detailOrderDao;
	
	
	@Autowired
	private BookDao proDao;
	
	@Autowired
	private Defines defines;
	
	@Autowired
	private SlugUtil slugUtil;
	
	@ModelAttribute
	public void commonObjects(ModelMap modelMap) {
		modelMap.addAttribute("Defines", defines);
		modelMap.addAttribute("numNewOrder",orderDao.countItemChuaXuLy());
		List<Order> listOrder = orderDao.getItemsChuaXuLy();
		modelMap.addAttribute("listOrderChuaXuLy", listOrder);
		modelMap.addAttribute("slugUtil", slugUtil);
	}
	
	
	@RequestMapping("/orders")
	public String index(ModelMap modelMap) {
		List<Order> listOrder = orderDao.getItems();
		modelMap.addAttribute("listOrder", listOrder);
		return "admin.order.index";
	}
	
	@RequestMapping("orders/chua-xu-ly")
	public String indexChuaXuLy(ModelMap modelMap) {
		List<Order> listOrder = orderDao.getItemsChuaXuLyNotLimit();
		modelMap.addAttribute("listOrder", listOrder);
		return "admin.order.index";
	}
	
	
//	@RequestMapping("/order/add")
//	public String cat() {
//		return "admin.order.add";
//	}
//
//	
//	@RequestMapping(value="/order/add",method=RequestMethod.POST)
//	public String cat(@Valid @ModelAttribute("order") Order order,BindingResult br,RedirectAttributes ra,ModelMap modelMap) {
//		if(br.hasErrors()) {
//			modelMap.addAttribute("order", order);
//			return "admin.order.add";
//		}
//		if(orderDao.addItem(order)>0) {
//			ra.addFlashAttribute("msg", Defines.SUCCESS);
//		}else {
//			ra.addFlashAttribute("msg", Defines.ERROR);
//		}
//		
//		return "redirect:/admin/orders";
//			
//	}
	
	@RequestMapping(value="/order/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") int id,RedirectAttributes attributes) {
		if(orderDao.delItem(id)>0) {
			attributes.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			attributes.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/orders";
	}
	
	@RequestMapping("/order/view/{id}")
	public String edit(ModelMap modelMap,@PathVariable("id") int id) {
		modelMap.addAttribute("order", orderDao.getItem(id));
		modelMap.addAttribute("listStatus", statusDao.getItems());
		List<DetailOrder> listDetailOrder = detailOrderDao.getItemsByIdOrder(id);
		modelMap.addAttribute("listDetailOrder", listDetailOrder);
		modelMap.addAttribute("shipFee", Defines.SHIP_FEE);
		modelMap.addAttribute("freeShipPrice", Defines.FREE_SHIP_PRICE);
		return "admin.order.edit";
	}
	
	
	@RequestMapping(value="/order/view/{id}",method=RequestMethod.POST)
	public String edit(@ModelAttribute("order") Order order,RedirectAttributes ra,ModelMap modelMap,@PathVariable("id") int id) {
		order.setId_order(id);
		
		Order oldOrder = orderDao.getItem(id);
		if(oldOrder.getId_status() != 2 && order.getId_status() == 2) {
			List<DetailOrder> listDetailOrder = detailOrderDao.getItemsByIdOrder(id);
			StringBuilder stringBuilder = new StringBuilder();
			for (DetailOrder detailOrder : listDetailOrder) {
				proDao.subNum(-detailOrder.getQty(), detailOrder.getId_pro());
				stringBuilder.append(detailOrder.getId_pro());
				stringBuilder.append(" ");
			}
			removeOrderToApi(stringBuilder.toString(), oldOrder.getId_user(), id);
		}
		
		if(orderDao.editItem(order)>0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/orders";
			
	}

	private void removeOrderToApi(String stringArray, int idUser, int idOrder) {
		LinkedMultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		params.add("list_id_book", stringArray);
		params.add("id_user", idUser);
		params.add("id_order", idOrder);
		CallApiService.getInstance().callPostFromRecommendServer(params, "/cancelBuyBook");
	}
}
