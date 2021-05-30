package com.se.toyshop.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;
import org.hibernate.ogm.OgmSession;
import org.hibernate.ogm.OgmSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.se.toyshop.dao.CategoryDAO;
import com.se.toyshop.entity.Category;
import com.se.toyshop.entity.Product;


public class CategoryDAOImpl implements CategoryDAO{
	@Autowired
	private OgmSessionFactory sessionFactory;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllDescriptions() {
		List<String> list = null;
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();

		try {
			list = (List<String>)session.createNativeQuery("db.categories.distinct('description')").getSingleResult();

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
		return list;
		
	}

	@Override
	public Map<String, List<Category>> getAllCategories() {
		Map<String, List<Category>> map = new HashMap<String, List<Category>>();
		
		List<String> descriptions = getAllDescriptions();
		
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		try {
			for(int i = 0;i < descriptions.size();i++) {
				List<Category> listTemp = null;
				String description = descriptions.get(i);
				listTemp = session.createNativeQuery("db.categories.find({'description': '" + description + "'})",Category.class).getResultList();
				map.put(description, listTemp);
			}
			
			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
		return map;
	}

	@Override
	public List<Category> getAllCateroty() {
		OgmSession session = sessionFactory.getCurrentSession();
		
		Transaction tran = session.beginTransaction();

		List<Category> categories = null;
		try {
			categories  = session.createNativeQuery("db.categories.find({})", Category.class).getResultList();
			
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

		return categories;
	}

}
