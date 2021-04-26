package com.se.toyshop.entity;

import javax.persistence.Embeddable;

@Embeddable
public class ShippingAddress {
	private String street;
	private String ward;
	private String district;
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
		return "ShippingAddress [street=" + street + ", ward=" + ward + ", district=" + district + ", province="
				+ province + "]";
	}
	
}
