package com.se.toyshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.CartDAO;
import com.se.toyshop.entity.ShoppingCartItem;
import com.se.toyshop.entity.User;

@Controller
@RequestMapping("/mycart")
public class CartController {
	@Autowired
	private CartDAO cartDAO;
	
	@RequestMapping(value = {"/list", "/"})
	public ModelAndView showCart(HttpSession session) {
		User user = (User) session.getAttribute("currentUser");
		
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

	@RequestMapping("/add")
	public ModelAndView addCartItem(HttpSession session, @RequestParam("productId") String id) {
		User user = (User) session.getAttribute("currentUser");
		
		ShoppingCartItem cartItem = new ShoppingCartItem(cartDAO.getProduct(id), 1);
		
		if(user == null) {
			@SuppressWarnings("unchecked")
			List<ShoppingCartItem> cartItems = (List<ShoppingCartItem>) session.getAttribute("myCart");
			
			if(cartItems == null)
				cartItems = new ArrayList<ShoppingCartItem>();
			
			if(!cartItems.contains(cartItem))
				cartItems.add(cartItem);
			
			session.setAttribute("myCart", cartItems);
			
			return new ModelAndView("cart", "cart", cartItems);
		} 
		
		cartDAO.addCartItem(user, cartItem);
		
		return new ModelAndView("cart", "cart", user.getListShoppingCartItem());
	}
	
	@RequestMapping("/remove")
	public ModelAndView removeCartItem(HttpSession session, @RequestParam("productId") String id) {
		User user = (User) session.getAttribute("currentUser");
		
		ShoppingCartItem cartItem = new ShoppingCartItem(cartDAO.getProduct(id), 1);
		
		if(user == null) {
			@SuppressWarnings("unchecked")
			List<ShoppingCartItem> cartItems = (List<ShoppingCartItem>) session.getAttribute("myCart");
			
			if(cartItems == null)
				return new ModelAndView("cart");
			
			if(cartItems.contains(cartItem))
				cartItems.remove(cartItem);
			
			session.setAttribute("myCart", cartItems);
			
			return new ModelAndView("cart", "cart", cartItems);
		} 
		
		cartDAO.removeCartItem(user, cartItem);
		
		return new ModelAndView("cart", "cart", user.getListShoppingCartItem());
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public ModelAndView updateCartItem(HttpSession session, @RequestParam("productId") String id, @RequestParam("q") String quantity) {
		User user = (User) session.getAttribute("currentUser");
		
		ShoppingCartItem cartItem = new ShoppingCartItem(cartDAO.getProduct(id), Integer.parseInt(quantity));
		
		if(user == null) {
			@SuppressWarnings("unchecked")
			List<ShoppingCartItem> cartItems = (List<ShoppingCartItem>) session.getAttribute("myCart");
			
			if(cartItems == null)
				return new ModelAndView("cart");
			
			if(cartItems.contains(cartItem))
				cartItems.set(cartItems.indexOf(cartItem), cartItem);
			
			session.setAttribute("myCart", cartItems);
			
			return new ModelAndView("cart", "cart", cartItems);
		} 
		
		cartDAO.updateCartItem(user, cartItem);
		
		return new ModelAndView("cart", "cart", user.getListShoppingCartItem());
	}
}
