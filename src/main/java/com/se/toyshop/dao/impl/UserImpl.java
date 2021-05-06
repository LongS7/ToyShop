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

	private UserDao userDao;

	@Autowired
	public UserImpl(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserImpl() {
		super();
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

	public User findByUsername(String username) {
		User user = null;
		OgmSession session = sessionFactory.getCurrentSession();

		Transaction trans = session.beginTransaction();

		try {
			user = session
					.createNativeQuery(
							"db.users.aggregate([{'$match':{'account.username':'" + username
									+ "'}}, {'$project':{'_id':0, 'account':1}}, {'$replaceWith':'$account'}])",
							User.class)
					.getSingleResult();
			System.out.println(user);
//			System.out.println(user.getAccount().getUsername());
//			System.out.println(user.getAccount().getPassword());
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
		return user;
	}

}
