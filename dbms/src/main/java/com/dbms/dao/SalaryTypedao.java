package com.dbms.dao;

import java.util.List;

import com.dbms.model.SalaryType;

public interface SalaryTypedao {
	public int getSalary(int type);

	public List<SalaryType> getAllTypes();
}
