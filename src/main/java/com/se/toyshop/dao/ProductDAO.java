package com.se.toyshop.dao;

import java.util.List;

import org.bson.types.ObjectId;

import com.se.toyshop.entity.Product;

public interface ProductDAO {
	Product getProduct();
	List<Product> getProductByCategoryId(ObjectId caregory_id);
	List<Product> getAllProducts();
}
