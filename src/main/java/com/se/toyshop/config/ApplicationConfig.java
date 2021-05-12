package com.se.toyshop.config;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.ogm.OgmSessionFactory;
import org.hibernate.ogm.boot.OgmSessionFactoryBuilder;
import org.hibernate.ogm.cfg.OgmProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.se.toyshop.dao.CartDAO;
import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.dao.UserDao;
import com.se.toyshop.dao.impl.CartDAOImpl;
import com.se.toyshop.dao.impl.ProductDAOImpl;
import com.se.toyshop.dao.impl.UserImpl;

@Configuration
@ComponentScan("com.se.toyshop")
@EnableTransactionManagement
public class ApplicationConfig {
	@Bean(name = "viewResolver")
	public InternalResourceViewResolver getViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	@Bean(name = "sessionFactory")
	public OgmSessionFactory getSessionFactory() {
		StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
				.applySetting(OgmProperties.ENABLED, true)
				.configure()
				.build();

		Metadata meta = new MetadataSources(registry)
				.addAnnotatedClass(com.se.toyshop.entity.User.class)
				.addAnnotatedClass(com.se.toyshop.entity.Product.class)
				.addAnnotatedClass(com.se.toyshop.entity.Account.class)
				.addAnnotatedClass(com.se.toyshop.entity.OrderDetail.class)
				.addAnnotatedClass(com.se.toyshop.entity.Order.class)
				.addAnnotatedClass(com.se.toyshop.entity.ShippingAddress.class)
				.addAnnotatedClass(com.se.toyshop.entity.ShoppingCartItem.class)
				.addAnnotatedClass(com.se.toyshop.entity.Brand.class)
				.addAnnotatedClass(com.se.toyshop.entity.Category.class)
				.addAnnotatedClass(com.se.toyshop.entity.Comment.class)
				.getMetadataBuilder()
				.build();

		return meta.getSessionFactoryBuilder()
				.unwrap(OgmSessionFactoryBuilder.class)
				.build();
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);

		return transactionManager;
	}

	@Bean(name = "productDAO")
	public ProductDAO getProductDAO() {
		return new ProductDAOImpl();
	}
	
	@Bean(name = "cartDAO")
	public CartDAO getCartDAO() {
		return new CartDAOImpl();
	}

	@Bean(name = "userDao")
	public UserDao getUserDao() {
		return new UserImpl();
	}
	
	@Bean
	public UserImpl getUserImpl() {
		return new UserImpl();
	}
	
}
