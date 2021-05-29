package com.se.toyshop.controller.admin;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.OrderDAO;
import com.se.toyshop.entity.Order;

@Controller
@RequestMapping("/admin/manage-orders")
public class AdminOrderController {
	@Autowired
	private OrderDAO orderDAO;
	
	@RequestMapping(value = {"/", "/list-order"})
	public ModelAndView manageOrder(@RequestParam(name = "p", required = false, defaultValue = "1") int page,
			@RequestParam(name = "sort_date", required = false, defaultValue = "-1") int sortDate,
			HttpServletRequest req,
			@RequestParam(required = false) String dateFrom,
			@RequestParam(required = false) String dateTo,
			@RequestParam(required = false, defaultValue = "-2") int state) {
		
		if(req.getAttribute("currentUser") == null)
			return new ModelAndView("redirect:/user/login");
		
		LocalDate fromDate = null;
		LocalDate toDate = null;
		if(dateFrom != null && !dateFrom.isBlank())
			fromDate = LocalDate.parse(dateFrom);
		if(dateTo != null && !dateTo.isBlank())
			toDate = LocalDate.parse(dateTo);
		
		if(page < 1)
			page = 1;
		
		if(fromDate == null && toDate == null && state == -2)
			return new ModelAndView("admin/order-list", "orders", orderDAO.getAll(page, sortDate));
		else {
			return new ModelAndView("admin/order-list", "orders", orderDAO.getOrders(fromDate, toDate, state, page, sortDate));
		}
	}
	
	@RequestMapping(value = {"/{id}", "/list-order/{id}"})
	public ModelAndView manageOrder(@PathVariable String id,
			HttpServletRequest req) {
		if(req.getAttribute("currentUser") == null)
			return new ModelAndView("redirect:/user/login");
		
		return new ModelAndView("admin/order-detail", "order", orderDAO.getOrder(id));
	}
	
	@RequestMapping("/update/{id}")
	public ModelAndView manageOrder(HttpServletRequest req, @PathVariable("id") String orderId) {
		if(req.getAttribute("currentUser") == null)
			return new ModelAndView("redirect:/user/login");
		
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/manage-orders/");
		
		Order order = orderDAO.getOrder(orderId);
		if(order == null) {
			modelAndView.addObject("message", "Không tìm thấy đơn hàng nào!");
			return modelAndView;
		}
		
		if(order.getState() >= 0 && order.getState() < 2) {
			order.setState(order.getState() + 1);
			orderDAO.updateOrder(order);
			modelAndView.addObject("message", "Cập nhật thành công!");
		}
		
		return modelAndView;
	}
}
