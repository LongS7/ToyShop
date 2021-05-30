package com.se.toyshop.dao;

import java.util.Date;
import java.util.stream.Stream;

import org.bson.types.ObjectId;

import com.se.toyshop.entity.PasswordResetToken;

public interface PasswordResetTokenDAO {
	void save(PasswordResetToken passwordResetToken);

	PasswordResetToken findByToken(String token);
	
	PasswordResetToken findByUserId(ObjectId userId);
	
	void update(PasswordResetToken passwordResetToken);

	Stream<PasswordResetToken> findAllByExpiryDateLessThan(Date now);

	void deleteByExpiryDateLessThan(Date now);
	
	void deleteAllExpiredSince(Date now);
}
