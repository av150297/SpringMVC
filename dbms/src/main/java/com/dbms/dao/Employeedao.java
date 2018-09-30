package com.dbms.dao;

import java.util.List;

import com.dbms.model.Employee;

public interface Employeedao {
	public Employee getEmployeeById(String emp_id);

	public Employee allocateEmployee();


	public void updateEmployee(Employee employee);

	public boolean checkEmployee(Employee employee);

	public void addNewEmployee(Employee employee);

	public List<Employee> getAllEmployee();

	public void toggle(String emp_id);
	
}