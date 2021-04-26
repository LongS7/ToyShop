package com.se.toyshop.entity;

import java.time.LocalDateTime;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class Comment {
	private float rate;
	private String content;
	private LocalDateTime date;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private User user;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(float rate, String content, LocalDateTime date, User user) {
		super();
		this.rate = rate;
		this.content = content;
		this.date = date;
		this.user = user;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Comment [rate=" + rate + ", content=" + content + ", date=" + date + ", user=" + user + "]";
	}

	
	
}
