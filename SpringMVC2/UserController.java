package com.springmvc.usercontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UserController {
	
	UserVerify check= new UserVerify();
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginUser() {
		
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String handlelogin(@RequestParam String name, 
							  @RequestParam String password, ModelMap model) {
		if(check.isValid(name, password)) {
			model.put("name", name);
			model.put(password,model );
			return "success";
		}
		else {
			//model.put("error", "Try again");
			return "error";
		}
		
	}
}