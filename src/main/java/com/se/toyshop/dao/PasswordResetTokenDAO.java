package com.se.toyshop.dao;

import java.util.Date;
import java.util.stream.Stream;

import com.se.toyshop.entity.PasswordResetToken;

public interface PasswordResetTokenDAO {
	void save(PasswordResetToken passwordResetToken);

	PasswordResetToken findByToken(String token);

	Stream<PasswordResetToken> findAllByExpiryDateLessThan(Date now);

	void deleteByExpiryDateLessThan(Date now);
	
	void deleteAllExpiredSince(Date now);
}
