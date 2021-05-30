package com.se.toyshop.dao;

import java.util.List;

import com.se.toyshop.entity.User;

public interface UserDao {
	void addUser(User user);

	User findByUsername(String username);
	
	boolean update(User user);
	
	User getUser(String id);
	
	User findByEmail(String email);
	
	User getUserByPasswordResetToken(String token);
	
	List<User> findAll();
	
	int getQuantityFemaleUser();
	
	int getQuantityMaleUser();
	
	int getQuantityUserNotOrder();
}
