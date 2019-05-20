package controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.Book;
import model.bean.Category;
import model.bean.Order;
import model.dao.AuthorDao;
import model.dao.BookDao;
import model.dao.CategoryDao;
import model.dao.OrderDao;
import model.dao.PublisherDao;
import service.CallApiService;
import util.FileUtil;

@Controller
@RequestMapping("/admin")
public class AdminBookController {

	@Autowired
	private BookDao proDao;

	@Autowired
	private AuthorDao authorDao;

	@Autowired
	private PublisherDao publisherDao;

	@Autowired
	private CategoryDao catDao;

	@Autowired
	private OrderDao orderDao;

	@Autowired
	private Defines defines;

	@ModelAttribute
	public void commonObjects(ModelMap modelMap) {
		modelMap.addAttribute("Defines", defines);
		List<Order> listOrder = orderDao.getItemsChuaXuLy();
		modelMap.addAttribute("numNewOrder", orderDao.countItemChuaXuLy());
		modelMap.addAttribute("listOrderChuaXuLy", listOrder);
	}
	
	@RequestMapping(value = { "/books/{page}", "/books" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int sumPage = (int) Math.ceil((float) proDao.countItem() / Defines.ROW_COUNT);
		int rowCount = Defines.ROW_COUNT;
		int offset = (page - 1) * rowCount;
		modelMap.addAttribute("listBooks", proDao.getItems(offset));
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		return "admin.book.index";
	}

	@RequestMapping(value = { "/search" }, method = RequestMethod.POST)
	public String indexSerach(ModelMap modelMap, @ModelAttribute(value = "key") String key) {
		modelMap.addAttribute("listProduct", proDao.getItemsByName(key));
		return "admin.book.search";
	}

	@RequestMapping(value = { "books/running-out" }, method = RequestMethod.GET)
	public String runningoutPro(ModelMap modelMap, @ModelAttribute(value = "key") String key) {
		modelMap.addAttribute("listProduct", proDao.getItemsRunningOut());
		return "admin.book.search";
	}

	@RequestMapping(value = "/book/add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		HashMap<Category, List<Category>> hashMapCat = new HashMap<>();
		List<Category> listCategories = catDao.getItemsParent();
		for (Category category : listCategories) {
			hashMapCat.put(category, catDao.getItemsChilds(category.getCid()));
		}
		modelMap.addAttribute("hashMapCat", hashMapCat);
		modelMap.addAttribute("listAuthor", authorDao.getAllAuthores());
		modelMap.addAttribute("listPublisher", publisherDao.getAllPublishers());
		return "admin.book.add";
	}

	@RequestMapping(value = "/pro/libraries/ckfinder/ckfinder.html", method = RequestMethod.GET)
	public String ckfinder() {
		return "ckfinder";
	}
	
	private void addBookInRecommendSystem(Integer bid) {
		LinkedMultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
        params.add("id_book", bid);
        CallApiService.getInstance().callPostFromRecommendServer(params, "addBook");
	}
	
	private void deleteBookInRecommendSystem(Integer bid) {
		LinkedMultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
        params.add("id_book", bid);
        CallApiService.getInstance().callPostFromRecommendServer(params, "deleteBook");
	}
	
	@RequestMapping(value = "/book/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("book") Book book, BindingResult bindingResult,
			@RequestParam("hinh") CommonsMultipartFile multipartFile1, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		book.setPicture("");
		try {
			FileUtil.upload(multipartFile1, request);
			book.setPicture(FileUtil.fileName);
			book.setNumber_rest(book.getNumber_start());
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if (proDao.addItem(book) > 0) {
			redirectAttributes.addFlashAttribute("msg", Defines.SUCCESS);

		} else {
			redirectAttributes.addFlashAttribute("msg", Defines.ERROR);
		}
		int bookId = proDao.getNewestIdBook();
		addBookInRecommendSystem(bookId);
		return "redirect:/admin/books";
	}

	@RequestMapping(value = "book/del/{id}", method = RequestMethod.GET)
	public String del(@PathVariable("id") int id, RedirectAttributes attributes, HttpServletRequest request) {
		Book pro = proDao.getItem(id);
		String fileName = pro.getPicture();
		try {
			FileUtil.delete(fileName, request);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (proDao.delItem(id) > 0) {
			deleteBookInRecommendSystem(id);
			attributes.addFlashAttribute("msg", Defines.SUCCESS);
		} else {
			attributes.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/books";
	}

	@RequestMapping(value = "book/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		Book book = proDao.getItem(id);
		if (book != null) {
			HashMap<Category, List<Category>> hashMapCat = new HashMap<>();
			List<Category> listCategories = catDao.getItemsParent();
			for (Category category : listCategories) {
				hashMapCat.put(category, catDao.getItemsChilds(category.getCid()));
			}
			modelMap.addAttribute("hashMapCat", hashMapCat);
			modelMap.addAttribute("listAuthors", authorDao.getAllAuthores());
			modelMap.addAttribute("listPublishers", publisherDao.getAllPublishers());
			modelMap.addAttribute("book", book);
		}
		return "admin.book.edit";
	}

	@RequestMapping(value = "book/addNum/{id}", method = RequestMethod.GET)
	public String addNum(@PathVariable("id") int id, ModelMap modelMap) {
		Book pro = proDao.getItem(id);
		if (pro != null) {
			modelMap.addAttribute("pro", pro);
		}
		return "admin.book.addNum";
	}

	@RequestMapping(value = "book/addNum/{id}", method = RequestMethod.POST)
	public String addNum(@PathVariable("id") int id, @RequestParam("numAdd") int numAdd) {
		proDao.addNum(numAdd, id);
		return "redirect:/admin/books";
	}

	@RequestMapping(value = "/book/edit/{id}", method = RequestMethod.POST)
	public String edit(@ModelAttribute("book") Book pro, BindingResult bindingResult, @RequestParam("hinh") CommonsMultipartFile multipartFile1,
			HttpServletRequest request, @PathVariable("id") int id, RedirectAttributes redirectAttributes) {
		Book oldProduct = proDao.getItem(id);

		String fileName1 = oldProduct.getPicture();
		try {
			FileUtil.rePlace(multipartFile1, request, fileName1);
			fileName1 = FileUtil.fileName;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pro.setPicture(fileName1);
		pro.setBid(id);
		if (proDao.editItem(pro) > 0) {
			redirectAttributes.addFlashAttribute("msg", Defines.SUCCESS);
		} else {
			redirectAttributes.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/books";
	}

}
