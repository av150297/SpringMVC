package com.dbms.model;

public class Employee {
	private String empId;
	private String name;
	private int type;
	private int contact;
	private String email;
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
	public int getContact() {
		return contact;
	}
	public void setContact(int contact) {
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
