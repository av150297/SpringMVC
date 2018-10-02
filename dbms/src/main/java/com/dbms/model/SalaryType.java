package com.dbms.model;

import javax.validation.constraints.NotNull;

public class SalaryType {
	@NotNull
	private int type;
	@NotNull
	private int salary;
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	
	
}
