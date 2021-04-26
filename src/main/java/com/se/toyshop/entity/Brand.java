package com.se.toyshop.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.bson.types.ObjectId;

@Entity
@Table(name = "brands")
public class Brand {
	@Id
	private ObjectId _id;
	private String name;
	
	public Brand() {
		// TODO Auto-generated constructor stub
	}

	public Brand(ObjectId _id, String name) {
		super();
		this._id = _id;
		this.name = name;
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

	@Override
	public String toString() {
		return "Brand [_id=" + _id + ", name=" + name + "]";
	}
	

}
