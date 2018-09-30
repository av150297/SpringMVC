package com.dbms.dao;

import java.util.List;

import com.dbms.model.Category;

public interface Categorydao {
	
	public List<Category> showallcategories();
	public Category getcategorybyid(int categoryid);
	public boolean checkcategoryexists(Category category);
	public void addcategory(Category category);
}
