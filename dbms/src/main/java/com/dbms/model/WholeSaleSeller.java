package com.dbms.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class WholeSaleSeller {
	@NotEmpty(message="required")
	private String seller_id;
	@NotEmpty(message="required")
	private String name;
	@NotEmpty(message="required")
	@Email(message="invalid email")
	private String email;
	@NotEmpty(message="required")
	private String address;
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String sellerId) {
		this.seller_id = sellerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String mail) {
		this.email = mail;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
