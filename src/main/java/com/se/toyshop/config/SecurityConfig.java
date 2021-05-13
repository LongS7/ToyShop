package com.se.toyshop.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.se.toyshop.dao.impl.UserImpl;
import com.se.toyshop.service.CustomUserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Autowired
	private UserImpl userImpl;
	
	@Bean
	public DaoAuthenticationProvider authProvider() {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
		authProvider.setUserDetailsService(new CustomUserDetailsService(userImpl));
		authProvider.setPasswordEncoder(passwordEncoder());
		return authProvider;
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.formLogin()
		.loginPage("/user/login")
		.failureUrl("/user/login?error=true")
		.permitAll()
		.and()
		.rememberMe() //Default token valid for up to two weeks, default private key is SpringSecured
		.userDetailsService(new CustomUserDetailsService(userImpl))
		.and()
		.logout()
		.logoutSuccessUrl("/")
		.and()
		.authorizeRequests()
		.antMatchers("/user/me").hasAnyRole("USER", "ADMIN")
		.anyRequest().permitAll();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		auth.userDetailsService(new CustomUserDetailsService(userImpl));
		auth.authenticationProvider(authProvider());
	}

}
