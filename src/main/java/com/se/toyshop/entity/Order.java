package com.se.toyshop.entity;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
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
	
	private int state;
	
	@Embedded
	private ShippingAddress shippingAddress;
	
	private String phone;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(ObjectId _id, LocalDate orderDate, List<OrderDetail> orderDetails, int state,
			ShippingAddress shippingAddress, String phone) {
		super();
		this._id = _id;
		this.orderDate = orderDate;
		this.orderDetails = orderDetails;
		this.state = state;
		this.shippingAddress = shippingAddress;
		this.phone = phone;
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

	/***
	 * 
	 * @return -1 nếu đơn hàng đã bị hủy
	 * @return 0 nếu đơn hàng đang được xử lý
	 * @return 1 nếu đơn hàng đang được giao
	 * @return 2 nếu đơn hàng đã được giao
	 */
	public int getState() {
		return state;
	}

	/***
	 * state bằng -1 nếu đơn hàng đã bị hủy
	 * state bằng 0 nếu đơn hàng đang được xử lý
	 * state bằng 1 nếu đơn hàng đang được giao
	 * state bằng 2 nếu đơn hàng đã được giao
	 * @param state
	 */
	public void setState(int state) {
		this.state = state;
	}

	public ShippingAddress getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(ShippingAddress shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Order [_id=" + _id + ", orderDate=" + orderDate + ", orderDetails=" + orderDetails + ", state=" + state
				+ ", shippingAddress=" + shippingAddress + ", phone=" + phone + "]";
	}

	

	
	
}
