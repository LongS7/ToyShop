package com.se.toyshop.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.entity.Order;

@Controller
@RequestMapping("/order")
public class OrderController {
	@RequestMapping("/my-order")
	public String showMyOrders() {
		return "order";
	}
	
	@RequestMapping("/new")
	public void newOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(!checkLogin(request)) {
			response.sendRedirect(request.getServletContext().getContextPath() + "/account/login");
		} else {
			response.sendRedirect("/add");
		}
	}
	
	@RequestMapping("/add")
	public ModelAndView addOrder() {
		return new ModelAndView("order-form", "order", new Order());
	}

	private boolean checkLogin(HttpServletRequest request) {
		for(Cookie cookie : request.getCookies()) {
			if(cookie.getName().equals("userId")) {
				return true;
			}
		}
		
		return false;
	}
}
