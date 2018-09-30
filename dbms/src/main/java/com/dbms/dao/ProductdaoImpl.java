package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.dbms.model.Product;

public class ProductdaoImpl implements Productdao{

	@Autowired
	  DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Product> showallproducts() {
		String sql="select * from PRODUCTS";
		List<Product> allproducts= jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
		return allproducts;
	}

	@Override
	public List<Product> showallproductsbycategory(int categoryid) {
		String sql = "select * from PRODUCTS where categoryid="+Integer.toString(categoryid);
		List<Product> categoryproducts= jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
		return categoryproducts;
	}

	@Override
	public Product getproductbyid(int productid) {
		String sql = "select * from PRODUCTS where productid="+Integer.toString(productid);
		return jdbcTemplate.query(sql,new ResultSetExtractor<Product>() {
			
			public Product extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					Product product = new Product();
					product.setProductid(rs.getInt("productid"));
					product.setProductname(rs.getString("productname"));
					product.setProductprice(rs.getDouble("productprice"));
					product.setCategoryid(rs.getInt("categoryid"));
					product.setAvailablequantity(rs.getInt("availablequantity"));
					product.setDescription(rs.getString("description"));
					return product;
				}
				return null;
			}
			
		});
	}

	@Override
	public void addnewproduct(Product product) {

		String sql = "insert into PRODUCTS(productname,productprice,categoryid,availablequantity,description) values(?,?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {product.getProductname(), product.getProductprice(), product.getCategoryid(), product.getAvailablequantity(), product.getDescription()});

	}

	@Override
	public boolean checkproductexists(Product product) {
		String sql = "select count(*) from PRODUCTS where productid=?";
		int count = jdbcTemplate.queryForObject(sql, new Object [] {product.getProductid()}, Integer.class);
		if(count>0) return true;
		return false;
	}
	@Override
	public boolean checkproductnameexists(Product product) {
		String sql = "select count(*) from PRODUCTS where productname=?";
		int count = jdbcTemplate.queryForObject(sql, new Object [] {product.getProductname()}, Integer.class);
		if(count>0) return true;
		return false;
	}
	
	
}
