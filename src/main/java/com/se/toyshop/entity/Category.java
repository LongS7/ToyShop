package com.se.toyshop.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.bson.types.ObjectId;

@Entity
@Table(name = "categories")
public class Category {
	@Id
	private ObjectId _id;
	private String categoryName;
	private String description;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(ObjectId _id, String categoryName, String description) {
		super();
		this._id = _id;
		this.categoryName = categoryName;
		this.description = description;
	}

	public ObjectId get_id() {
		return _id;
	}

	public void set_id(ObjectId _id) {
		this._id = _id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Category [_id=" + _id + ", categoryName=" + categoryName + ", description=" + description + "]";
	}
	

}
