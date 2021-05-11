package com.se.toyshop.entity;

import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

//@Entity
//@Table(name = "accounts", uniqueConstraints = { @UniqueConstraint(columnNames = { "username" }) })
@Embeddable
public class Account {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private ObjectId _id;
	
//	@NotNull(message = "Tên đăng nhập không được để trống")
//	@Pattern(regexp = "^[a-zA-Z0-9_-]{3,16}$", message = "Tên đăng nhập phải đúng định dạng")
	private String username;
	
//	@NotNull(message = "Mật khẩu không được để trống")
//	@Size(min = 6, max = 32, message = "Mật khẩu phải từ 6 đến 32 ký tự")
	private String password;

	public Account() {
	}

	public Account(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Account [username=" + username + ", password=" + password + "]";
	}

}
