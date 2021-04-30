package com.se.toyshop.dao.impl;

import org.bson.types.ObjectId;
import org.hibernate.Transaction;
import org.hibernate.ogm.OgmSession;
import org.hibernate.ogm.OgmSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.se.toyshop.dao.CartDAO;
import com.se.toyshop.entity.ShoppingCartItem;
import com.se.toyshop.entity.User;

public class CartDAOImpl implements CartDAO {
	@Autowired
	private OgmSessionFactory sessionFactory;

	public void setSessionFactory(OgmSessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public User getUser() {
		OgmSession session = sessionFactory.getCurrentSession();
		
		Transaction tran = session.beginTransaction();
		
		User user = null;
		try {
			user = session.createNativeQuery("db.users.find({})", User.class).getResultList().get(0);
			
			tran.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		
		return user;
	}

	public boolean addCartItem(User user, ShoppingCartItem cartItem) {
		boolean result = true;
		
		user.getListShoppingCartItem().add(cartItem);
		
		OgmSession session = sessionFactory.getCurrentSession();
		
		Transaction tran = session.beginTransaction();
		
		try {
			session.save(user);
			
			tran.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			result = false;
		}
		return result;
	}

	public boolean updateCartItem(ObjectId productId, int newQuantity) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean removeCartItem(User user, ShoppingCartItem cartItem) {
		// TODO Auto-generated method stub
		return false;
	}


}
