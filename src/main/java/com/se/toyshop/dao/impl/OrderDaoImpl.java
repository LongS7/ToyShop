package com.se.toyshop.dao.impl;

import java.util.List;

import org.bson.types.ObjectId;
import org.hibernate.Transaction;
import org.hibernate.ogm.OgmSession;
import org.hibernate.ogm.OgmSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.se.toyshop.dao.OrderDAO;
import com.se.toyshop.entity.Order;

public class OrderDaoImpl implements OrderDAO {
	@Autowired
	private OgmSessionFactory sessionFactory;

	@Override
	public List<Order> getAll() {
		OgmSession session = sessionFactory.getCurrentSession();

		List<Order> result = null;

		Transaction tran = session.beginTransaction();

		try {
			result = session.createNativeQuery("db.orders.find({})", Order.class).getResultList();

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

		return result;
	}

	@Override
	public List<Order> getOrdersOfCustomer(ObjectId userId) {
		OgmSession session = sessionFactory.getCurrentSession();

		List<Order> result = null;

		Transaction tran = session.beginTransaction();

		try {
			result = session.createNativeQuery("db.orders.find({userId: ObjectId('" + userId + "')})", Order.class).getResultList();

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

		return result;
	}

	@Override
	public void addOrder(Order order) {
		OgmSession session = sessionFactory.getCurrentSession();

		Transaction tran = session.beginTransaction();

		try {
			session.save(order);

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
	}

	@Override
	public void updateOrder(Order order) {
		OgmSession session = sessionFactory.getCurrentSession();

		Transaction tran = session.beginTransaction();

		try {
			session.update(order);

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
	}

	@Override
	public List<Order> getOrdersOfCustomer(ObjectId userId, int state) {
		OgmSession session = sessionFactory.getCurrentSession();

		List<Order> result = null;

		Transaction tran = session.beginTransaction();

		try {
			result = session.createNativeQuery("db.orders.find({'state': " + state + "})", Order.class).getResultList();

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

		return result;
	}

	@Override
	public Order getOrder(String id) {
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction tran = session.beginTransaction();

		Order order = null;

		try {
			order = session.createNativeQuery("db.orders.find({'_id': ObjectId('" + id + "')})", Order.class).uniqueResult();

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

		return order;
	}

}
