package com.dbms;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dbms.dao.Userdao;
import com.dbms.model.User;

@Controller
public class LoginController {

	@Autowired
	public Userdao userdao;
	
	@RequestMapping(value = "/")
	public String welcome(Model model, Principal principal) {
		if(principal!=null) {
			return "redirect:/dashboard";
		}
		model.addAttribute("name", "Home Page");
		model.addAttribute("description", "unsecured page !");
		return "home";

	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView model = new ModelAndView("login");
		return model;

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		model.addAttribute("message", "You have successfully logged off from application !");
		return "redirect:/login";
		//return model;

	}

	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public ModelAndView loginError() {
		ModelAndView model = new ModelAndView("login");
		model.addObject("error", "true");
		return model;

	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public ModelAndView register() {
		
		ModelAndView model = new ModelAndView("register");
		User user = new User();
		model.addObject("user", user);
		return model;
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public ModelAndView registerProcess(@Valid @ModelAttribute("user") User user,BindingResult result) {
		
		if(result.hasErrors()) {
			return new ModelAndView("register");
		}
		else {
			
			if(!user.getPassword().equals(user.getMpassword())) {
				ModelAndView model = new ModelAndView("register");
				model.addObject("error","passwords dont match");
				return model;
			}
			if(userdao.getUserbyusername(user.getUsername())!=null) {
				ModelAndView model = new ModelAndView("register");
				model.addObject("error", "username exists");
				return new ModelAndView("register");
			}
			userdao.saveOrUpdate(user);
			ModelAndView mv=new ModelAndView("home");
			mv.addObject("name","Noobie");
			mv.addObject("description","You can login and register from here...!");
			return mv;
		}
	}
}
