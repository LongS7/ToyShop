package com.se.toyshop.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
import com.se.toyshop.service.UserPrincipal;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserDao userDao;

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

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView showUserProfile(@AuthenticationPrincipal UserPrincipal userDetails) {
		String username = userDetails.getUsername();
		User user = userDao.findByUsername(username);
		return new ModelAndView("userInfo", "user", user);
	}

//	@RequestMapping(value = "/editUser", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
//	public ModelAndView updateUserProfile(@Valid @ModelAttribute("user") User user, BindingResult errors,
//			@RequestParam(value = "newPassword", required = false) String newPassword,
//			@RequestParam(value = "reNewPassword", required = false) String reNewPassword) {
//		if (errors.hasErrors()) {
//			return new ModelAndView("userInfo");
//		}
//
//		boolean isUpdated = false;
//
//		User tempUser = userDao.findByUsername(user.getAccount().getUsername());
//
//		if (!tempUser.getAccount().getPassword().isEmpty() && newPassword != null && reNewPassword != null) {
//			if (user.getAccount().getPassword().equals(tempUser.getAccount().getPassword())
//					&& newPassword.equals(reNewPassword)) {
//				tempUser.getAccount().setPassword(newPassword);
//				isUpdated = userDao.update(tempUser);
//			}
//		} else {
//			isUpdated = userDao.update(user);
//		}
//
//		if (isUpdated) {
//			return new ModelAndView("userInfo", "message", "Cập nhật thành công");
//		} else {
//			return new ModelAndView("userInfo", "message", "Cập nhật thất bại");
//		}
//	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String testEdit() {
		return "redirect:/";
	}

	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String showAddressForm() {
		return "addressForm";
	}
}