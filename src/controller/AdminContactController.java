package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.Order;
import model.dao.ContactDao;
import model.dao.OrderDao;

@Controller
@RequestMapping("/admin")
public class AdminContactController {

	@Autowired
	private ContactDao contactDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private Defines defines;
	
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("numNewOrder",orderDao.countItemChuaXuLy());
		List<Order> listOrder = orderDao.getItemsChuaXuLy();
		modelMap.addAttribute("listOrderChuaXuLy", listOrder);
	}
	
	@RequestMapping(value="/contacts",method=RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("listContact", contactDao.getItems());
		return "admin.contact.index";
	}
	
	
	@RequestMapping(value="/contact/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") int id,RedirectAttributes attributes) {
		if(contactDao.delItem(id)>0) {
			attributes.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			attributes.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/contacts";
	}
}
