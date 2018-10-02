package com.dbms.model;


public class Order {

	private int order_id;
	private String username;
	private int transaction_id;
	private String offer_id="None";
	private String address;
	private int subtotal;
	private String delivered_by;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int orderid) {
		this.order_id = orderid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(int subtotal) {
		this.subtotal = subtotal;
	}
	public String getDelivered_by() {
		return delivered_by;
	}
	public void setDelivered_by(String delivered_by) {
		this.delivered_by = delivered_by;
	}
	public String getOffer_id() {
		return offer_id;
	}
	public void setOffer_id(String offer_id) {
		this.offer_id = offer_id;
	}
	
}
