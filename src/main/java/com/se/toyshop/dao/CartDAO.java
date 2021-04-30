package com.se.toyshop.dao;

import java.util.List;

import org.bson.types.ObjectId;

import com.se.toyshop.entity.ShoppingCartItem;
import com.se.toyshop.entity.User;

public interface CartDAO {
	List<ShoppingCartItem> getListCartItem();
	boolean addCartItem(User user, ShoppingCartItem cartItem);
	boolean updateCartItem(ObjectId productId, int newQuantity);
	boolean removeCartItem(User user, ShoppingCartItem cartItem);
}
