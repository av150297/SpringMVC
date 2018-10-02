package com.dbms.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class Offer
{ 
	@NotEmpty
	private String offer_id;
	@NotEmpty
	private String name;
	@NotNull
	private int discount;
	@NotNull
	private int status=1;
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
