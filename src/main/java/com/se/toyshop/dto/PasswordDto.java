package com.se.toyshop.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class PasswordDto {

	private String token;

	@NotNull(message = "Mật khẩu không được để trống")
	@Size(min = 6, max = 60, message = "Mật khẩu phải từ 6 ký tự")
	private String newPassword;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

}
