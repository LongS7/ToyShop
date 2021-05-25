package com.se.toyshop.controller.admin;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.OrderDAO;
import com.se.toyshop.dao.UserDao;
import com.se.toyshop.entity.User;

@Controller
public class AdminHomeController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@RequestMapping("/admin")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("admin/home");
		
		mav.addObject("totalOfMonth", orderDAO.getTotalMoneyOfMonth(LocalDate.now()));
		mav.addObject("totalOfDay", orderDAO.getTotalMoneyOfDay(LocalDate.now()));
		
		Map<Integer, Double> map = orderDAO.getTotalMoneyOfYear(LocalDate.now().getYear());
		
		List<String> labels = new ArrayList<String>();
		List<Double> data = new ArrayList<Double>();
		
		for(int i = 1; i <= 12; i++) {
			String month = "";
			switch (i) {
			case 1:
				month = "Tháng một";
				break;
			case 2:
				month = "Tháng hai";
				break;
			case 3:
				month = "Tháng ba";
				break;
			case 4:
				month = "Tháng tư";
				break;
			case 5:
				month = "Tháng năm";
				break;
			case 6:
				month = "Tháng sáu";
				break;
			case 7:
				month = "Tháng bảy";
				break;
			case 8:
				month = "Tháng tám";
				break;
			case 9:
				month = "Tháng chín";
				break;
			case 10:
				month = "Tháng mười";
				break;
			case 11:
				month = "Tháng mười một";
				break;
			case 12:
				month = "Tháng mười hai";
				break;
			
			default:
				break;
			}
			
			if(map.get(i) == null) {
				labels.add(month);
				data.add(0.0);
			} else {
				labels.add(month);
				data.add(map.get(i));
			}
				
		}
		
		mav.addObject("labels", labels);
		mav.addObject("data", data);
		
		User user = getCurrentUser();
		if(user == null)
			return new ModelAndView("redirect:/user/login");
		
		return mav;
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
