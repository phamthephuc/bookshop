package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.Author;
import model.bean.Book;
import model.bean.Category;
import model.bean.Contact;
import model.bean.DetailOrder;
import model.bean.Order;
import model.bean.Payment;
import model.bean.Publisher;
import model.bean.User;
import model.dao.AuthorDao;
import model.dao.BookDao;
import model.dao.CategoryDao;
import model.dao.ContactDao;
import model.dao.DetailOrderDao;
import model.dao.OrderDao;
import model.dao.PaymentDao;
import model.dao.PublisherDao;
import model.dao.SlideDao;
import model.dao.StatusDao;
import model.dao.TypeDao;
import model.dao.UserDao;
import service.CallApiService;
import service.ResponseRecommend;
import util.SendMail;
import util.SlugUtil;

@Controller
public class PublicController {
	@Autowired
	private BCryptPasswordEncoder password1;
	@Autowired
	private ContactDao contactDao;
	
	@Autowired
	private CategoryDao catDao;
	
	@Autowired
	private PublisherDao publisherDao;
	
	@Autowired
	private SlideDao slideDao;
	
	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private DetailOrderDao detailOrderDao;
	
	@Autowired
	private TypeDao typeDao;
	
	@Autowired
	private AuthorDao authorDao;
	
	@Autowired
	private BookDao proDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private StatusDao statusDao;
	
	@Autowired
	private SlugUtil slugUtil;
	
