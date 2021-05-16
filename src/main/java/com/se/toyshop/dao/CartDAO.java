package com.se.toyshop.dao;

import java.util.List;

import com.se.toyshop.entity.Product;
import com.se.toyshop.entity.ShoppingCartItem;
import com.se.toyshop.entity.User;

public interface CartDAO {
	User getUser();
	Product getProduct(String id);
	boolean addCartItem(User user, ShoppingCartItem cartItem);
	boolean updateCartItem(User user, ShoppingCartItem cartItem);
	boolean removeCartItem(User user, ShoppingCartItem cartItem);
	boolean removeCartItems(User user, List<ShoppingCartItem> cartItems);
}
