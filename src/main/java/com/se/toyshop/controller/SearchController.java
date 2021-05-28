package com.se.toyshop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.entity.Product;

@Controller
public class SearchController {
	@Autowired
	private ProductDAO productDAO;
	@RequestMapping("/tim-kiem")
	public String showProductNameOrSku(@RequestParam("query") String query, Model model,
			@RequestParam("page") int page, @RequestParam("limit") int limit) {

		int totalItem = productDAO.getProductByNameOrSku(query).size();
		
//		System.out.println(totalItem);
		List<Product> list = new ArrayList<Product>();
		
		list = productDAO.getProductByNameOrSku(query, page, limit);
		
//		System.out.println("list: " + list.size());

		model.addAttribute("products", list);
		model.addAttribute("totalPage", (int) Math.ceil((double) totalItem / limit));
		model.addAttribute("page", page);
		model.addAttribute("keyword", query);
		

		return "product-search";

	}
}
