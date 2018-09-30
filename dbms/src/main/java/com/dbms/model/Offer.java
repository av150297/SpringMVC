package com.dbms.model;

public class Offer
{ 
	private String offer_id;
	private String name;
	private int discount;
	private int status;
	public String getOffer_id() {
		return offer_id;
	}
	public void setOffer_id(String offerId) {
		this.offer_id = offerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
