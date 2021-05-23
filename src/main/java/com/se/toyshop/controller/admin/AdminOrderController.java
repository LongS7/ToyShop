package com.se.toyshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.OrderDAO;

@Controller
@RequestMapping("/admin/manage-orders")
public class AdminOrderController {
	@Autowired
	private OrderDAO orderDAO;
	
	@RequestMapping(value = {"/", "/list-order"})
	public ModelAndView manageOrder(@RequestParam(name = "p", required = false, defaultValue = "1") int page,
			@RequestParam(name = "sort_date", required = false, defaultValue = "-1") int sortDate,
			HttpServletRequest req) {
		if(req.getAttribute("currentUser") == null)
			return new ModelAndView("redirect:/user/login");
		
		if(page < 1)
			page = 1;
		
		return new ModelAndView("admin/order-list", "orders", orderDAO.getAll(page, sortDate));
	}
}
