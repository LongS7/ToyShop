package com.se.toyshop.dao;

import java.util.List;

import org.bson.types.ObjectId;

import com.se.toyshop.entity.Brand;
import com.se.toyshop.entity.Category;
import com.se.toyshop.entity.Product;

public interface ProductDAO {
	Product getProduct();

	Product getProductById(ObjectId id);

	List<Product> getProductByCategoryId(ObjectId caregory_id);

	List<Product> getProductByCategoryId(ObjectId caregory_id, int page, int limit);

	List<Product> getAllProducts();

	List<Product> getAllProducts(int page, int limit);

	List<Product> getProductByAge(String value, int page, int limit);

	List<Product> getProductByAge(String value);

	List<Product> getProductByNameOrSku(String keyword);

	List<Product> getProductByNameOrSku(String keyword, int page, int limit);

	void updateProduct(Product product);

	List<String> getAllGender();

	List<Brand> getAllBrand();

	List<String> getAllAge();

	List<String> getAllMaterial();

	void saveProduct(Product product);
	
	Brand getBrandById(ObjectId id);
	
	Category getCategoryById(ObjectId id);
}
