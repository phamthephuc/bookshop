package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class ErrorController {
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap) {
		
	}
	
	@RequestMapping("/403")
	public String index(){
		return "error403";
	}
}
