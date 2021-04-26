package com.se.toyshop.entity;

import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.bson.types.ObjectId;

@Entity
@Table(name = "products")
public class Product {
	@Id
	private ObjectId _id;
	private String sku;
	private String name;
	
	@ElementCollection(fetch = FetchType.EAGER)
	private List<String> images;
	private double price;
	private String description;
	private String origin;
	
	@ElementCollection(fetch = FetchType.EAGER)
	private List<String> materials;
	private float discount;
	private int unitInStock;
	
	@ElementCollection(fetch = FetchType.EAGER)
	private List<Comment> comments;
	
	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brand;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;
	
	@ElementCollection(fetch = FetchType.EAGER)
	private List<String> ages;
	
	@Enumerated(EnumType.STRING)
	private Gender gender;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(ObjectId _id, String sku, String name, List<String> images, double price, String description,
			String origin, List<String> materials, float discount, int unitInStock, List<Comment> comments, Brand brand,
			Category category, List<String> ages, Gender gender) {
		super();
		this._id = _id;
		this.sku = sku;
		this.name = name;
		this.images = images;
		this.price = price;
		this.description = description;
		this.origin = origin;
		this.materials = materials;
		this.discount = discount;
		this.unitInStock = unitInStock;
		this.comments = comments;
		this.brand = brand;
		this.category = category;
		this.ages = ages;
		this.gender = gender;
	}

	public ObjectId get_id() {
		return _id;
	}

	public void set_id(ObjectId _id) {
		this._id = _id;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<String> getImages() {
		return images;
	}

	public void setImages(List<String> images) {
		this.images = images;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public List<String> getMaterials() {
		return materials;
	}

	public void setMaterials(List<String> materials) {
		this.materials = materials;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public int getUnitInStock() {
		return unitInStock;
	}

	public void setUnitInStock(int unitInStock) {
		this.unitInStock = unitInStock;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<String> getAges() {
		return ages;
	}

	public void setAges(List<String> ages) {
		this.ages = ages;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Product [_id=" + _id + ", sku=" + sku + ", name=" + name + ", images=" + images + ", price=" + price
				+ ", description=" + description + ", origin=" + origin + ", materials=" + materials + ", discount="
				+ discount + ", unitInStock=" + unitInStock + ", comments=" + comments + ", brand=" + brand
				+ ", category=" + category + ", ages=" + ages + ", gender=" + gender + "]";
	}
	
	
}
