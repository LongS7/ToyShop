package com.se.toyshop.dao.impl;

import java.util.List;

import org.bson.types.ObjectId;
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
			user = session.createNativeQuery("db.users.aggregate([{'$match':{'account.username':'" + username + "'}}])",
					User.class).getSingleResult();
			trans.commit();
		} catch (Exception e) {
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
			trans.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			return false;
		}
	}

	@Override
	public User getUser(String id) {
		OgmSession session = sessionFactory.getCurrentSession();

		Transaction trans = session.beginTransaction();

		User user = new User();

		try {
			user = session.find(User.class, new ObjectId(id));
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
		return user;
	}

	@Override
	public User findByEmail(String email) {
		User user = null;
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();

		try {
			user = session.createNativeQuery("db.users.aggregate([{'$match':{'email':'" + email + "'}}])", User.class)
					.getSingleResult();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return user;
	}

	@Override
	public User getUserByPasswordResetToken(String token) {
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		User user = null;
		try {
			user = session.createNativeQuery("db.passwordResetTokens.aggregate([{'$match':{'token':'" + token
					+ "'}},{'$lookup':{from:'users',localField:'userId',foreignField:'_id',as:'user'}},{'$unwind':'$user'},{'$replaceWith':'$user'}])",
					User.class).getSingleResult();
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
		return user;
	}

	@Override
	public List<User> findAll() {
		List<User> users = null;
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			users = session.createNativeQuery("db.users.find({})", User.class).getResultList();
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
		return users;
	}

	@Override
	public int getQuantityFemaleUser() {
		int quantity = 0;
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			quantity = Integer
					.parseInt(session.createNativeQuery("db.users.count({gender:0})").getSingleResult().toString());
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
		return quantity;
	}

	@Override
	public int getQuantityMaleUser() {
		int quantity = 0;
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			quantity = Integer
					.parseInt(session.createNativeQuery("db.users.count({gender:1})").getSingleResult().toString());
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
		return quantity;
	}

	@Override
	public int getQuantityUserNotOrder() {
		int quantity = 0;
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			quantity = Integer.parseInt(session.createNativeQuery(
					"db.users.aggregate([{'$lookup':{'from':'orders', 'localField':'_id', 'foreignField':'userId', 'as':'rs'}}, {'$match':{'rs':{'$size':0}}}, {'$count':'rs'}])")
					.getSingleResult().toString());
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
		return quantity;
	}

}
