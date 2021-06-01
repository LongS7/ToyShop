package com.se.toyshop.dao;

import java.util.List;

import org.bson.types.ObjectId;

import com.se.toyshop.dto.UserDto;
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
	
	List<Integer> getTotalOrder();
	
	void delete(User user);
	
	List<ObjectId> getListUserIdNotOrder();
}
