package com.dbms.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class User{
	@NotEmpty(message="required")
	private String username;
	@NotEmpty(message="required")
	private String password;
	@NotEmpty(message="required")
	private String mpassword;
	@NotEmpty(message="required")
	private String name;
	
	private String house;
	//@NotEmpty(message="required")
	private Long pin;
	@NotEmpty(message="required")
	private String city;
	
	private String state;

	@NotEmpty(message="required")
	@Email(message="Invalid mail")
	private String mail;
	
	public User() {
		
	}
	
	public User(String uname,String pass,String mpass,String name,String house,Long pin,String city,String state,String mail) {
		this.username=uname;
		this.password=pass;
		this.mpassword=mpass;
		this.name=name;
		this.city=city;
		this.house=house;
		this.pin=pin;
		this.state=state;
		this.mail=mail;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMpassword() {
		return mpassword;
	}

	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHouse() {
		return house;
	}

	public void setHouse(String house) {
		this.house = house;
	}

	public Long getPin() {
		return pin;
	}

	public void setPin(Long pin) {
		this.pin = pin;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}
	
	
}