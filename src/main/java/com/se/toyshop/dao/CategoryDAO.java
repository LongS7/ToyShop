package com.se.toyshop.dao;

import java.util.List;
import java.util.Map;

import com.se.toyshop.entity.Category;

public interface CategoryDAO {
	List<String> getAllDescriptions();
	Map<String, List<Category>> getAllCategories();
}
