package com.se.toyshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mycart")
public class CartController {
	@RequestMapping("list")
	public ModelAndView showCart() {
		
		
		return new ModelAndView("cart");
	}
}
