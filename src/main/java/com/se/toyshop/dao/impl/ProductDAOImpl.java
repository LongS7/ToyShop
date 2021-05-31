package com.se.toyshop.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;
import org.hibernate.Transaction;
import org.hibernate.ogm.OgmSession;
import org.hibernate.ogm.OgmSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.entity.Brand;
import com.se.toyshop.entity.Category;
import com.se.toyshop.entity.Gender;
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
			product = session.createNativeQuery("db.products.find({}).limit(1)", Product.class).getResultList().get(0);

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

		return product;
	}

	@Override
	public List<Product> getProductByCategoryId(ObjectId caregory_id) {

		OgmSession session = sessionFactory.getCurrentSession();
		List<Product> products = null;
		Transaction tran = session.beginTransaction();

		try {
			products = session
					.createNativeQuery("db.products.find({category_id:ObjectId('" + caregory_id + "')})", Product.class)
					.getResultList();

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		return products;
	}

	@Override
	public List<Product> getAllProducts() {

		OgmSession session = sessionFactory.getCurrentSession();
		List<Product> products = null;
		Transaction tran = session.beginTransaction();

		try {
			products = session.createNativeQuery("db.products.find({})", Product.class).getResultList();

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		return products;
	}

	@Override
	public List<Product> getProductByCategoryId(ObjectId caregory_id, int page, int limit) {
		// TODO Auto-generated method stub
		OgmSession session = sessionFactory.getCurrentSession();
		List<Product> products = new ArrayList<Product>();
		Transaction tran = session.beginTransaction();
		int ofset = (page - 1) * limit;
		try {
//			products  = session.createNativeQuery("db.products.find({category_id:ObjectId('"+caregory_id+"')}).skip('"+ofset+"').limit('"+limit+"')", Product.class).getResultList();
			products = session.createNativeQuery("db.products.aggregate([{'$match':{category_id:ObjectId('"
					+ caregory_id + "')}},{'$skip':" + ofset + "},{'$limit':" + limit + "}])", Product.class)
					.getResultList();
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		return products;
	}

	@Override
	public List<Product> getAllProducts(int page, int limit) {
		OgmSession session = sessionFactory.getCurrentSession();
		List<Product> products = new ArrayList<Product>();
		Transaction tran = session.beginTransaction();
		int ofset = (page - 1) * limit;
		try {
//			products  = session.createNativeQuery("db.products.find({category_id:ObjectId('"+caregory_id+"')}).skip('"+ofset+"').limit('"+limit+"')", Product.class).getResultList();
			products = session
					.createNativeQuery("db.products.aggregate([{'$skip':" + ofset + "},{'$limit':" + limit + "}])",
							Product.class)
					.getResultList();
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		return products;
	}

	@Override
	public Product getProductById(ObjectId id) {
		OgmSession session = sessionFactory.getCurrentSession();

		Transaction tran = session.beginTransaction();

		Product product = null;
		try {
			product = session.get(Product.class, id);

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

		return product;
	}

	@Override
	public List<Product> getProductByAge(String value, int page, int limit) {

		// TODO Auto-generated method stub
		OgmSession session = sessionFactory.getCurrentSession();
		List<Product> products = new ArrayList<Product>();
		Transaction tran = session.beginTransaction();
		int ofset = (page - 1) * limit;
		try {
			products = session.createNativeQuery("db.products.aggregate([{'$match':{ages:'" + value + "'}},{'$skip':"
					+ ofset + "},{'$limit':" + limit + "}])", Product.class).getResultList();

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		return products;
	}

	@Override
	public List<Product> getProductByAge(String value) {
		OgmSession session = sessionFactory.getCurrentSession();
		List<Product> products = null;
		Transaction tran = session.beginTransaction();

		try {
			products = session.createNativeQuery("db.products.find({ages:'" + value + "'})", Product.class)
					.getResultList();

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		return products;
	}

	@Override
	public List<Product> getProductByNameOrSku(String keyword) {
		OgmSession session = sessionFactory.getCurrentSession();
		List<Product> products = new ArrayList();
		Transaction tran = session.beginTransaction();

		try {
			products = session
					.createNativeQuery("db.products.find({'$text':{'$search':'\"" + keyword + "\"'}})", Product.class)
					.getResultList();

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		return products;
	}

	@Override
	public List<Product> getProductByNameOrSku(String keyword, int page, int limit) {
		OgmSession session = sessionFactory.getCurrentSession();
		List<Product> products = new ArrayList();
		Transaction tran = session.beginTransaction();
		int ofset = (page - 1) * limit;
		try {
			products = session
					.createNativeQuery("db.products.aggregate([{'$match':{'$text':{'$search':'\"" + keyword
							+ "\"'}}},{'$skip':" + ofset + "},{'$limit':" + limit + "}])", Product.class)
					.getResultList();

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		return products;
	}

	@Override
	public void updateProduct(Product product) {
		OgmSession session = sessionFactory.getCurrentSession();

		Transaction tran = session.beginTransaction();

		try {
			session.update(product);

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}

	}

	@Override
	public List<String> getAllGender() {
		List<String> list = new ArrayList();
		for (Gender g : Gender.values()) {
			list.add(g.toString());
		}
		return list;
	}

	@Override
	public List<Brand> getAllBrand() {
		OgmSession session = sessionFactory.getCurrentSession();
		List<Brand> brands = null;
		Transaction tran = session.beginTransaction();

		try {
			brands = session.createNativeQuery("db.brands.find({})", Brand.class).getResultList();

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		return brands;
	}

	@Override
	public List<String> getAllAge() {
		OgmSession session = sessionFactory.getCurrentSession();
		List<String> ages = null;
		Transaction tran = session.beginTransaction();

		try {
			ages = (List<String>) session.createNativeQuery("db.products.distinct('ages')").getSingleResult();

			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		return ages;
	}

	@Override
	public List<String> getAllMaterial() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveProduct(Product product) {
		OgmSession session = sessionFactory.getCurrentSession();

		Transaction tran = session.beginTransaction();

		try {
			session.saveOrUpdate(product);
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
	}

	@Override
	public Brand getBrandById(ObjectId id) {
		Brand brand = null;
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			brand = session.find(Brand.class, id);
					trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
		return brand;
	}

	@Override
	public Category getCategoryById(ObjectId id) {
		Category category = null;
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			category = session.find(Category.class, id);
					trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
		return category;
	}

	@Override
	public void deleteProduct(ObjectId id) {
		OgmSession session = sessionFactory.getCurrentSession();
		Transaction tran = session.beginTransaction();
		try {
			Product temp = session.find(Product.class, id);
			session.delete(temp);
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
		
	}

}
