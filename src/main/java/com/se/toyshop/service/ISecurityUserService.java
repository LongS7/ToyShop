package com.se.toyshop.service;

public interface ISecurityUserService {
	String validatePasswordResetToken(String token);
}
