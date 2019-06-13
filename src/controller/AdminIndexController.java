package controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import constant.Defines;
import model.bean.Order;
import model.dao.OrderDao;
import model.dao.BookDao;
import model.dao.UserDao;

@Controller
@RequestMapping("/admin")
public class AdminIndexController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BookDao proDao;
	
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
	
	@RequestMapping("")
	public String index(HttpSession session,Principal principal,ModelMap modelMap) {
		modelMap.addAttribute("numUser", userDao.countItem());
		modelMap.addAttribute("numPro", proDao.countItemsRunningOut());
		modelMap.addAttribute("numContact", 0);
		modelMap.addAttribute("numOrderChuaXuLy", orderDao.countItemChuaXuLy());
		session.setAttribute("userInfo", userDao.getItem(principal.getName()));
		return "admin.index";
		
	}
}
