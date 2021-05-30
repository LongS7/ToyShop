package com.se.toyshop.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.bson.types.ObjectId;

@Entity
@Table(name = "brands")
public class Brand implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private ObjectId _id;
	private String name;
	private String origin;

	public Brand() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Brand(ObjectId _id, String name, String origin) {
		super();
		this._id = _id;
		this.name = name;
		this.origin = origin;
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

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	@Override
	public String toString() {
		return "Brand [_id=" + _id + ", name=" + name + ", origin=" + origin + "]";
	}

}
