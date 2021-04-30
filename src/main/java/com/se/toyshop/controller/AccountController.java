package com.se.toyshop.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.toyshop.entity.Account;

@Configuration
@RequestMapping("/account")
public class AccountController {
	@RequestMapping("/login")
	public String showLoginForm(Model model) {
		Account account = new Account();
		model.addAttribute("account", account);
		return "loginForm";
	}
}
