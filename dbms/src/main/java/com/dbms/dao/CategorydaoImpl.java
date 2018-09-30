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

import com.dbms.model.Category;

public class CategorydaoImpl implements Categorydao{

	  @Autowired
	  DataSource datasource;

	  @Autowired
	  JdbcTemplate jdbcTemplate;

	  @Override
	  public List<Category> showallcategories() {
	    String sql = "select * from CATEGORIES";
	    List<Category> allcategories = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
	    return allcategories;
	 }

	@Override
	public Category getcategorybyid(int categoryid) {
		String sql = "select * from CATEGORIES where categoryid="+Integer.toString(categoryid);
		return jdbcTemplate.query(sql,new ResultSetExtractor<Category>() {
			
		public Category extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Category category = new Category();
				category.setCategoryid(rs.getInt("categoryid"));
				category.setCategoryname(rs.getString("categoryname"));
				return category;
			}
			return null;
		}
		
	});
	}
	@Override
	public boolean checkcategoryexists(Category category) {
		String sql = "select count(*) from CATEGORIES where categoryid=?";
		int count = jdbcTemplate.queryForObject(sql, new Object [] {category.getCategoryid()}, Integer.class);
		if(count>0) return true;
		return false;
	}
	@Override
	public void addcategory(Category category) {

		String sql = "insert into CATEGORIES(categoryname) values(?)";
		jdbcTemplate.update(sql,new Object[] {category.getCategoryname()});

	}
}
