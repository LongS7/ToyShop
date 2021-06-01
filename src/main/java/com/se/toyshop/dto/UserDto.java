package com.se.toyshop.dto;

import org.bson.types.ObjectId;

public class UserDto {
	private ObjectId userId;
	private int totalOrder;

	public ObjectId getUserId() {
		return userId;
	}

	public void setUserId(ObjectId userId) {
		this.userId = userId;
	}

	public int getTotalOrder() {
		return totalOrder;
	}

	public void setTotalOrder(int totalOrder) {
		this.totalOrder = totalOrder;
	}

}
