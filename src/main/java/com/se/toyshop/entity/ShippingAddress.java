package com.se.toyshop.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

@Embeddable
public class ShippingAddress implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@NotNull(message = "Địa chỉ không được để trống")
	private String street;
	@Length(min = 2, message = "Không để trống")
	private String ward;
	@Length(min = 2, message = "Không để trống")
	private String district;
	@Length(min = 2, message = "Không để trống")
	private String province;
	
	public ShippingAddress() {
		// TODO Auto-generated constructor stub
	}

	public ShippingAddress(String street, String ward, String district, String province) {
		super();
		this.street = street;
		this.ward = ward;
		this.district = district;
		this.province = province;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getWard() {
		return ward;
	}

	public void setWard(String ward) {
		this.ward = ward;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	@Override
	public String toString() {
		return street + ", " + ward + ", " + district + ", " + province;
	}
	
}
