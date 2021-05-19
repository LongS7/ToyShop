package com.se.toyshop.controller;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.entity.Product;

@Controller
@RequestMapping("/danh-muc")
public class CategoryController {
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping("/{category_id}")
	public String showProductsByCategoryId(@PathVariable("category_id") ObjectId id,Model model) {
		System.out.println(id);
		List<Product> list =  new ArrayList();
		list = productDAO.getProductByCategoryId(id);
		System.out.println(list.size());
		model.addAttribute("products", list);
		
		return "product";
	}
}
