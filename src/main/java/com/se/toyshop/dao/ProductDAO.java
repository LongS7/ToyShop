package com.se.toyshop.dao;

import java.util.List;

import org.bson.types.ObjectId;

import com.se.toyshop.entity.Product;

public interface ProductDAO {
	Product getProduct();
	Product getProductById(ObjectId id);
	List<Product> getProductByCategoryId(ObjectId caregory_id);
	List<Product> getProductByCategoryId(ObjectId caregory_id,int page,int limit);
	List<Product> getAllProducts();
	List<Product> getAllProducts(int page,int limit);
	List<Product> getProductByAge(String value,int page,int limit);
	List<Product> getProductByAge(String value);
}
