package com.se.toyshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.ProductDAO;

@Controller
public class HomeController {
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("index");
		
		mav.addObject("bestProduct", productDAO.getAllProducts(1, 20));
		
		return mav;
	}
}
