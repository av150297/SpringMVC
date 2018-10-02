package com.dbms.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Employee {
	@NotEmpty(message="required")
	private String empId;
	@NotEmpty(message="required")
	private String name;
	@NotNull
	private int type;
	@NotNull
	private String contact;
	@NotEmpty(message="required")
	@Email(message="Invalid Email")
	private String email;
	@NotEmpty(message="required")
	private String address;
	private int number_of_order=0;
	private int status=1;
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getNumber_of_order() {
		return number_of_order;
	}
	public void setNumber_of_order(int number_of_order) {
		this.number_of_order = number_of_order;
	}
	
}
