package com.se.toyshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.CartDAO;
import com.se.toyshop.dao.UserDao;
import com.se.toyshop.entity.ShoppingCartItem;
import com.se.toyshop.entity.User;

@Controller
@RequestMapping("/mycart")
public class CartController {
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value = {"/list", "/"})
	public ModelAndView showCart(HttpSession session) {		
		ModelAndView modelAndView = new ModelAndView("cart");
		
		User user = getCurrentUser();
		
		if(user != null) {			
			//Get cart from DB
			List<ShoppingCartItem> list = user.getListShoppingCartItem();
			if(list == null)
				list = new ArrayList<ShoppingCartItem>();
			
			modelAndView.addObject("cart", list);
			
		} else {
			//Get cart form Session
			@SuppressWarnings("unchecked")
			List<ShoppingCartItem> cartItems =  (List<ShoppingCartItem>) session.getAttribute("myCart");
			
			if(cartItems == null)
				cartItems = new ArrayList<ShoppingCartItem>();
				
			modelAndView.addObject("cart", cartItems);
		}
		
		return modelAndView;
	}

	@RequestMapping("/add")
	public ModelAndView addCartItem(HttpSession session, @RequestParam("productId") String id) {
		User user = getCurrentUser();
		
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
		User user = getCurrentUser();
		
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
		User user = getCurrentUser();
		
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
	
	private User getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if(authentication.isAuthenticated()) {
			String username;
			if(authentication.getPrincipal() instanceof UserDetails)
				username = ((UserDetails) authentication.getPrincipal()).getUsername();
			else
				username = authentication.getPrincipal().toString();
			
			User user = userDao.findByUsername(username);
			
			return user;
		}
		
		return null;
	}
}
