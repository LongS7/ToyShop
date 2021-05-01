package com.se.toyshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.toyshop.entity.Account;
import com.se.toyshop.entity.User;

@Controller
@RequestMapping("/account")
public class AccountController {
	@RequestMapping("/login")
	public String showLoginForm(Model model) {
		Account account = new Account();
		model.addAttribute("account", account);
		return "loginForm";
	}
	
	@RequestMapping("/register")
	public String showRegisterForm(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "registerForm";
	}
}
