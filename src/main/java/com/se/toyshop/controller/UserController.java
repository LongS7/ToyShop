package com.se.toyshop.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.UserDao;
import com.se.toyshop.entity.ShippingAddress;
import com.se.toyshop.entity.User;
import com.se.toyshop.service.UserPrincipal;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private PasswordEncoder passwordEncoder;

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

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView updateUserProfile(@Valid @ModelAttribute("user") User user, BindingResult errors,
			@RequestParam(required = false) String oldPassword, @RequestParam(required = false) String newPassword,
			@RequestParam(required = false) String reNewPassword) {

		if (errors.hasErrors()) {
			return new ModelAndView("userInfo");
		}

		boolean isUpdated = false;

		User tempUser = userDao.findByUsername(user.getAccount().getUsername());

		if (oldPassword != null && newPassword != null && reNewPassword != null) {
			if (passwordEncoder.matches(oldPassword, tempUser.getAccount().getPassword())
					&& newPassword.equals(reNewPassword)) {
				user.getAccount().setPassword(passwordEncoder.encode(newPassword));
				user.set_id(tempUser.get_id());
				isUpdated = userDao.update(user);
			}
		} else {
			user.set_id(tempUser.get_id());
			isUpdated = userDao.update(user);
		}

		if (isUpdated) {
			return new ModelAndView("userInfo", "message", "Cập nhật thành công");
		} else {
			return new ModelAndView("userInfo", "message", "Cập nhật thất bại");
		}
	}

	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public ModelAndView showUserAddress(@AuthenticationPrincipal UserPrincipal userPrincipal) {
		String username = userPrincipal.getUsername();
		User user = userDao.findByUsername(username);
		return new ModelAndView("userAddress", "user", user);
	}

	@RequestMapping(value = "/address/create/{id}", method = RequestMethod.GET)
	public ModelAndView showAddressForm(@PathVariable String id) {
		return new ModelAndView("addressForm", "id", id);
	}

	@RequestMapping(value = "/address/create/{id}", method = RequestMethod.POST)
	public ModelAndView processAddressForm(@PathVariable String id, @RequestParam(required = false) String provinceList,
			@RequestParam(required = false) String districtList, @RequestParam(required = false) String wardList,
			@RequestParam(required = false) String street) {
		ShippingAddress shippingAddress = new ShippingAddress(street, wardList, districtList, provinceList);
		
		User user = userDao.getUser(id);
		
		user.getShippingAddresses().add(shippingAddress);
		
		boolean result = userDao.update(user);
		
		String message = null;
		if (result) {
			message = "Thêm địa chỉ thành công";
		} else {
			message = "Thêm địa chỉ thất bại";
		}
		return new ModelAndView("addressForm", "message", message);
	}
}