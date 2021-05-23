package com.se.toyshop.dao.impl;

import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.ogm.OgmSession;
import org.hibernate.ogm.OgmSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.se.toyshop.dao.CartDAO;
import com.se.toyshop.entity.Product;
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
		
		if(user.getListShoppingCartItem().contains(cartItem))
			return false;
		
		user.getListShoppingCartItem().add(cartItem);
		
		OgmSession session = sessionFactory.getCurrentSession();
		
		Transaction tran = session.beginTransaction();
		
		try {
			session.update(user);
			
			tran.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			result = false;
		}
		return result;
	}

	public boolean updateCartItem(User user, ShoppingCartItem cartItem) {
		boolean result = false;
		
		user.getListShoppingCartItem().set(user.getListShoppingCartItem().indexOf(cartItem), cartItem);
		
		OgmSession session = sessionFactory.getCurrentSession();
		
		Transaction tran = session.beginTransaction();
		
		try {
			session.update(user);
			
			tran.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			result = false;
		}
		return result;
	}

	public boolean removeCartItem(User user, ShoppingCartItem cartItem) {
		boolean result = false;
		
		user.getListShoppingCartItem().remove(cartItem);
		
		OgmSession session = sessionFactory.getCurrentSession();
		
		Transaction tran = session.beginTransaction();
		
		try {
			session.update(user);
			
			tran.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			result = false;
		}
		return result;
	}

	public Product getProduct(String id) {
		OgmSession session = sessionFactory.getCurrentSession();
		
		Transaction tran = session.beginTransaction();
		
		Product product = null;
		try {
			product = session.createNativeQuery("db.products.find({_id: ObjectId('" + id + "')})", Product.class).getResultList().get(0);
			
			tran.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		
		return product;
	}

	@Override
	public boolean removeCartItems(User user, List<ShoppingCartItem> cartItems) {
		boolean result = false;
		
		for(int i = cartItems.size() - 1; i >= 0; i--) {
			user.getListShoppingCartItem().remove(cartItems.get(i));
		}
		
		OgmSession session = sessionFactory.getCurrentSession();
		
		Transaction tran = session.beginTransaction();
		
		try {
			session.update(user);
			
			tran.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			result = false;
		}
		return result;
	}


}
