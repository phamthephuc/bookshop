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
import model.bean.Publisher;
import model.dao.PublisherDao;

@Controller
@RequestMapping("/admin")
public class AdminPublisherController {
	@Autowired
	private PublisherDao publisherDao;
	
	@RequestMapping("/publishers")
	public String index(ModelMap modelMap) {
		List<Publisher> listPublisher = publisherDao.getAllPublishers();
		modelMap.addAttribute("listPublisher", listPublisher);	
		return "admin.publisher.index";
	}
	
	
	@RequestMapping("/publisher/add")
	public String cat(ModelMap modelMap) {
		return "admin.publisher.add";
	}
	
	
	@RequestMapping(value="/publisher/add",method=RequestMethod.POST)
	public String cat(@Valid @ModelAttribute("publisher") Publisher publisher,BindingResult br,RedirectAttributes ra,ModelMap modelMap) {
		if(br.hasErrors()) {
			modelMap.addAttribute("publisher", publisher);
			return "admin.publisher.add";
		}
		if (publisherDao.addPublisher(publisher) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/publishers";
			
	}
	
	@RequestMapping(value="/publisher/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") int id,RedirectAttributes attributes) {
		if (publisherDao.delPublisher(id) > 0) {
			attributes.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			attributes.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/publishers";
	}
	
	@RequestMapping("/publisher/edit/{id}")
	public String edit(ModelMap modelMap,@PathVariable("id") int id) {
		modelMap.addAttribute("publisher", publisherDao.getPublisher(id));
		return "admin.publisher.edit";
	}
	
	
	@RequestMapping(value="/publisher/edit/{id}",method=RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("publisher") Publisher publisher,BindingResult br,RedirectAttributes ra,ModelMap modelMap,@PathVariable("id") int id) {
		if(br.hasErrors()) {
			modelMap.addAttribute("publisher", publisher);
			return "admin.publisher.edit";
		}
		publisher.setPid(id);
		if(publisherDao.editItem(publisher)>0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/publishers";
			
	}

}
