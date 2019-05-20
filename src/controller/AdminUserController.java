package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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
import model.bean.Order;
import model.bean.User;
import model.dao.OrderDao;
import model.dao.RolesDao;
import model.dao.UserDao;
import service.CallApiService;

@Controller
@RequestMapping("/admin")
public class AdminUserController {

	@Autowired
	private BCryptPasswordEncoder password;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RolesDao rolesDao;
	
	
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
	
	@RequestMapping(value="/users",method=RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("listUser", userDao.getItems());
		return "admin.user.index";
	}
	
	@RequestMapping(value="/user/add",method=RequestMethod.GET)
	public String add(ModelMap modelMap) {
		modelMap.addAttribute("listRole", rolesDao.getItems());
		return "admin.user.add";
	}
	
	@RequestMapping(value="/user/add",method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute("user") User user,BindingResult br,RedirectAttributes attributes,ModelMap modelMap) {
		if(br.hasErrors()) {
			modelMap.addAttribute("user", user);
			return "redirect:/admin/user/add";
		}
		user.setPassword(password.encode(user.getPassword()));
		if(userDao.addItem(user)>0) {
			attributes.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			attributes.addFlashAttribute("msg", Defines.ERROR);
		}	
		return "redirect:/admin/users";
	}
	
	private void deleteUserInRecommendSystem(Integer id_user) {
		LinkedMultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
        params.add("id_user", id_user);
        CallApiService.getInstance().callPostFromRecommendServer(params, "deleteUser");
	}
	
	@RequestMapping(value="/user/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") int id,RedirectAttributes attributes) {
		User user = userDao.getItem(id);
		if(user.getId()==1) {
			attributes.addFlashAttribute("msg",Defines.NOT_ALLOWED );
		}else {
			if(userDao.delItem(id)>0) {
				if (user.getRole_id() == 3) {
					deleteUserInRecommendSystem(id);
				}
				attributes.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				attributes.addFlashAttribute("msg", Defines.ERROR);
			}
		}
		return "redirect:/admin/users";
	}
	
	@RequestMapping(value="/user/edit/{id}",method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id,ModelMap modelMap) {
		User user = userDao.getItem(id);
		if(user!=null) {
			modelMap.addAttribute("listRole", rolesDao.getItems());
			modelMap.addAttribute("user", user);
		}
		return "admin.user.edit";
	}
	
	@RequestMapping(value="/user/edit/{id}",method=RequestMethod.POST)
	public String edit(@ModelAttribute("user") User user,@RequestParam("matkhau") String matkhau,RedirectAttributes attributes,HttpSession session,@PathVariable("id") int id) {
		if(!matkhau.equals("")) {
			user.setPassword(password.encode(matkhau));
		}
		else {
			user.setPassword(userDao.getItem(id).getPassword() );
		}
		
		user.setUsername(userDao.getItem(id).getUsername() );
		user.setId(id);
		if(userDao.editItem(user)>0) {
			attributes.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			attributes.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/users";
	}
}
