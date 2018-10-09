package com.dbms.dao;

import java.util.List;

import com.dbms.model.SalaryType;

public interface SalaryTypedao {
	public int getSalary(int type);

	public List<SalaryType> getAllTypes();

	public boolean checkTypeExist(int type);

	public void addSalary(SalaryType salary);

	public void updateSalary(int type, int salary);
}
