package com.se.toyshop.entity;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class ShoppingCartItem {
	@ManyToOne
	@JoinColumn(name = "productId")
	private Product product;
	private int quantity;
	
	public ShoppingCartItem() {
		// TODO Auto-generated constructor stub
	}

	public ShoppingCartItem(Product product, int quantity) {
		super();
		this.product = product;
		this.quantity = quantity;
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

	@Override
	public String toString() {
		return "ShoppingCartItem [product=" + product + ", quantity=" + quantity + "]";
	}
	
}
