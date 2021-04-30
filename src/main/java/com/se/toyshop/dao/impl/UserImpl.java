package com.se.toyshop.dao.impl;

import org.hibernate.Transaction;
import org.hibernate.ogm.OgmSession;
import org.hibernate.ogm.OgmSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.se.toyshop.dao.UserDao;
import com.se.toyshop.entity.User;

public class UserImpl implements UserDao {
	@Autowired
	private OgmSessionFactory sessionFactory;
	
	public void setSessionFactory(OgmSessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void addUser(User user) {
		OgmSession session = sessionFactory.getCurrentSession();

		Transaction trans = session.beginTransaction();

		try {
			session.save(user);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
	}
}
