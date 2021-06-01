package com.se.toyshop.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.CartDAO;
import com.se.toyshop.dao.OrderDAO;
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
	private JavaMailSender mailSender;
	
	@Autowired
	private Environment env;
		
	@RequestMapping("/my-order")
	public ModelAndView showMyOrders(HttpServletRequest req) {
		User user = (User) req.getAttribute("currentUser");
		if(user == null)
			return new ModelAndView("redirect:/user/login");
		
		return new ModelAndView("order", "myOrders", orderDAO.getOrdersOfCustomer(user.get_id()));
	}
	
	@RequestMapping("/my-order/{id}")
	public ModelAndView showMyOrders(@PathVariable String id, HttpServletRequest req) {
		User user = (User) req.getAttribute("currentUser");
		if(user == null)
			return new ModelAndView("redirect:/user/login");
		
		return new ModelAndView("order-detail", "order", orderDAO.getOrder(id));
	}
	
	@RequestMapping("/my-order/filter")
	public ModelAndView showMyOrders(@RequestParam("state") int state, HttpServletRequest req) {
		User user = (User) req.getAttribute("currentUser");
		if(user == null)
			return new ModelAndView("redirect:/user/login");
		
		return new ModelAndView("order", "myOrders", orderDAO.getOrdersOfCustomer(user.get_id(), state));
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addOrder(HttpSession session, HttpServletRequest req,
			@RequestParam(name = "message", required = false, defaultValue = "0") int message) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		
		Order order = new Order();
		
		User user = (User) req.getAttribute("currentUser");
		if(user == null)
			return new ModelAndView("redirect:/user/login");
		
		order.setUser(user);
		order.setPhone(user.getPhone());
				
		List<ShoppingCartItem> cartItems = user.getListShoppingCartItem();
		
		if(cartItems.size() == 0)
			return new ModelAndView("redirect:/mycart/");
		
		for(ShoppingCartItem item : cartItems) {
			if(item.getQuantity() > item.getProduct().getUnitInStock())
				return new ModelAndView("redirect:/mycart/");
			
			order.addOrderDetail(item.getProduct(), item.getQuantity());
		}
		
		return new ModelAndView("order-form", "order", order);
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addOrder(@Valid @ModelAttribute("order") Order order, 
			@RequestParam(name = "address", required = false, defaultValue = "-1") int pos, 
			HttpServletRequest req) throws IOException {
		User user = (User) req.getAttribute("currentUser");
		if(user == null)
			return "redirect:/user/login";
		
		order.setUser(user);
		order.setState(1);
		
		if(pos >= 0 && pos < user.getShippingAddresses().size())
			order.setShippingAddress(user.getShippingAddresses().get(pos));
		else {
			return "redirect:/order/add?message=-1";
		}
		
		List<ShoppingCartItem> cartItems = user.getListShoppingCartItem();
		
		for(ShoppingCartItem item : cartItems) {
			order.addOrderDetail(item.getProduct(), item.getQuantity());
		}
		
		if(order.getOrderDetails() == null || order.getOrderDetails().size() == 0)
			return "redirect:/mycart/list";
		
		order.setOrderDate(LocalDate.now());
		
		if(orderDAO.addOrder(order)) {
			cartDAO.removeCartItems(user, cartItems);
			
			SimpleMailMessage mailMessage = new SimpleMailMessage();
			mailMessage.setSubject("Toy Shop - Đặt hàng thành công!");
			mailMessage.setText("Đơn hàng của quý khách hiện đang được xử lý!\nXem chi tiết hóa đơn tại " + "http://localhost:8080/" + req.getContextPath() + "/order/my-order");
			mailMessage.setTo(user.getEmail());
			mailMessage.setFrom(env.getProperty("support.email"));
			
			mailSender.send(mailMessage);
		}
		
		return "redirect:/order/my-order";
	}
	
	
	
	@RequestMapping(value = "/cancel/{id}", method = RequestMethod.GET)
	public String cancelOrder(@PathVariable String id, HttpServletRequest req) {
		User user = (User) req.getAttribute("currentUser");
		if(user == null)
			return "redirect:/user/login";
		
		Order order = orderDAO.getOrder(id);
		
		if(order.getState() == 1) {
			order.setState(-1);
			orderDAO.updateOrder(order);
		}
		
		return "redirect:/order/my-order";
	}
}
