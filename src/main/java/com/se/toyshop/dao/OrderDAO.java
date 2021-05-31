package com.se.toyshop.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.bson.types.ObjectId;

import com.se.toyshop.entity.Order;

public interface OrderDAO {
	List<Order> getAll(int page, int sortDate);
	boolean addOrder(Order order);
	void updateOrder(Order order);
	List<Order> getOrdersOfCustomer(ObjectId userId);
	List<Order> getOrdersOfCustomer(ObjectId userId, int state);
	Order getOrder(String id);
	double getTotalMoneyOfDay(LocalDate date);
	double getTotalMoneyOfMonth(LocalDate date);
	Map<Integer, Double> getTotalMoneyOfYear(int year);
	long getOrderCount();
	List<Order> find(String keyword);
	List<Order> getOrders(LocalDate dateFrom, LocalDate dateTo, int state, int page, int sortDate);
}
