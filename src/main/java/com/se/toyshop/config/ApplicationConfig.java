package com.se.toyshop.config;

import java.util.Properties;

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
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.se.toyshop.dao.AddressDao;
import com.se.toyshop.dao.CartDAO;
import com.se.toyshop.dao.CategoryDAO;
import com.se.toyshop.dao.OrderDAO;
import com.se.toyshop.dao.PasswordResetTokenDAO;
import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.dao.UserDao;
import com.se.toyshop.dao.impl.AddressDaoImpl;
import com.se.toyshop.dao.impl.CartDAOImpl;
import com.se.toyshop.dao.impl.CategoryDAOImpl;
import com.se.toyshop.dao.impl.OrderDaoImpl;
import com.se.toyshop.dao.impl.PasswordResetTokenDAOImpl;
import com.se.toyshop.dao.impl.ProductDAOImpl;
import com.se.toyshop.dao.impl.UserImpl;
import com.se.toyshop.service.ISecurityUserService;
import com.se.toyshop.service.impl.UserSecurityService;

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
				.applySetting(OgmProperties.ENABLED, true).configure().build();

		Metadata meta = new MetadataSources(registry).addAnnotatedClass(com.se.toyshop.entity.User.class)
				.addAnnotatedClass(com.se.toyshop.entity.Product.class)
				.addAnnotatedClass(com.se.toyshop.entity.Account.class)
				.addAnnotatedClass(com.se.toyshop.entity.OrderDetail.class)
				.addAnnotatedClass(com.se.toyshop.entity.Order.class)
				.addAnnotatedClass(com.se.toyshop.entity.ShippingAddress.class)
				.addAnnotatedClass(com.se.toyshop.entity.ShoppingCartItem.class)
				.addAnnotatedClass(com.se.toyshop.entity.Brand.class)
				.addAnnotatedClass(com.se.toyshop.entity.Category.class)
				.addAnnotatedClass(com.se.toyshop.entity.Comment.class)
				.addAnnotatedClass(com.se.toyshop.entity.PasswordResetToken.class).getMetadataBuilder().build();

		return meta.getSessionFactoryBuilder().unwrap(OgmSessionFactoryBuilder.class).build();
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

	@Bean(name = "orderDao")
	public OrderDAO getOrderDAO() {
		return new OrderDaoImpl();
	}

	@Bean(name = "categoryDao")
	public CategoryDAO getCategoryDAO() {
		return new CategoryDAOImpl();
	}

	@Bean(name = "addressDao")
	public AddressDao getAddressDao() {
		return new AddressDaoImpl();
	}

	@Bean(name = "passwordResetTokenDao")
	public PasswordResetTokenDAO getPasswordResetTokenDAO() {
		return new PasswordResetTokenDAOImpl();
	}
	
	@Bean
	public JavaMailSender getJavaMailSender() {
	    JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	    mailSender.setDefaultEncoding("UTF-8");
	    mailSender.setHost("smtp.gmail.com");
	    mailSender.setPort(587);
	    
	    mailSender.setUsername("hotro.toyshop@gmail.com");
	    mailSender.setPassword("toyshop2021");
	    
	    Properties props = mailSender.getJavaMailProperties();
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.debug", "true");
	    
	    return mailSender;
	}
	
	@Bean(name = "securityService")
	public ISecurityUserService getISecurityUserService() {
		return new UserSecurityService();
	}
}
