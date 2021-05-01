package com.se.toyshop.controller;

import java.awt.List;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.UserDao;
import com.se.toyshop.entity.User;

@Controller
@RequestMapping("/user")
public class UserController {

	private UserDao userDao;

	@Autowired
	public UserController(UserDao userDao) {
		this.userDao = userDao;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void add(@ModelAttribute("user") User user) {
		userDao.addUser(user);
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLoginForm() {
		return new ModelAndView("loginForm", "user", new User());
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView showRegistrationForm() {
		return new ModelAndView("registerForm", "user", new User());
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String processRegistration(@ModelAttribute("user") User user) {
		System.out.println(user);
		userDao.addUser(user);
		return "product";
	}

}
