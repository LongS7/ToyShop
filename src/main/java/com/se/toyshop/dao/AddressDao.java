package com.se.toyshop.dao;

import java.util.List;

import com.se.toyshop.entity.ShippingAddress;

public interface AddressDao {
	List<ShippingAddress> findByUserId(int userID);
}
