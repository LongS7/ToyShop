package com.se.toyshop.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.bson.types.ObjectId;

@Entity
@Table(name = "accounts", uniqueConstraints = { @UniqueConstraint(columnNames = {"userName"}) })
public class Account {
	@Id
	private ObjectId _id;
	private String userName;
	private String password;
	
	public Account() {
	}

	public Account(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Account [userName=" + userName + ", password=" + password + "]";
	}
	
	

}
