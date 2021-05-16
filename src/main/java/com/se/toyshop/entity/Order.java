package com.se.toyshop.entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.bson.types.ObjectId;

@Entity
@Table(name = "orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private ObjectId _id;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private User user;
	
	private LocalDate orderDate;
	
	@ElementCollection(fetch = FetchType.EAGER)
	private List<OrderDetail> orderDetails;
	
	private int state;
	
	@Embedded
	private ShippingAddress shippingAddress;
	
	private String phone;
	
	public Order() {
		this.orderDetails = new ArrayList<OrderDetail>();
	}

	

	public Order(ObjectId _id, User user, LocalDate orderDate, int state, ShippingAddress shippingAddress,
			String phone) {
		super();
		this._id = _id;
		this.user = user;
		this.orderDate = orderDate;
		this.state = state;
		this.shippingAddress = shippingAddress;
		this.phone = phone;
		this.orderDetails = new ArrayList<OrderDetail>();
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
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
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
	 * state bằng 1 nếu đơn hàng đã được giao
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
	
	public void addOrderDetail(Product product, int quantity) {
		if(orderDetails == null)
			orderDetails = new ArrayList<OrderDetail>();
		
		orderDetails.add(new OrderDetail(product, quantity, product.getPrice(), product.getDiscount()));
	}
	
	public double getTotal() {
		if(orderDetails == null)
			return 0;
		
		double total = 0;
		for(OrderDetail item : orderDetails)
			total += item.getLineTotal();
		
		return total;
	}

	@Override
	public String toString() {
		return "Order [_id=" + _id + ", orderDate=" + orderDate + ", orderDetails=" + orderDetails + ", state=" + state
				+ ", shippingAddress=" + shippingAddress + ", phone=" + phone + "]";
	}

	

	
	
}
