package com.se.toyshop.entity;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class OrderDetail {
	@ManyToOne
	@JoinColumn(name = "productId")
	private Product product;
	private int quantity;
	private double unitPrice;
	private float discount;
	
	public OrderDetail() {
		// TODO Auto-generated constructor stub
	}

	public OrderDetail(Product product, int quantity, double unitPrice, float discount) {
		super();
		this.product = product;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.discount = discount;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "OrderDetail [product=" + product + ", quantity=" + quantity + ", unitPrice=" + unitPrice + ", discount="
				+ discount + "]";
	}
	
	public double getLineTotal() {
		return unitPrice * quantity * (1 - discount);
	}
	
	public double getTotalDiscount() {
		return unitPrice * quantity * discount;
	}
}
