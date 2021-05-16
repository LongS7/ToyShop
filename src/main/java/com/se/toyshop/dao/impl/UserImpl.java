package com.se.toyshop.dao.impl;

import org.hibernate.Transaction;
import org.hibernate.ogm.OgmSession;
import org.hibernate.ogm.OgmSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.se.toyshop.dao.UserDao;
import com.se.toyshop.entity.User;

public class UserImpl implements UserDao {
	@Autowired
	private OgmSessionFactory sessionFactory;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	private UserDao userDao;

	@Autowired
	public UserImpl(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserImpl() {
		super();
	}

	@Override
	public void addUser(User user) {
		OgmSession session = sessionFactory.getCurrentSession();

		Transaction trans = session.beginTransaction();

		try {
			user.getAccount().setPassword(passwordEncoder.encode(user.getAccount().getPassword()));
			session.save(user);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
	}

	@Override
	public User findByUsername(String username) {
		User user = null;
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();

		try {
			user = session
					.createNativeQuery(
							"db.users.aggregate([{'$match':{'account.username':'" + username
									+ "'}}])",
							User.class)
					.getSingleResult();
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
		return user;
	}

	@Override
	public boolean update(User user) {
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		
		try {
			session.update(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			return false;
		}
	}

	
}
