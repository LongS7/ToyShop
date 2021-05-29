package com.se.toyshop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.entity.Product;

@Controller
@RequestMapping("/admin/manage-products")
public class AdminProductController {
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping(value = "/add")
	public String showFormForAdd(Model model) {
		
		
		Product product = new Product();
		model.addAttribute("product",product);
		
		return "admin/product-form";
	}
}
