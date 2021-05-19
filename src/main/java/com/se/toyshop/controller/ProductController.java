package com.se.toyshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.toyshop.dao.CategoryDAO;
import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.entity.Product;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@RequestMapping("info")
	public String showInfo(Model model) {		
		Product p = productDAO.getProduct();
		
		model.addAttribute("product", p);
		
		return "userInfo";
	}
	@RequestMapping("/demo")
	public String showDemo(Model model) {
		
		System.out.println(categoryDAO.getAllDescriptions());
		
		
		System.out.println(categoryDAO.getAllCategories());
		return "product-detail";
	}
}
