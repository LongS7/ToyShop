package com.se.toyshop.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.bson.types.ObjectId;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "users")
public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private ObjectId _id;

	@NotNull(message = "Tên không được để trống")
	@Pattern(regexp = "^[\\p{L} .'-]+$", message = "Tên chỉ chứa chữ")
	private String name;

	private String photo;

	@NotNull
	private int gender;

	@NotNull(message = "Ngày sinh không được để trống")
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate birthday;

	private String role;

	@NotNull(message = "Email không được để trống")
	@Pattern(regexp = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", message = "Email phải đúng định dạng")
	private String email;

	@NotNull(message = "Số điện thoại không được để trống")
	@Pattern(regexp = "(84|0[3|5|7|8|9])+([0-9]{8})\\b", message = "Số điện thoại phải là số và từ 10 đến 11 số")
	private String phone;

	@ElementCollection(fetch = FetchType.EAGER)
	private List<ShoppingCartItem> listShoppingCartItem;

	@ElementCollection
	private List<ShippingAddress> shippingAddresses;

//	@OneToOne(cascade = { CascadeType.ALL })
	@Embedded
	private Account account;

	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(ObjectId _id, String name, String photo, int gender, LocalDate birthday, String role, String email,
			String phone) {
		super();
		this._id = _id;
		this.name = name;
		this.photo = photo;
		this.gender = gender;
		this.birthday = birthday;
		this.role = role;
		this.email = email;
		this.phone = phone;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Account getAccount() {
		return account;
	}

	public ObjectId get_id() {
		return _id;
	}

	public void set_id(ObjectId _id) {
		this._id = _id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<ShoppingCartItem> getListShoppingCartItem() {
		return listShoppingCartItem;
	}

	public void setListShoppingCartItem(List<ShoppingCartItem> listShoppingCartItem) {
		this.listShoppingCartItem = listShoppingCartItem;
	}

	public List<ShippingAddress> getShippingAddresses() {
		return shippingAddresses;
	}

	public void setShippingAddresses(List<ShippingAddress> shippingAddresses) {
		this.shippingAddresses = shippingAddresses;
	}

	@Override
	public String toString() {
		return "User [_id=" + _id + ", name=" + name + ", photo=" + photo + ", gender=" + gender + ", birthday="
				+ birthday + ", role=" + role + ", email=" + email + ", phone=" + phone + "]";
	}

}
