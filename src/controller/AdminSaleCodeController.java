package controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.Order;
import model.bean.SaleCode;
import model.dao.ContactDao;
import model.dao.OrderDao;
import model.dao.SaleCodeDao;

@Controller
@RequestMapping("/admin")
public class AdminSaleCodeController {
	@Autowired
	private SaleCodeDao saleCodeDao;
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private Defines defines;
	@Autowired
	private ContactDao contactDao;
	
	@ModelAttribute
	public void commonObjects(ModelMap modelMap) {
		modelMap.addAttribute("Defines", defines);
		List<Order> listOrder = orderDao.getItemsChuaXuLy();
		modelMap.addAttribute("numNewOrder",orderDao.countItemChuaXuLy());
		modelMap.addAttribute("listOrderChuaXuLy", listOrder);
	}
	
	
	@RequestMapping("/salecodes")
	public String index(ModelMap modelMap) {
		List<SaleCode> listSaleCode = saleCodeDao.getItems();
		modelMap.addAttribute("listSaleCode", listSaleCode);
		
		return "admin.salecode.index";
	}
	
	
	@RequestMapping("/salecode/add")
	public String cat() {
		return "admin.salecode.add";
	}
	
	
	@RequestMapping(value="/salecode/add",method=RequestMethod.POST)
	public String cat(@Valid @ModelAttribute("salecode") SaleCode salecode,BindingResult br,RedirectAttributes ra,ModelMap modelMap) {
		if(br.hasErrors()) {
			modelMap.addAttribute("salecode", salecode);
			return "admin.salecode.add";
		}
		if(saleCodeDao.addItem(salecode)>0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/salecodes";
			
	}
	
	@RequestMapping(value="/salecode/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") int id,RedirectAttributes attributes) {
		if(saleCodeDao.delItem(id)>0) {
			attributes.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			attributes.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/salecodes";
	}
	
	@RequestMapping("/salecode/edit/{id}")
	public String edit(ModelMap modelMap,@PathVariable("id") int id) {
		modelMap.addAttribute("salecode", saleCodeDao.getItem(id));
		return "admin.salecode.edit";
	}
	
	
	@RequestMapping(value="/salecode/edit/{id}",method=RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("salecode") SaleCode salecode,BindingResult br,RedirectAttributes ra,ModelMap modelMap,@PathVariable("id") int id) {
		if(br.hasErrors()) {
			modelMap.addAttribute("salecode", salecode);
			return "admin.salecode.edit";
		}
		salecode.setId_code(id);
		if(saleCodeDao.editItem(salecode)>0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/salecodes";
			
	}

}
