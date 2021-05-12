package com.se.toyshop.dao;

import com.se.toyshop.entity.User;

public interface UserDao {
	void addUser(User user);

	User findByUsername(String username);
}
