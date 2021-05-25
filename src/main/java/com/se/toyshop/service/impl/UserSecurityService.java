package com.se.toyshop.service.impl;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.toyshop.dao.PasswordResetTokenDAO;
import com.se.toyshop.entity.PasswordResetToken;
import com.se.toyshop.service.ISecurityUserService;

@Service
public class UserSecurityService implements ISecurityUserService {

	@Autowired
	private PasswordResetTokenDAO passwordResetTokenDao;

	@Override
	public String validatePasswordResetToken(String token) {
		final PasswordResetToken passToken = passwordResetTokenDao.findByToken(token);

		return !isTokenFound(passToken) ? "invalidToken" : isTokenExpired(passToken) ? "expired" : null;
	}

	private boolean isTokenFound(PasswordResetToken passToken) {
		return passToken != null;
	}

	private boolean isTokenExpired(PasswordResetToken passToken) {
		final Calendar cal = Calendar.getInstance();
		return passToken.getExpiryDate().before(cal.getTime());
	}

}
