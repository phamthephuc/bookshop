package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.Order;
import model.bean.Slide;
import model.dao.OrderDao;
import model.dao.SlideDao;
import util.FileUtil;

@Controller
@RequestMapping("/admin")
public class AdminSlideController {

	@Autowired
	private SlideDao slideDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private Defines defines;
	
	@ModelAttribute
	public void commonObjects(ModelMap modelMap) {
		modelMap.addAttribute("Defines", defines);
		List<Order> listOrder = orderDao.getItemsChuaXuLy();
		modelMap.addAttribute("numNewOrder",orderDao.countItemChuaXuLy());
		modelMap.addAttribute("listOrderChuaXuLy", listOrder);
	}
	
	
	@RequestMapping(value= {"/slides"},method=RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("listSlide", slideDao.getItems());
		return "admin.slide.index";
	}
	
	@RequestMapping(value="/slide/add",method=RequestMethod.GET)
	public String add() {
		return "admin.slide.add";
	}
	
	
	
	@RequestMapping(value="/slide/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("slide") Slide slide,@RequestParam("hinh1") CommonsMultipartFile multipartFile1,HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
			slide.setPicture("");
			
			try {
				FileUtil.upload(multipartFile1, request);
				slide.setPicture(FileUtil.fileName);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		
			
			if(slideDao.addItem(slide)>0) {
				redirectAttributes.addFlashAttribute("msg", Defines.SUCCESS);
				
			}else {
				redirectAttributes.addFlashAttribute("msg", Defines.ERROR);
			}
			return "redirect:/admin/slides";
	}
	
	@RequestMapping(value="slide/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") int id,RedirectAttributes attributes,HttpServletRequest request) {
		Slide slide = slideDao.getItem(id);
		String fileName1 = slide.getPicture();
		try {
			FileUtil.delete(fileName1, request);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(slideDao.delItem(id)>0) {
			attributes.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			attributes.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/slides";
	}
	
	@RequestMapping(value="slide/edit/{id}",method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id,ModelMap modelMap) {
		Slide slide = slideDao.getItem(id);
		if(slide!=null) {
			modelMap.addAttribute("slide", slide);
		}
		
		return "admin.slide.edit";
	}
	
	@RequestMapping(value="/slide/edit/{id}",method=RequestMethod.POST)
	public String edit(@ModelAttribute("slide") Slide slide,@RequestParam("hinh1") CommonsMultipartFile multipartFile1,HttpServletRequest request,@PathVariable("id") int id,
			RedirectAttributes redirectAttributes) {
		Slide oldSlide = slideDao.getItem(id);
		
		String fileName1 = oldSlide.getPicture();
		
		
		try {
			FileUtil.rePlace(multipartFile1, request, fileName1);
			fileName1 = FileUtil.fileName;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		slide.setPicture(fileName1);
		slide.setId_slide(id);
		if(slideDao.editItem(slide)>0) {
			redirectAttributes.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			redirectAttributes.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/slides";
	}
	
}
