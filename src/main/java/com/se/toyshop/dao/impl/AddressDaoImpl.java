package com.se.toyshop.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.se.toyshop.dao.AddressDao;
import com.se.toyshop.entity.ShippingAddress;

public class AddressDaoImpl implements AddressDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<ShippingAddress> findByUserId(int userID) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
