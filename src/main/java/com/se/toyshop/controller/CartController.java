package com.se.toyshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.CartDAO;
import com.se.toyshop.entity.ShoppingCartItem;
import com.se.toyshop.entity.User;

@Controller
@RequestMapping("/mycart")
public class CartController {
	@Autowired
	private CartDAO cartDAO;
	
	@RequestMapping("list")
	public ModelAndView showCart(HttpSession session) {
		User user = (User) session.getAttribute("currentUser");
		user = cartDAO.getUser();
		
		ModelAndView modelAndView = new ModelAndView("cart");
		
		if(user == null) {
			//Get cart form Session
			modelAndView.addObject("cart", session.getAttribute("myCart"));
			
		} else {
			//Get cart from DB
			List<ShoppingCartItem> list = user.getListShoppingCartItem();
			
			modelAndView.addObject("cart", list);
			
		}
		
		return modelAndView;
	}
}
