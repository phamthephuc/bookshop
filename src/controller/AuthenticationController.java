package controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import constant.Defines;
import model.bean.User;
import model.dao.UserDao;
import util.SendMail;

@Controller
@RequestMapping("auth")
public class AuthenticationController {
	@Autowired
	private Defines defines;
	
	@Autowired
	private BCryptPasswordEncoder password1;
	
	@Autowired
	private UserDao userDao;
	
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
	}
	
	@RequestMapping("/login")
	public String index(HttpServletRequest request){
		return "auth.login";
	}
	
	@RequestMapping("/reset-password")
	public String resetPassword(){
		return "auth.resetPassword";
	}
	
	@RequestMapping(value="/reset-password",method=RequestMethod.POST)
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
		return "redirect:/auth/login";
	}
}
