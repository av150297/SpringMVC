package com.dbms.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class WholeSaleSeller {
	@NotEmpty(message="required")
	private String sellerId;
	@NotEmpty(message="required")
	private String name;
	@NotEmpty(message="required")
	@Email(message="invalid email")
	private String mail;
	@NotEmpty(message="required")
	private String address;
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
