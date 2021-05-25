package com.se.toyshop.dao.impl;

import java.util.Date;
import java.util.stream.Stream;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.se.toyshop.dao.PasswordResetTokenDAO;
import com.se.toyshop.entity.PasswordResetToken;

public class PasswordResetTokenDAOImpl implements PasswordResetTokenDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(PasswordResetToken passwordResetToken) {
		Session session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			session.save(passwordResetToken);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
	}

	@Override
	public PasswordResetToken findByToken(String token) {
		Session session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		PasswordResetToken passwordResetToken = null;
		try {
			passwordResetToken = session.createNativeQuery("db.passwordResetTokens.find({token:'" + token + "'})", PasswordResetToken.class).getSingleResult();
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
		return passwordResetToken;
	}

	@Override
	public Stream<PasswordResetToken> findAllByExpiryDateLessThan(Date now) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteByExpiryDateLessThan(Date now) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAllExpiredSince(Date now) {
		// TODO Auto-generated method stub

	}

}
