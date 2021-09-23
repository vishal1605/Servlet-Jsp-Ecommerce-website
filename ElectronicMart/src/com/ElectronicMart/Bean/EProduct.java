package com.ElectronicMart.Bean;

public class EProduct {
	private int id;
	private String name;
	private String description;
	private String category;
	private int price;
	private String image;
	
	public EProduct() {
		super();
	}


	public EProduct(String name, String description, String category, int price, String image) {
		super();
		this.name = name;
		this.description = description;
		this.category = category;
		this.price = price;
		this.image = image;
	}
	
	
	public EProduct(int id, String name, String description, String category, int price, String image) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.category = category;
		this.price = price;
		this.image = image;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}


	@Override
	public String toString() {
		return "EProduct [id=" + id + ", name=" + name + ", description=" + description + ", category=" + category
				+ ", price=" + price + ", image=" + image + "]";
	}
	
	

}
