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
import model.bean.Author;
import model.dao.AuthorDao;

@Controller
@RequestMapping("/admin")
public class AdminAuthorController {
	@Autowired
	private AuthorDao authorDao;
	
	@RequestMapping("/authors")
	public String index(ModelMap modelMap) {
		List<Author> listAuthors = authorDao.getAllAuthores();
		modelMap.addAttribute("listAuthors", listAuthors);	
		return "admin.author.index";
	}
	
	
	@RequestMapping("/author/add")
	public String cat(ModelMap modelMap) {
		return "admin.author.add";
	}
	
	
	@RequestMapping(value="/author/add",method=RequestMethod.POST)
	public String cat(@Valid @ModelAttribute("author") Author author,BindingResult br,RedirectAttributes ra,ModelMap modelMap) {
		if(br.hasErrors()) {
			modelMap.addAttribute("author", author);
			return "admin.author.add";
		}
		if (authorDao.addAuthor(author) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/authors";
			
	}
	
	@RequestMapping(value="/author/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") int id,RedirectAttributes attributes) {
		if (authorDao.delAuthor(id) > 0) {
			attributes.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			attributes.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/authors";
	}
	
	@RequestMapping("/author/edit/{id}")
	public String edit(ModelMap modelMap,@PathVariable("id") int id) {
		modelMap.addAttribute("author", authorDao.getAuthor(id));
		return "admin.author.edit";
	}
	
	
	@RequestMapping(value="/author/edit/{id}",method=RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("author") Author author,BindingResult br,RedirectAttributes ra,ModelMap modelMap,@PathVariable("id") int id) {
		if(br.hasErrors()) {
			modelMap.addAttribute("author", author);
			return "admin.author.edit";
		}
		author.setAid(id);
		if(authorDao.editItem(author)>0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/authors";
			
	}

}
