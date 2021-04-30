package com.se.toyshop.dao;

import org.bson.types.ObjectId;

import com.se.toyshop.entity.ShoppingCartItem;
import com.se.toyshop.entity.User;

public interface CartDAO {
	User getUser();
	boolean addCartItem(User user, ShoppingCartItem cartItem);
	boolean updateCartItem(ObjectId productId, int newQuantity);
	boolean removeCartItem(User user, ShoppingCartItem cartItem);
}
