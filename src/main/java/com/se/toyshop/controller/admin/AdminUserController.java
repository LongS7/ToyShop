package com.se.toyshop.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.UserDao;
import com.se.toyshop.entity.User;

@Controller
@RequestMapping("/admin/manage-users")
public class AdminUserController {

	@Autowired
	private UserDao userDao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView showManagementUserPage() {
		List<User> users = userDao.findAll();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalUser", users.size());
		map.put("totalFemaleUser", userDao.getQuantityFemaleUser());
		map.put("totalMaleUser", userDao.getQuantityMaleUser());
		map.put("totalUserNotOrder", userDao.getQuantityUserNotOrder());
		map.put("users", users);

		return new ModelAndView("admin/user-list", map);
	}

}
