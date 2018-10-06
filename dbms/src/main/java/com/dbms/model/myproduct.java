package com.dbms.model;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Blob;

import javax.persistence.Transient;
import javax.validation.constraints.*;

public class myproduct {
	@Range(min=0,max=9999999,message="Enter a id between 0 to 9999999 ")
	private int product_id;
	@NotEmpty(message="required")
	private String seller_id;
	@NotEmpty(message="required")
	private String product_name;
	@NotEmpty(message="required")
	private String product_type;
	@NotEmpty(message="required")
	private String category;
	@Range(min=0,max=1000,message="Enter a appropiate weight ")
	private Double gold=0.0;
	@NotNull
	@Range(min=0,max=1000,message="Enter a appropiate weight ")
	private Double silver=0.0;
	//@NotEmpty(message="required")
	@Range(min=0,max=1000,message="Enter a appropiate weight ")
	private Double platinum=0.0;
	
	private String stones;
	//@NotEmpty(message="required")
	@Range(min=0,max=1000000,message="Enter a appropiate price ")
	private Double cost_price;
	//@NotEmpty(message="required")
	@Range(min=0,max=1000000,message="Enter a appropiate price ")
	private Double making_charges;
	@NotEmpty(message="required")
	private String description;
	private int status=0;
	private Blob product_image;
	
	public Blob getProduct_image() {
		return product_image;
	}
	public void setProduct_image(Blob product_image) {
		this.product_image = product_image;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Double getGold() {
		return gold;
	}
	public void setGold(Double gold) {
		this.gold = gold;
	}
	public Double getSilver() {
		return silver;
	}
	public void setSilver(Double silver) {
		this.silver = silver;
	}
	public Double getPlatinum() {
		return platinum;
	}
	public void setPlatinum(Double platinum) {
		this.platinum = platinum;
	}
	public String getStones() {
		return stones;
	}
	public void setStones(String stones) {
		this.stones = stones;
	}
	public Double getCost_price() {
		return cost_price;
	}
	public void setCost_price(Double cost_price) {
		this.cost_price = cost_price;
	}
	public Double getMaking_charges() {
		return making_charges;
	}
	public void setMaking_charges(Double making_charges) {
		this.making_charges = making_charges;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}