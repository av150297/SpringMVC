package com.dbms.dao;

import java.util.List;

import com.dbms.model.Product;

public interface Productdao {
	
	public List<Product> showallproducts();
	public List<Product> showallproductsbycategory(int categoryid);
	public Product getproductbyid(int productid);
	public void addnewproduct(Product product);
	public boolean checkproductexists(Product product);
	public boolean checkproductnameexists(Product product);

}
