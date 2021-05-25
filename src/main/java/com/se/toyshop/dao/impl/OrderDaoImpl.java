package com.se.toyshop.dao.impl;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Order> getAll(int page, int sortDate) {
		OgmSession session = sessionFactory.getCurrentSession();

		List<Order> result = null;

		Transaction tran = session.beginTransaction();

		try {
			result = session.createNativeQuery("db.orders.aggregate(["
					+ "{'$sort': {'orderDate': " + sortDate + "}}, "
					+ "{'$skip': " + (page - 1) * 10 + "}, "
					+ "{'$limit': 10}])", Order.class)
					.getResultList();

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

	@Override
	public double getTotalMoneyOfDay(LocalDate date) {
		double res = 0;
		
		OgmSession session = sessionFactory.getCurrentSession();

		Transaction tran = session.beginTransaction();

		try {
			 @SuppressWarnings("unchecked")
			List<Object> list = session.createNativeQuery(""
			 		+ "db.orders.aggregate(\r\n"
			 		+ "[\r\n"
			 		+ "	{\r\n"
			 		+ "		'$match': {\r\n"
			 		+ "			'orderDate': '" + date.toString() + "'\r\n"
			 		+ "		}\r\n"
			 		+ "	},\r\n"
			 		+ "	{'$unwind': '$orderDetails'}, \r\n"
			 		+ "	{\r\n"
			 		+ "		'$group': {\r\n"
			 		+ "			'_id': '$orderDate', \r\n"
			 		+ "			'total': {\r\n"
			 		+ "				'$sum': {\r\n"
			 		+ "					'$multiply': [\r\n"
			 		+ "						{'$multiply': ['$orderDetails.quantity', '$orderDetails.unitPrice', 1.0]},\r\n"
			 		+ "						{'$subtract': [1, '$orderDetails.discount']}\r\n"
			 		+ "					]\r\n"
			 		+ "				}\r\n"
			 		+ "			}\r\n"
			 		+ "		}\r\n"
			 		+ "	}\r\n"
			 		+ "])").list();

			tran.commit();
			
			if(list != null && list.size() > 0) {
				Object[] temp = (Object[]) list.get(0);
				
				return (double)temp[1];
			}

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

		return res;
	}

	@Override
	public double getTotalMoneyOfMonth(LocalDate date) {
		double res = 0;
		
		OgmSession session = sessionFactory.getCurrentSession();

		Transaction tran = session.beginTransaction();

		try {
			 @SuppressWarnings("unchecked")
			List<Object> list = session.createNativeQuery(""
			 		+ "db.orders.aggregate(\r\n"
			 		+ "[\r\n"
			 		+ "	{\r\n"
			 		+ "		'$set': {\r\n"
			 		+ "			'month': {\r\n"
			 		+ "				'$month': {\r\n"
			 		+ "					'$dateFromString': {\r\n"
			 		+ "						'dateString': '$orderDate'\r\n"
			 		+ "					}\r\n"
			 		+ "				}\r\n"
			 		+ "			},\r\n"
			 		+ "			'year': {\r\n"
			 		+ "				'$year': {\r\n"
			 		+ "					'$dateFromString': {\r\n"
			 		+ "						'dateString': '$orderDate'\r\n"
			 		+ "					}\r\n"
			 		+ "				}\r\n"
			 		+ "			}\r\n"
			 		+ "		}\r\n"
			 		+ "	},\r\n"
			 		+ "	{\r\n"
			 		+ "		'$match': {\r\n"
			 		+ "			'year': " + date.getYear() + ",\r\n"
			 		+ "			'month': " + date.getMonthValue() + "\r\n"
			 		+ "		}\r\n"
			 		+ "	},\r\n"
			 		+ "	{'$unwind': '$orderDetails'}, \r\n"
			 		+ "	{\r\n"
			 		+ "		'$group': {\r\n"
			 		+ "			_id: '$month', \r\n"
			 		+ "			'total': {\r\n"
			 		+ "				'$sum': {\r\n"
			 		+ "					'$multiply': [\r\n"
			 		+ "						{'$multiply': ['$orderDetails.quantity', '$orderDetails.unitPrice', 1.0]},\r\n"
			 		+ "						{'$subtract': [1, '$orderDetails.discount']}\r\n"
			 		+ "					]\r\n"
			 		+ "				}\r\n"
			 		+ "			}\r\n"
			 		+ "		}\r\n"
			 		+ "	}\r\n"
			 		+ "])").list();

			tran.commit();
			
			if(list != null && list.size() > 0) {
				Object[] temp = (Object[]) list.get(0);
				
				return (double)temp[1];
			}

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

		return res;
	}

	@Override
	public Map<Integer, Double> getTotalMoneyOfYear(int year) {
		Map<Integer, Double> res = new HashMap<Integer, Double>();
		
		OgmSession session = sessionFactory.getCurrentSession();

		Transaction tran = session.beginTransaction();

		try {
			 @SuppressWarnings("unchecked")
			List<Object> o = session.createNativeQuery(""
					+ "db.orders.aggregate(\r\n"
					+ "[\r\n"
					+ "	{\r\n"
					+ "		'$set': {\r\n"
					+ "			'month': {\r\n"
					+ "				'$month': {\r\n"
					+ "					'$dateFromString': {\r\n"
					+ "						'dateString': '$orderDate'\r\n"
					+ "					}\r\n"
					+ "				}\r\n"
					+ "			},\r\n"
					+ "			'year': {\r\n"
					+ "				'$year': {\r\n"
					+ "					'$dateFromString': {\r\n"
					+ "						'dateString': '$orderDate'\r\n"
					+ "					}\r\n"
					+ "				}\r\n"
					+ "			}\r\n"
					+ "		}\r\n"
					+ "	},\r\n"
					+ "	{\r\n"
					+ "		'$match': {\r\n"
					+ "			'year': " + year + "\r\n"
					+ "		}\r\n"
					+ "	},\r\n"
					+ "	{'$unwind': '$orderDetails'}, \r\n"
					+ "	{\r\n"
					+ "		'$group': {\r\n"
					+ "			'_id': '$month', \r\n"
					+ "			'total': {\r\n"
					+ "				'$sum': {\r\n"
					+ "					'$multiply': [\r\n"
					+ "						{'$multiply': ['$orderDetails.quantity', '$orderDetails.unitPrice']},\r\n"
					+ "						{'$subtract': [1, '$orderDetails.discount']}\r\n"
					+ "					]\r\n"
					+ "				}\r\n"
					+ "			}\r\n"
					+ "		}\r\n"
					+ "	}\r\n"
					+ "])"
					).list();

			tran.commit();
			
			for(Object item : o) {
				Object[] temp = (Object[]) item;
				
				res.put((int) temp[0], (double) temp[1]);
			}

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

		return res;
	}

	@Override
	public int getOrderCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Order> find(String keyword) {
		OgmSession session = sessionFactory.getCurrentSession();

		List<Order> result = null;

		Transaction tran = session.beginTransaction();

		try {
//			session.createNativeQuery("db.orders.createIndex( { comments: \"text\" } )").executeUpdate();
//			
//			result = session.createNativeQuery("db.orders.find({'state': " + state + "})", Order.class).getResultList();
//
//			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

		return result;
	}

}
