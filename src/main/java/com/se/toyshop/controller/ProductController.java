package com.se.toyshop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.toyshop.dao.CategoryDAO;
import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.entity.Product;

@Controller
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
	@RequestMapping("/san-pham")
	public String showAllProduct(Model model,@RequestParam("page") int page,@RequestParam("limit") int limit) {		
		List<Product> list =  new ArrayList<Product>();
		
		int totalItem = productDAO.getAllProducts().size();
		
		list = productDAO.getAllProducts(page,limit);
		System.out.println(list.size());
		model.addAttribute("products", list);
		model.addAttribute("id",null);
		model.addAttribute("totalPage",(int) Math.ceil((double) totalItem / limit)); // tính tổng số trang
		model.addAttribute("page", page);
		return "product";
	}
	@RequestMapping("/demo")
	public String showDemo(Model model) {
		
		System.out.println(categoryDAO.getAllDescriptions());
		
		
		System.out.println(categoryDAO.getAllCategories());
		return "product-detail";
	}
}
