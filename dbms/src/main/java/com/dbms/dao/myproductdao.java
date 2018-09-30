package com.dbms.dao;

import java.util.List;

import com.dbms.model.myproduct;

public interface myproductdao {
	
	public List<myproduct> showallproducts();
	public List<myproduct> showallproductsbycategory(String category);
	public myproduct getproductbyname(String product_name); 
	public myproduct getproductbyid(int productid);
	public void addnewproduct(myproduct product);
	public boolean checkproductexists(myproduct product);
	public boolean checkproductnameexists(myproduct product);
	public List<myproduct> getAllCategories();
	public void updateProductStatus(int order_id);
	public myproduct getAvailableProductByName(String product_name, String category);

}