package controller;

import java.util.HashMap;
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
import model.bean.Category;
import model.bean.Order;
import model.dao.CategoryDao;
import model.dao.ContactDao;
import model.dao.OrderDao;

@Controller
@RequestMapping("/admin")
public class AdminCatController {
	@Autowired
	private CategoryDao catDao;
	@Autowired
	private Defines defines;
	
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ContactDao contactDao;
	@ModelAttribute
	public void commonObjects(ModelMap modelMap) {
		modelMap.addAttribute("Defines", defines);
		List<Order> listOrder = orderDao.getItemsChuaXuLy();
		modelMap.addAttribute("numNewOrder",orderDao.countItemChuaXuLy());
		modelMap.addAttribute("listOrderChuaXuLy", listOrder);
	}
	
	@RequestMapping("/cats")
	public String index(ModelMap modelMap) {
		List<Category> listParents = catDao.getItemsParent();
		HashMap<Category,List<Category>> hashCatChilds = new HashMap<>();
		for (Category category : listParents) {
			hashCatChilds.put(category, catDao.getItemsChilds(category.getCid()));
		}
		modelMap.addAttribute("listParents", listParents);
		modelMap.addAttribute("hashCatChilds", hashCatChilds);
		
		return "admin.cat.index";
	}
	
	
	@RequestMapping("/cat/add")
	public String cat(ModelMap modelMap) {
		List<Category> listParents = catDao.getItemsParent();
		modelMap.addAttribute("listParents", listParents);
		return "admin.cat.add";
	}
	
	
	@RequestMapping(value="/cat/add",method=RequestMethod.POST)
	public String cat(@Valid @ModelAttribute("cat") Category cat,BindingResult br,RedirectAttributes ra,ModelMap modelMap) {
		if(br.hasErrors()) {
			List<Category> listParents = catDao.getItemsParent();
			modelMap.addAttribute("listParents", listParents);
			modelMap.addAttribute("category", cat);
			return "admin.cat.add";
		}
		if(catDao.addItem(cat)>0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/cats";
			
	}
	
	@RequestMapping(value="/cat/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") int id,RedirectAttributes attributes) {
		if(catDao.delItem(id)>0) {
			attributes.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			attributes.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/cats";
	}
	
	@RequestMapping("/cat/edit/{id}")
	public String edit(ModelMap modelMap,@PathVariable("id") int id) {
		modelMap.addAttribute("cat", catDao.getItem(id));
		modelMap.addAttribute("listCatParents", catDao.getItemsParent());
		return "admin.cat.edit";
	}
	
	
	@RequestMapping(value="/cat/edit/{id}",method=RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("cat") Category cat,BindingResult br,RedirectAttributes ra,ModelMap modelMap,@PathVariable("id") int id) {
		if(br.hasErrors()) {
			modelMap.addAttribute("listCatParents", catDao.getItemsParent());
			modelMap.addAttribute("category", cat);
			return "admin.cat.edit";
		}
		cat.setCid(id);
		if(catDao.editItem(cat)>0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/cats";
			
	}

}
