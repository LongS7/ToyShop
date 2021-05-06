package com.se.toyshop.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimerEditor);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void add(@ModelAttribute("user") User user) {
		userDao.addUser(user);
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLoginForm(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		String errorMessage = null;
		if (error != null) {
			errorMessage = "Tên đăng nhập hoặc mật khẩu không chính xác";
		}
		if (logout != null) {
			errorMessage = "Bạn đã đăng xuất thành công";
		}
		return new ModelAndView("loginForm", "errorMessage", errorMessage);
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String processLogin(@ModelAttribute("user") @Valid User user, BindingResult errors) {
		
		return "redirect:/";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView showRegistrationForm() {
		return new ModelAndView("registerForm", "user", new User());
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String processRegistration(@ModelAttribute("user") @Valid User user, BindingResult errors) {
		if (errors.hasErrors()) {
			return "registerForm";
		}

		userDao.addUser(user);
		return "redirect:/";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String showUserProfile() {
		return "profile";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String testFindUserByUsername() {
		System.out.println(userDao.findByUsername("binhht"));
		return "redirect:/";
	}
}
