package com.se.toyshop.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.bson.types.ObjectId;
import org.hibernate.ogm.options.shared.IndexOption;
import org.hibernate.ogm.options.shared.IndexOptions;

@Entity
@Table(name="products",
		indexes = @Index(columnList = "name, sku", name="product_name_sku"))
@IndexOptions(@IndexOption(forIndex = "product_name_sku", options = "{text:true}"))
public class Product implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((_id == null) ? 0 : _id.hashCode());
		result = prime * result + ((brand == null) ? 0 : brand.hashCode());
		result = prime * result + ((category == null) ? 0 : category.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((origin == null) ? 0 : origin.hashCode());
		long temp;
		temp = Double.doubleToLongBits(price);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((sku == null) ? 0 : sku.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (_id == null) {
			if (other._id != null)
				return false;
		} else if (!_id.equals(other._id))
			return false;
		if (brand == null) {
			if (other.brand != null)
				return false;
		} else if (!brand.equals(other.brand))
			return false;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (origin == null) {
			if (other.origin != null)
				return false;
		} else if (!origin.equals(other.origin))
			return false;
		if (Double.doubleToLongBits(price) != Double.doubleToLongBits(other.price))
			return false;
		if (sku == null) {
			if (other.sku != null)
				return false;
		} else if (!sku.equals(other.sku))
			return false;
		return true;
	}
	
	public float getRating() {
		if(comments == null || comments.size() == 0)
			return 0;
		
		float sum = 0;
		for(Comment comment : comments)
			sum += comment.getRate();
		
		return sum / comments.size();
	}

	public void addComment(Comment comment) {
		if(comments == null)
			comments = new ArrayList<Comment>();
		
		for(Comment item : comments)
			if(item.getUser().equals(comment.getUser()))
				return;
		
		comments.add(comment);
		
	}
	
	public boolean hasCommentOfUser(User user) {
		if(comments == null)
			return false;
		
		for(Comment item : comments)
			if(item.getUser().get_id().equals(user.get_id()))
				return true;
		
		return false;
	}
	
}
