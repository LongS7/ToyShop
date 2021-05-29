package com.se.toyshop.controller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.entity.Comment;
import com.se.toyshop.entity.Product;
import com.se.toyshop.entity.User;

@Controller
@RequestMapping("comments")
public class CommentController {
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addComment(HttpServletRequest req, @RequestParam ObjectId productId, @RequestParam int rating,
			@RequestParam(name = "comment", required = false) String content) {
		User user = (User) req.getAttribute("currentUser");
		if(user == null)
			return "redirect:/user/login";
		
		Comment comment = new Comment(rating, content, LocalDateTime.now(), user);
		
		Product product = productDAO.getProductById(productId);
		product.addComment(comment);
		
		productDAO.updateProduct(product);
		
		return "redirect:/order/my-order";
	}
	
}
