package com.ElectronicMart.Bean;

public class Category {
	private int categoryId;
	private String category;
	private String description;
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Category(String category, String description) {
		super();
		this.category = category;
		this.description = description;
	}
	public Category(int categoryId, String category, String description) {
		super();
		this.categoryId = categoryId;
		this.category = category;
		this.description = description;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", category=" + category + ", description=" + description + "]";
	}
	
	

}