	@ModelAttribute
	public void CommonOject(ModelMap modelMap,HttpServletRequest request) {	
		HttpSession session = request.getSession();
		List<Category> listCatParent = catDao.getItemsParent();
		HashMap<Category, List<Category>> hashCatParents = new HashMap<>();
		for (Category category : listCatParent) {
			hashCatParents.put(category, catDao.getItemsChilds(category.getCid()));
		}
		if (session.getAttribute("objUserLogin") != null) {
			modelMap.addAttribute("objUserLogin", session.getAttribute("objUserLogin"));
		}
		modelMap.addAttribute("hashCatParents", hashCatParents);
		modelMap.addAttribute("listPublishers", publisherDao.getAllPublishers());
		modelMap.addAttribute("listAuthors", authorDao.getListAuthoresLimit());
		modelMap.addAttribute("listType",typeDao.getItems() );
		modelMap.addAttribute("slugUtil", slugUtil);
	}
	@RequestMapping("/")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("title", "Trang chủ");
		modelMap.addAttribute("home", true);
		List<Category> listCatParent = catDao.getItemsParent();
		modelMap.addAttribute("listSlides", slideDao.get3Items());
		modelMap.addAttribute("listBookComingSoon", proDao.getBookComingSoonPagination(1));
		modelMap.addAttribute("listBookBestSale", proDao.getBookBestSalePagination(1));
		modelMap.addAttribute("listBookNewest", proDao.getBookNewestPaginationAndOrder(1));
		HashMap<Category, Book> hashBookCatParents = new HashMap<>();
		for (Category category : listCatParent) {
			List<Book> listBookOfCat = proDao.getItemsByCatParent(category.getCid());
			if (listBookOfCat.size() > 0) {
				hashBookCatParents.put(category, listBookOfCat.get(0));
			}
		}
		modelMap.addAttribute("hashBookCatParents", hashBookCatParents);
		return "public.book.index";
	}
	
	@RequestMapping("/sach-truyen/{bid}/{book_name}")
	public String detailBook(ModelMap modelMap, @PathVariable("bid") int bid) {
		Book objBook = proDao.getItem(bid);
		if (objBook != null) {
			modelMap.addAttribute("objBook", objBook);
			Category objCat = catDao.getItem(objBook.getCategory_id());
			Category objCatParent = catDao.getItem(objCat.getId_parent());
			modelMap.addAttribute("objCatParent", objCatParent);
			modelMap.addAttribute("listBookSameCat", proDao.getItemsSameCat(objBook));
			modelMap.addAttribute("listBookSameAuthor", proDao.getItemsSameAuthor(objBook));
		}
		return "public.book.detail";
	}
	
	@RequestMapping(value = {"/sach-ban-chay","/sach-ban-chay/group/{group}"})
	public String bestSaleBook(ModelMap modelMap, @PathVariable(value = "group", required = false) Integer group) {
		if (group == null) {
			group = 1;
		}
		modelMap.addAttribute("listCatParent", catDao.getItemsParent());
		modelMap.addAttribute("group", group);
		modelMap.addAttribute("listBook", proDao.getBookBestSalePagination(group));
		int numAll = proDao.countItemBestSale();
		modelMap.addAttribute("numAll", numAll);
		modelMap.addAttribute("numGroup", numAll / Defines.ROW_COUNT + 1);
		modelMap.addAttribute("maxBookInGroup", Defines.ROW_COUNT);
		return "public.book.bestsale";
	}
	
	
	@RequestMapping(value = {"/sach-goi-y"})
	public String recommmendBook(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("objUserLogin") != null) {
			modelMap.addAttribute("listCatParent", catDao.getItemsParent());
			User userLogin = (User) session.getAttribute("objUserLogin");
			LinkedMultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
			ResponseEntity<ResponseRecommend> responseEntity = CallApiService.getInstance().callGetRecommendServer(params, "/recommendBook" + "/" + userLogin.getId());
			ResponseRecommend responseRecommend = responseEntity.getBody();
			if (responseRecommend.data.length > 0) {
				System.out.println(responseRecommend.toString());
				List<Book> listBook = proDao.getItemsIn(responseRecommend);
				System.out.println(listBook.size());
				modelMap.addAttribute("listBook", listBook);
			} else {
				modelMap.addAttribute("listBook", new ArrayList<Book>());
			}
			return "public.book.recommend";
		} else {
			modelMap.addAttribute("errMsg", "Bạn cần đăng nhập trước");
			return "public.book.recommend";
		}
		
	}
	
	@RequestMapping(value = {"/tac-gia/{ten-tac-gia}/{aid}", "/tac-gia/{ten-tac-gia}/{aid}/page/{page}/ordering/{ordering}"})
	public String authorBook(ModelMap modelMap, @PathVariable("aid") int aid, @PathVariable(value = "page", required = false) Integer page, @PathVariable(value = "ordering", required = false) Integer ordering) {
		if (page == null) {
			page = 1;
		}
		if (ordering == null) {
			ordering = 1;
		}
		int sumPages = (int) Math.ceil((float) proDao.countItemActiveByAuthor(aid) / Defines.ROW_COUNT);
		
		modelMap.addAttribute("current_page", page);
		modelMap.addAttribute("sumPages", sumPages);
		modelMap.addAttribute("ordering", ordering);
		Author objAuthor = authorDao.getAuthor(aid);
		modelMap.addAttribute("objAuthor", objAuthor);
		if (objAuthor != null) {
			modelMap.addAttribute("listBook", proDao.getItemsByAuthorPaginationAndOrdering(aid, page, ordering));
		}
		return "public.book.authorbook";
	}
	
	@RequestMapping(value = {"/nha-phat-hanh/{ten-nha-phat-hanh}/{pid}", "/nha-phat-hanh/{ten-nha-phat-hanh}/{pid}/page/{page}/ordering/{ordering}"})
	public String publisherBook(ModelMap modelMap, @PathVariable("pid") int pid, @PathVariable(value = "page", required = false) Integer page, @PathVariable(value = "ordering", required = false) Integer ordering) {
		if (page == null) {
			page = 1;
		}
		if (ordering == null) {
			ordering = 1;
		}
		int sumPages = (int) Math.ceil((float) proDao.countItemActiveByPublisher(pid) / Defines.ROW_COUNT);
		
		modelMap.addAttribute("current_page", page);
		modelMap.addAttribute("sumPages", sumPages);
		modelMap.addAttribute("ordering", ordering);
		Publisher objPublisher = publisherDao.getPublisher(pid);
		modelMap.addAttribute("objPublisher", objPublisher);
		if (objPublisher != null) {
			modelMap.addAttribute("listBook", proDao.getItemsByPublisherPaginationAndOrdering(pid, page, ordering));
		}
		return "public.book.publisherbook";
	}
	
	@RequestMapping(value = {"/sach-moi", "/sach-moi/page/{page}"})
	public String newBook(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int sumPages = (int) Math.ceil((float) proDao.countItemActive()/ Defines.ROW_COUNT);
		modelMap.addAttribute("current_page", page);
		modelMap.addAttribute("sumPages", sumPages);
		modelMap.addAttribute("listBook", proDao.getBookNewestPaginationAndOrder(page));
		return "public.book.newbooks";
	}
	
	@RequestMapping(value = {"/sach-sap-phat-hanh", "/sach-sap-phat-hanh/page/{page}"})
	public String comingSoonBook(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int sumPages = (int) Math.ceil((float) proDao.countItemCommingSoon()/ Defines.ROW_COUNT);
		
		modelMap.addAttribute("current_page", page);
		modelMap.addAttribute("sumPages", sumPages);
		modelMap.addAttribute("listBook", proDao.getBookComingSoonPagination(page));
		return "public.book.comingsoon";
	}
	
	@RequestMapping("/dang-nhap")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("objUserLogin") != null) {
			return "redirect:/thong-tin-giao-hang";
		}
		return "public.book.loginspecial";
	}
	
	
	@RequestMapping("/dang-xuat")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("objUserLogin") != null) {
			session.removeAttribute("objUserLogin");
		}
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/dang-nhap",method=RequestMethod.POST)
	public String login( @Valid @ModelAttribute("user") User user,BindingResult br,RedirectAttributes ra,ModelMap modelMap,HttpServletRequest request) {
		HttpSession session = request.getSession();	
		String password = user.getPassword();
		User userInfo = userDao.getItem(user.getUsername());
		if(userInfo != null) {
			if(password1.matches(password, userInfo.getPassword()) && userInfo.getRole_id() == 3) {
				session.setAttribute("objUserLogin", userInfo);
				return "redirect:/thong-tin-giao-hang";
			}
			else {
				return "redirect:/dang-nhap?error=1";
			}
		}
		else
		{
			return "redirect:/dang-nhap?error=1";
		}
		
	}
	
	@RequestMapping(value = {"/dang-ky"})
	public String registerAccount() {
		return "public.book.register";
	}
	
	@RequestMapping(value = {"/tim-kiem/{keyword}", "/tim-kiem/{keyword}/page/{page}"})
	public String searchBook(ModelMap modelMap, @PathVariable(value = "keyword", required = true) String keyword, @PathVariable(value = "page", required = false) Integer page) {
		if (page == null) {
			page = 1;
		}
		if (keyword.equals("")) {
			modelMap.addAttribute("current_page", page);
			modelMap.addAttribute("keyword", keyword);
			modelMap.addAttribute("sumPages", 0);
			modelMap.addAttribute("countBooksSearch", 0);
			modelMap.addAttribute("error", "Từ khóa '" + keyword + "' không hợp lệ");
		} else {
			int numAllItemSearch = proDao.countItemSearch(keyword);
			int sumPages = (int) Math.ceil((float) numAllItemSearch/ Defines.ROW_COUNT);
			modelMap.addAttribute("current_page", page);
			modelMap.addAttribute("keyword", keyword);
			modelMap.addAttribute("sumPages", sumPages);
			modelMap.addAttribute("countBooksSearch", numAllItemSearch);
			modelMap.addAttribute("listBook", proDao.getBookSearchNamePagination(page, keyword));
		}
		
		return "public.book.search";
	}
	
	@RequestMapping(value= {"danh-muc/{namecat}/{id}","danh-muc/{namecat}/{id}/page/{page}/ordering/{ordering}" })
	public String cat(ModelMap modelMap,@PathVariable("id") int id, @PathVariable(value = "page", required = false) Integer page, @PathVariable(value = "ordering", required = false) Integer ordering) {
		if (page == null) {
			page = 1;
		}
		if (ordering == null) {
			ordering = 1;
		}
		int sumPages = (int) Math.ceil((float) proDao.countItemByIdCat(id) / Defines.ROW_COUNT);
		
		modelMap.addAttribute("current_page", page);
		modelMap.addAttribute("sumPages", sumPages);
		modelMap.addAttribute("ordering", ordering);
		Category objCategory = catDao.getItem(id);
		modelMap.addAttribute("objCat", objCategory);
		if (objCategory != null) {
			if (objCategory.getId_parent() != 0) {
				modelMap.addAttribute("objCatParent", catDao.getItem(objCategory.getId_parent()));
				modelMap.addAttribute("listBookOfCat", proDao.getItemsByCatPaginationAndOrdering(objCategory.getCid(), page, ordering));
				modelMap.addAttribute("listCategoriesData", catDao.getItemsChilds(objCategory.getId_parent()));
			} else {
				modelMap.addAttribute("listBookOfCat", proDao.getItemsByCatParentPaginationAndOrdering(id, page, ordering));
				modelMap.addAttribute("listCategoriesData", catDao.getItemsChilds(id));
			}
		}
		return "public.book.cat";
	}
	
	private void addUserInRecommendSystem(Integer id_user) {
		LinkedMultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
        params.add("id_user", id_user);
        CallApiService.getInstance().callPostFromRecommendServer(params, "addUser");
	}
	
	@RequestMapping(value="/dang-ky",method=RequestMethod.POST)
	public String register(@Valid @ModelAttribute("user") User user,BindingResult br,RedirectAttributes ra,ModelMap modelMap) {
		if(br.hasErrors()) {
			System.out.println(br.getFieldError());
			modelMap.addAttribute("user", user);
			return "public.book.register";
		}
		user.setRole_id(3);
		user.setEnable(1);
		user.setPassword(password1.encode(user.getPassword()));
		if(userDao.addItem(user) > 0)
		{
			addUserInRecommendSystem(userDao.getNewestUserId());
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}
		else
		{
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/dang-nhap";
	}
	
	
	@RequestMapping("/xac-nhan")
	public String confirm(ModelMap modelMap,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("listDetailOrder") == null || session.getAttribute("order") == null) {
			return "redirect:/";
		}
		else
		{
			List<DetailOrder> listDetailOrder = (List<DetailOrder>) session.getAttribute("listDetailOrder");
			if(listDetailOrder.size() == 0) {
				return "redirect:/";
			}
			else
			{
				float tongTien = (float) session.getAttribute("tongTien");
				HashMap<DetailOrder, Book> hashPro = new HashMap<>();
				modelMap.addAttribute("listDetailOrder", listDetailOrder);
				Order order = (Order) session.getAttribute("order");
				order.setAmount(tongTien);
				session.setAttribute("order",order);
				modelMap.addAttribute("order", order);
				for (DetailOrder detailOrder : listDetailOrder) {
					hashPro.put(detailOrder, proDao.getItem(detailOrder.getId_pro()));
				}
				
				modelMap.addAttribute("tongTien", tongTien);
				modelMap.addAttribute("hashPro", hashPro);
				return "public.confirm";
			}
		}
		
	}
	
	
	@RequestMapping("/xem-thong-tin")
	public String xemThongTin(ModelMap modelMap,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") == null) {
			return "redirect:/";
		}
		else
		{
			User user = (User) session.getAttribute("userInfo");
			List<Order> listOrder = orderDao.getItemsByIdUser(user.getId());
			
				modelMap.addAttribute("user", user);
				modelMap.addAttribute("listOrder", listOrder);
				
				return "public.xemThongTin";
		}
		
	}
	
	@RequestMapping("/thanh-toan1")
	public String thantoan(ModelMap modelMap) {
		List<Payment> listPayment = paymentDao.getItems();
		modelMap.addAttribute("listPayment", listPayment);
		return "public.thanhtoan";
	}
	
	@RequestMapping("/thong-tin-giao-hang")
	public String checkOut(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("listDetailOrder") == null) {
			return "redirect:/";
		}
		List<DetailOrder> listDetailOrder = (List<DetailOrder>) session.getAttribute("listDetailOrder");
		long sumMoney = 0;
		for (DetailOrder detailOrder : listDetailOrder) {
			Book book = proDao.getItem(detailOrder.getId_pro());
			detailOrder.setName_pro(book.getBook_name());
			detailOrder.setPrice(book.getPrice());
			detailOrder.setSale(book.getSale());
			sumMoney += (book.getPrice() - (long) (book.getPrice() * book.getSale() / 100)) * detailOrder.getQty();
		}
		Order order = (Order) session.getAttribute("order");
		if (order != null) {
			modelMap.addAttribute("order", order);
		} else {
			User user = (User) session.getAttribute("objUserLogin");
			if (user != null) {
				order = new Order();
				order.setAddress_ship(user.getAddress());
				order.setFullname(user.getFullname());
				order.setPhone(user.getPhone());
				order.setEmail(user.getEmail());
				modelMap.addAttribute("order", order);
			}
		}
		session.setAttribute("listDetailOrder", listDetailOrder);
		modelMap.addAttribute("listDetailOrder", listDetailOrder);
		modelMap.addAttribute("sumMoney", sumMoney);
		if (sumMoney >= Defines.FREE_SHIP_PRICE) {
			modelMap.addAttribute("shipFee", 0);
		} else {
			modelMap.addAttribute("shipFee", Defines.SHIP_FEE);
		}
		return "public.book.checkout";
	}
	
	@RequestMapping("/hinh-thuc-thanh-toan")
	public String checkEnd(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		List<DetailOrder> listDetailOrder = (List<DetailOrder>) session.getAttribute("listDetailOrder");
		if (order == null || listDetailOrder == null) {
			return "redirect:/";
		} else {
			modelMap.addAttribute("order", order);
			long sumMoney = 0;
			for (DetailOrder detailOrder : listDetailOrder) {
				Book book = proDao.getItem(detailOrder.getId_pro());
				detailOrder.setName_pro(book.getBook_name());
				detailOrder.setPrice(book.getPrice());
				detailOrder.setSale(book.getSale());
				sumMoney += (book.getPrice() - (long) (book.getPrice() * book.getSale() / 100)) * detailOrder.getQty();
			}
			modelMap.addAttribute("listDetailOrder", listDetailOrder);
			modelMap.addAttribute("sumMoney", sumMoney);
			if (sumMoney >= Defines.FREE_SHIP_PRICE) {
				modelMap.addAttribute("shipFee", 0);
			} else {
				modelMap.addAttribute("shipFee", Defines.SHIP_FEE);
			}
		}
		modelMap.addAttribute("listPayments", paymentDao.getItems());
		return "public.book.checkend";
	}
	
	@RequestMapping("/hoan-thanh")
	public String finishorder(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		if (session.getAttribute("idOrder") == null) {
			return "redirect:/";
		}
		int idOrder = (Integer) session.getAttribute("idOrder");
		modelMap.addAttribute("idOrder", idOrder);
		modelMap.addAttribute("order", order);
		session.removeAttribute("order");
		session.removeAttribute("listDetailOrder");
		session.removeAttribute("numProduct");
		session.removeAttribute("idOrder");
		return "public.book.finishorder";
	}
	
	@RequestMapping("/quan-ly-tai-khoan")
	public String selfUserManager(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("objUserLogin");
		if (userLogin == null) {
			return "redirect:/";
		}
		modelMap.addAttribute("objUserLogin", userLogin);
		return "public.customer.index";
	}
	
	@RequestMapping("/thay-doi-thong-tin")
	public String changeInfomation(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("objUserLogin");
		if (userLogin == null) {
			return "redirect:/";
		}
		modelMap.addAttribute("objUserLogin", userLogin);
		return "public.customer.edit";
	}
	
	
	@RequestMapping("/xem-don-hang")
	public String viewOrders(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("objUserLogin");
		if (userLogin == null) {
			return "redirect:/";
		}
		modelMap.addAttribute("listOrderByCustomer", orderDao.getItemsByIdUser(userLogin.getId()));
		return "public.customer.orders";
	} 
	

	@RequestMapping(value="/thay-doi-thong-tin", method = RequestMethod.POST)
	public String changeInfomationPost(@Valid @ModelAttribute("user") User user,BindingResult br,RedirectAttributes attributes, ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(br.hasErrors()) {
			modelMap.addAttribute("user", user);
			return "redirect:/thay-doi-thong-tin";
		}
		User userLogin = (User) session.getAttribute("objUserLogin");
		if (userLogin == null) {
			return "redirect:/";
		}
		user.setPassword(userLogin.getPassword());
		user.setId(userLogin.getId());
		user.setRole_id(userLogin.getRole_id());
		user.setEnable(userLogin.getEnable());
		userDao.editItem(user);
		session.setAttribute("objUserLogin", user);
		return "redirect:/";
	}
	
	
	@RequestMapping("/thay-doi-mat-khau")
	public String changePassword(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("objUserLogin");
		if (userLogin == null) {
			return "redirect:/";
		}
		return "public.customer.editpass";
	}
	
	@RequestMapping(value="/thay-doi-mat-khau", method=RequestMethod.POST)
	public String changePassword(@RequestParam("oldpassword") String oldPassword, @RequestParam("password") String newPassword,  HttpServletRequest request) {
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("objUserLogin");
		if (userLogin == null) {
			return "redirect:/";
		}
		if(password1.matches(oldPassword, userLogin.getPassword())) {
			if (newPassword.length() < 6) {
				return "redirect:/dang-nhap?error=2";
			}
			userLogin.setPassword(password1.encode(newPassword));
			userDao.editItem(userLogin);
			session.setAttribute("objUserLogin", userLogin);
			return "redirect:/";
		}
		else {
			return "redirect:/dang-nhap?error=1";
		}
	}
	
	
	 public synchronized  int addOrder(Order order) { 
	       orderDao.addItem(order);
	       return orderDao.getMaxId();
	 }
	
	@RequestMapping(value="/thong-tin-giao-hang",method=RequestMethod.POST)
	public String ship(ModelMap modelMap,HttpServletRequest request,@Valid @ModelAttribute("order") Order order,BindingResult br,RedirectAttributes ra) {
		HttpSession session= request.getSession();
		if(br.hasErrors()) {
			System.out.println(br.getFieldErrors());
			return "redirect:/thong-tin-giao-hang";
		}
		
		User user = (User) session.getAttribute("userInfo");
		if(user != null) {
			order.setId_user(user.getId());
		}
		else
		{
			order.setId_user(0);
		}
		order.setId_status(0);
		session.setAttribute("order", order);
		return "redirect:/hinh-thuc-thanh-toan";
	}
	
	private void addOrderToApi(String stringArray, int idUser) {
		LinkedMultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		params.add("list_id_book", stringArray);
		params.add("id_user", idUser);
		CallApiService.getInstance().callPostFromRecommendServer(params, "/buyBook");
	}
	@RequestMapping(value="/hinh-thuc-thanh-toan",method=RequestMethod.POST)
	public String payment(@RequestParam("id_payment") int id_payment, ModelMap modelMap,HttpServletRequest request) {
		HttpSession session= request.getSession();
		Order order = (Order) session.getAttribute("order");
		if (order == null) {
			return "redirect:/";
		} else {
			order.setId_payment(id_payment);
			session.setAttribute("order", order);
			int idOrder = addOrder(order);
			List<DetailOrder> listDetailOrder = (List<DetailOrder>) session.getAttribute("listDetailOrder");
			StringBuilder stringBuilder = new StringBuilder();
			for (DetailOrder detailOrder : listDetailOrder) {
				detailOrder.setId_order(idOrder);
				detailOrderDao.addItem(detailOrder);
				stringBuilder.append(detailOrder.getId_pro());
				stringBuilder.append(" ");
			}
			if (session.getAttribute("objUserLogin") != null) {
				User user = (User) session.getAttribute("objUserLogin");
				addOrderToApi(stringBuilder.toString(), user.getId());
			}
			session.setAttribute("idOrder", idOrder);
			return "redirect:/hoan-thanh";
		}
		
	}
	
	
	@RequestMapping(value="/lien-he",method=RequestMethod.POST)
	public String contact(@Valid @ModelAttribute("contact") Contact contact,BindingResult br,RedirectAttributes ra,ModelMap modelMap) {
		if(br.hasErrors()) {
			modelMap.addAttribute("contact", contact);
			return "public.contact";
		}
		if(contactDao.addItem(contact) > 0)
		{
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}
		else
		{
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/lien-he";
	}

	@RequestMapping("/thong-tin-gio-hang")
	public String checkout(ModelMap modelMap,HttpServletRequest request) {
		HttpSession session = request.getSession();
		HashMap<DetailOrder, Book> hashDetail = new HashMap<>();
		List<DetailOrder> listDetailOrder = (List<DetailOrder>) session.getAttribute("listDetailOrder");
		if(listDetailOrder != null) {
			modelMap.addAttribute("listDetailOrder", listDetailOrder);
			for (DetailOrder detailOrder : listDetailOrder) {
				Book pro = proDao.getItem(detailOrder.getId_pro());
				hashDetail.put( detailOrder,pro);
			}
			
			modelMap.addAttribute("hashDetail", hashDetail);
		}
		else {
			modelMap.addAttribute("hashDetail", hashDetail);
			modelMap.addAttribute("listDetailOrder", new ArrayList<DetailOrder>());
		}
		
		
		return "public.checkout";
	}
	
	@RequestMapping("/forgot-password")
	public String resetPassword(){
		return "public.forgotPassword";
	}
	
	
	@RequestMapping(value="/forgot-password",method=RequestMethod.POST)
	public String resetPassword(@ModelAttribute("user") User user){
		
		User user1 = userDao.getItemByUsernameAndEmail(user);
		
		if(user1 != null) {
			if(user1.getRole_id() != 1)
			{
				Random rnd = new Random();
				String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
				 StringBuilder newPassWord = new StringBuilder(12);
			       for( int i = 0; i < 12; i++ ) 
			    	   newPassWord.append( AB.charAt( rnd.nextInt(AB.length()) ) );
			       userDao.setPassword(password1.encode(newPassWord.toString()),user1.getId());
			     SendMail.send(user.getEmail(), "RESET YOUR PASSWORD", "YOUR NEWS PASSWORD : " + newPassWord, "phucpham9649@gmail.com", "phamthephuc");
			     
			}
		}
		return "redirect:/dang-nhap";
	}
	
	

	@RequestMapping("/chi-tiet-don-hang/{id}")
	public String edit(ModelMap modelMap,@PathVariable("id") int id) {
		modelMap.addAttribute("order", orderDao.getItem(id));
		modelMap.addAttribute("listStatus", statusDao.getItems());
		List<DetailOrder> listDetailOrder = detailOrderDao.getItemsByIdOrder(id);
		modelMap.addAttribute("listDetailOrder", listDetailOrder);
		modelMap.addAttribute("shipFee", Defines.SHIP_FEE);
		modelMap.addAttribute("freeShipPrice", Defines.FREE_SHIP_PRICE);
		return "public.customer.detailorder";
	}


	@RequestMapping(value="/huy-don-hang/{id}",method=RequestMethod.POST)
	public String huyDonHang(ModelMap modelMap,@PathVariable("id") int id) {
		orderDao.huyDonHang(id);
		List<DetailOrder> listDetailOrder = detailOrderDao.getItemsByIdOrder(id);
		
		for (DetailOrder detailOrder : listDetailOrder) {
			proDao.subNum(-detailOrder.getQty(), detailOrder.getId_pro());
		}
		return "redirect:/xem-thong-tin";
			
	}
	
}
