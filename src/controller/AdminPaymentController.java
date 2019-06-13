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
import model.bean.Payment;
import model.dao.OrderDao;
import model.dao.PaymentDao;

@Controller
@RequestMapping("/admin")
public class AdminPaymentController {
	@Autowired
	private PaymentDao paymentDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private Defines defines;
	
	@ModelAttribute
	public void commonObjects(ModelMap modelMap) {
		modelMap.addAttribute("Defines", defines);
		modelMap.addAttribute("numNewOrder",orderDao.countItemChuaXuLy());
		List<Order> listOrder = orderDao.getItemsChuaXuLy();
		modelMap.addAttribute("listOrderChuaXuLy", listOrder);
	}
	
	@RequestMapping("/payments")
	public String index(ModelMap modelMap) {
		List<Payment> listPayment = paymentDao.getItems();
		modelMap.addAttribute("listPayment", listPayment);
		
		return "admin.payment.index";
	}
	
	
	@RequestMapping("/payment/add")
	public String cat() {
		return "admin.payment.add";
	}
	
	
	@RequestMapping(value="/payment/add",method=RequestMethod.POST)
	public String cat(@Valid @ModelAttribute("Payment") Payment Payment,BindingResult br,RedirectAttributes ra,ModelMap modelMap) {
		if(br.hasErrors()) {
			modelMap.addAttribute("payment", Payment);
			return "admin.Payment.add";
		}
		if(paymentDao.addItem(Payment)>0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/payments";
			
	}
	
	@RequestMapping(value="/payment/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") int id,RedirectAttributes attributes) {
		if(paymentDao.delItem(id)>0) {
			attributes.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			attributes.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/payments";
	}
	
	@RequestMapping("/payment/edit/{id}")
	public String edit(ModelMap modelMap,@PathVariable("id") int id) {
		modelMap.addAttribute("payment", paymentDao.getItem(id));
		return "admin.payment.edit";
	}
	
	
	@RequestMapping(value="/payment/edit/{id}",method=RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("Payment") Payment Payment,BindingResult br,RedirectAttributes ra,ModelMap modelMap,@PathVariable("id") int id) {
		if(br.hasErrors()) {
			modelMap.addAttribute("payment", Payment);
			return "admin.payment.edit";
		}
		Payment.setId(id);
		if(paymentDao.editItem(Payment)>0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/payments";
			
	}

}
