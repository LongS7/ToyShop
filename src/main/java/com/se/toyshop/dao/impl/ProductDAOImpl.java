package com.se.toyshop.dao.impl;

import org.hibernate.Transaction;
import org.hibernate.ogm.OgmSession;
import org.hibernate.ogm.OgmSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.entity.Product;

public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private OgmSessionFactory sessionFactory;

	public void setSessionFactory(OgmSessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Product getProduct() {
		OgmSession session = sessionFactory.getCurrentSession();
		
		Transaction tran = session.beginTransaction();

		Product product = null;
		try {
			product  = session.createNativeQuery("db.products.find({}).limit(1)", Product.class).getResultList().get(0);
			
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

		return product;
	}

	



}
