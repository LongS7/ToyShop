package com.se.toyshop.entity;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.bson.types.ObjectId;

@Entity
@Table(name = "orders")
public class Order {
	@Id
	private ObjectId _id;
	private LocalDate orderDate;
	
	@ElementCollection
	private List<OrderDetail> orderDetails;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(ObjectId _id, LocalDate orderDate, List<OrderDetail> orderDetails) {
		super();
		this._id = _id;
		this.orderDate = orderDate;
		this.orderDetails = orderDetails;
	}

	public ObjectId get_id() {
		return _id;
	}

	public void set_id(ObjectId _id) {
		this._id = _id;
	}

	public LocalDate getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@Override
	public String toString() {
		return "Order [_id=" + _id + ", orderDate=" + orderDate + ", orderDetails=" + orderDetails + "]";
	}
	
}
