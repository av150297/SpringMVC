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
	public ModelAndView welcome(Principal principal) {
		ModelAndView mv=new ModelAndView();
		if(principal!=null) {
			mv.setViewName("dashboard");
			return mv;
		}
		mv.setViewName("home");
		User user=new User();
		mv.addObject("user",user);
		return mv;

	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView model = new ModelAndView("login");
		return model;

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		model.addAttribute("message", "You have successfully logged off from application !");
		return "redirect:/";
		//return model;

	}

	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(Model model) {
		model.addAttribute("error", "true");
		return "redirect:/";

	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register() {
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerProcess(@Valid @ModelAttribute("user") User user,BindingResult result) {
		
		if(result.hasErrors()) {
			return "redirect:/";
		}
		else {
			
			if(!user.getPassword().equals(user.getMpassword())) {
				return "redirect:/";
			}
			if(userdao.getUserbyusername(user.getUsername())!=null) {
				return "redirect:/";
			}
			userdao.saveOrUpdate(user);
			return "redirect:/";
		}
	}
}
