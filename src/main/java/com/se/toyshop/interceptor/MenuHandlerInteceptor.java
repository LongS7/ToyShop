package com.se.toyshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.CategoryDAO;
import com.se.toyshop.dao.UserDao;
import com.se.toyshop.entity.User;

public class MenuHandlerInteceptor implements HandlerInterceptor {
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private UserDao userDao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		request.setAttribute("categories", categoryDAO.getAllCategories());
		
		User user = getCurrentUser();
		
		request.setAttribute("currentUser", user);
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	private User getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if(authentication.isAuthenticated()) {
			String username;
			if(authentication.getPrincipal() instanceof UserDetails)
				username = ((UserDetails) authentication.getPrincipal()).getUsername();
			else
				username = authentication.getPrincipal().toString();
			
			User user = userDao.findByUsername(username);
			
			return user;
		}
		
		return null;
	}

}
