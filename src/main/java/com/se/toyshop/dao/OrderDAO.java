package com.se.toyshop.dao;

import java.util.List;

import org.bson.types.ObjectId;

import com.se.toyshop.entity.Order;

public interface OrderDAO {
	List<Order> getAll();
	void addOrder(Order order);
	void updateOrder(Order order);
	List<Order> getOrdersOfCustomer(ObjectId userId);
	List<Order> getOrdersOfCustomer(ObjectId userId, int state);
	Order getOrder(String id);
}
