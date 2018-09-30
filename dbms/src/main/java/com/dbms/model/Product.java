package com.dbms.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Product {

	@NotEmpty(message="required")
	@Range(min=0,max=9999999,message="Enter a id between 0 to 9999999 ")
	private int productid;
	@NotEmpty(message="required")
	private String productname;
	@NotEmpty(message="required")
	@Range(min=0,max=9999999,message="Enter a valid price")
	private Double productprice;
	private int categoryid;
	private int availablequantity;
	private String description;
	
	public int getAvailablequantity() {
		return availablequantity;
	}
	public void setAvailablequantity(int availablequantity) {
		this.availablequantity = availablequantity;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public Double getProductprice() {
		return productprice;
	}
	public void setProductprice(Double productprice) {
		this.productprice = productprice;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	
	
}
