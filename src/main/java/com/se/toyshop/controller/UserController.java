package com.se.toyshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.se.toyshop.dao.impl.UserImpl;
import com.se.toyshop.entity.User;

@Controller
@RequestMapping("/user")
public class UserController {
	private UserImpl userDao = new UserImpl();
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void add(@ModelAttribute("user") User user) {
		userDao.addUser(user);
	}
}
