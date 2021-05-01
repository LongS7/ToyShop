package com.se.toyshop.dao;

import com.se.toyshop.entity.Product;
import com.se.toyshop.entity.ShoppingCartItem;
import com.se.toyshop.entity.User;

public interface CartDAO {
	User getUser();
	Product getProduct(String id);
	boolean addCartItem(User user, ShoppingCartItem cartItem);
	boolean updateCartItem(User user, ShoppingCartItem cartItem);
	boolean removeCartItem(User user, ShoppingCartItem cartItem);
}
