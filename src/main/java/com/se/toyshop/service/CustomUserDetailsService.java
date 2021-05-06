package com.se.toyshop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.se.toyshop.dao.impl.UserImpl;
import com.se.toyshop.entity.User;

public class CustomUserDetailsService implements UserDetailsService {

	private UserImpl userImpl;

	@Autowired
	public CustomUserDetailsService(UserImpl userImpl) {
		this.userImpl = userImpl;
	}

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userImpl.findByUsername(username);
		if (user != null) {
			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
			authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
			return new org.springframework.security.core.userdetails.User(user.getAccount().getUsername(),
					user.getAccount().getPassword(), authorities);
		} else {
			throw new UsernameNotFoundException(username);
		}
	}

}
