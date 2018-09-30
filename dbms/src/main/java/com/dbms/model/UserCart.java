package com.dbms.model;

import java.util.List;

public class UserCart {
	private String username;
	private List<myproduct> products;
	private int orderId;
	private String offerId="None";
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getOfferId() {
		return offerId;
	}
	public void setOfferId(String offerId) {
		this.offerId = offerId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public List<myproduct> getProducts() {
		return products;
	}
	public void setProducts(List<myproduct> products) {
		this.products = products;
	}
}
