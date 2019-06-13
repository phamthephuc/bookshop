package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import constant.Defines;
import model.bean.Order;
import model.dao.OrderDao;
import util.SlugUtil;

@Controller
@RequestMapping("/admin")
public class AdminThongKeController {
	@Autowired
	private OrderDao orderDao;
	
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
	
	
	@RequestMapping("/thong-ke")
	public String index(ModelMap modelMap) {
		Date date = new Date();
		
		int month = date.getMonth();
		int year = date.getYear();
		month = (month % 12 + 1) ;
		year = 1900 + year;
		
		List<Order> listOrder = orderDao.getItemsByMothAndYear(month,year);
		modelMap.addAttribute("listOrder", listOrder);
		float tong = 0;
		for (Order order : listOrder) {
			tong += order.getAmount();
		}
		modelMap.addAttribute("tongTien", tong);
		modelMap.addAttribute("minYear",orderDao.getMinYear());
		
		modelMap.addAttribute("maxYear",orderDao.getMaxYear());
		
		modelMap.addAttribute("crMonth",month);
		
		modelMap.addAttribute("crYear",year);
		
		return "admin.thongke.index";
	}
	
	
}
