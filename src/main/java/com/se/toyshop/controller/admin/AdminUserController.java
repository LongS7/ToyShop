package com.se.toyshop.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
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
import com.se.toyshop.entity.User;

@Controller
@RequestMapping("/admin/manage-users")
public class AdminUserController {

	@Autowired
	private PasswordEncoder passwordEncoder;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@Autowired
	private UserDao userDao;

	private Map<String, Object> calculateQuantityUser() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> users = userDao.findAll();
		map.put("totalUser", users.size());
		map.put("totalFemaleUser", userDao.getQuantityFemaleUser());
		map.put("totalMaleUser", userDao.getQuantityMaleUser());
		map.put("totalUserNotOrder", userDao.getQuantityUserNotOrder());
		map.put("users", users);

		return map;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView showManagementUserPage() {
		Map<String, Object> result = calculateQuantityUser();
		result.put("totalOrder", userDao.getTotalOrder());
		return new ModelAndView("admin/user-list", result);
	}

	@RequestMapping(value = "/info/{userId}", method = RequestMethod.GET)
	public ModelAndView showDetailUserInfo(@PathVariable String userId) {
		User user = userDao.getUser(userId);
		Map<String, Object> result = calculateQuantityUser();

		result.put("user", user);

		return new ModelAndView("admin/detail-user-info", result);
	}

	@RequestMapping(value = "/edit/{userId}", method = RequestMethod.GET)
	public ModelAndView showEditUserInfoForm(@PathVariable String userId) {
		Map<String, Object> result = calculateQuantityUser();

		result.put("user", userDao.getUser(userId));

		return new ModelAndView("admin/edit-user-form", result);
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView updateUserProfile(@Valid @ModelAttribute("user") User user, BindingResult errors,
			@RequestParam(required = false) String oldPassword, @RequestParam(required = false) String newPassword,
			@RequestParam(required = false) String reNewPassword) {
		if (errors.hasErrors()) {
			return new ModelAndView("/admin/edit-user-form");
		}

		boolean isUpdated = false;

		User tempUser = userDao.findByUsername(user.getAccount().getUsername());
		
		user.setRole(tempUser.getRole());
		user.setShippingAddresses(tempUser.getShippingAddresses());
		user.setListShoppingCartItem(tempUser.getListShoppingCartItem());
		
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
		Map<String, Object> result = calculateQuantityUser();
		if (isUpdated) {
			result.put("successMessage", "Cập nhật thành công");
			return new ModelAndView("/admin/edit-user-form", result);
		} else {
			result.put("errorMessage", "Cập nhật thất bại");
			return new ModelAndView("/admin/edit-user-form", result);
		}
	}

	@RequestMapping(value = "/delete/{userId}", method = RequestMethod.GET)
	public ModelAndView deleteUser(@PathVariable String userId) {
		User user = new User();
		user.set_id(new ObjectId(userId));
		userDao.delete(user);

		return new ModelAndView("redirect:/admin/manage-users/");
	}

}
