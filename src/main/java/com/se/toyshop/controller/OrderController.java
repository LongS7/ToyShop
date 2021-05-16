package com.se.toyshop.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.CartDAO;
import com.se.toyshop.dao.OrderDAO;
import com.se.toyshop.dao.UserDao;
import com.se.toyshop.entity.Order;
import com.se.toyshop.entity.ShoppingCartItem;
import com.se.toyshop.entity.User;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping("/my-order")
	public ModelAndView showMyOrders() {
		User user = getCurrentUser();
		if(user == null)
			return new ModelAndView("redirect:/user/login");
		
		return new ModelAndView("order", "myOrders", orderDAO.getOrdersOfCustomer(user.get_id()));
	}
	
	@RequestMapping("/my-order/{id}")
	public ModelAndView showMyOrders(@PathVariable String id) {
		User user = getCurrentUser();
		if(user == null)
			return new ModelAndView("redirect:/user/login");
		
		return new ModelAndView("order-detail", "order", orderDAO.getOrder(id));
	}
	
	@RequestMapping("/my-order/filter")
	public ModelAndView showMyOrders(@RequestParam("state") int state) {
		User user = getCurrentUser();
		if(user == null)
			return new ModelAndView("redirect:/user/login");
		
		return new ModelAndView("order", "myOrders", orderDAO.getOrdersOfCustomer(user.get_id(), state));
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addOrder(HttpSession session) {
		Order order = new Order();
		
		User user = getCurrentUser();
		
		if(user == null)
			return new ModelAndView("redirect:/user/login");
		
		order.setUser(user);
				
		List<ShoppingCartItem> cartItems = user.getListShoppingCartItem();
		
		for(ShoppingCartItem item : cartItems) {
			order.addOrderDetail(item.getProduct(), item.getQuantity());
		}
		
		return new ModelAndView("order-form", "order", order);
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addOrder(@ModelAttribute("order") Order order) throws IOException {
		User user = getCurrentUser();
		order.setUser(user);
		
		List<ShoppingCartItem> cartItems = user.getListShoppingCartItem();
		
		for(ShoppingCartItem item : cartItems) {
			order.addOrderDetail(item.getProduct(), item.getQuantity());
		}
		
		order.setOrderDate(LocalDate.now());
		
		orderDAO.addOrder(order);
		
		cartDAO.removeCartItems(user, cartItems);
		
		return "redirect:/order/my-order";
	}
	
	@RequestMapping(value = "/cancel/{id}", method = RequestMethod.GET)
	public String cancelOrder(@PathVariable String id) {
		Order order = orderDAO.getOrder(id);
		
		if(order.getState() == 0) {
			order.setState(-1);
			orderDAO.updateOrder(order);
		}
		
		return "redirect:/order/my-order";
	}

	private User getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if(authentication.isAuthenticated()) {
			String username;
			if(authentication.getPrincipal() instanceof UserDetails)
				username = ((UserDetails) authentication.getPrincipal()).getUsername();
			else
				username = authentication.getPrincipal().toString();
			
			User user = userDao.findByUsername(username);
			
			return user;
		}
		
		return null;
	}
}
