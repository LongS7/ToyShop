package com.se.toyshop.controller;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.entity.Product;

@Controller
@RequestMapping("/danh-muc")
public class CategoryController {
	@Autowired
	private ProductDAO productDAO;
	
//	@RequestMapping("/{category_id}")
//	public ModelAndView showProductsByCategoryId(@PathVariable("category_id") ObjectId id,Model model) {
//		List<Product> list =  null;
//		list = productDAO.getProductByCategoryId(id);
//
//		model.addAtr("products", list);
//
//		
//		
//		return "redir";
//	}
	@RequestMapping("/{category_id}")
	public String showProductsByCategoryId(@PathVariable("category_id") ObjectId id,Model model
			,@RequestParam("page") int page,@RequestParam("limit") int limit) {

		List<Product> list =  new ArrayList<Product>();
		list = productDAO.getProductByCategoryId(id,page,limit);
		System.out.println(list.size());
		model.addAttribute("products", list);
		model.addAttribute("id",id);
		model.addAttribute("totalPage",list.size()/20 + 1);
		model.addAttribute("page", page);
		return "product";
	}
}
