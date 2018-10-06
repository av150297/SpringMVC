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

import com.dbms.model.UserCart;
import com.dbms.model.WholeSaleSeller;
import com.dbms.model.myproduct;

public class UserCartdaoImpl implements UserCartdao {
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	
	@Override
	public UserCart getCartbyusername(String username) {
		String sql="select * from myproduct where product_id in (select product_id from user_cart where username='"+username+"' and order_id is NULL and reserved_status=0)";
		List<myproduct> products= jdbcTemplate.query(sql, new BeanPropertyRowMapper<myproduct>(myproduct.class));
		UserCart usercart=new UserCart();
		usercart.setUsername(username);
		usercart.setProducts(products);
		sql="select * from user_cart where username='"+username+"' and order_id is null and reserved_status=0";
		usercart.setOfferId(jdbcTemplate.query(sql,new ResultSetExtractor<String>() {
			
			public String extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					return rs.getString("offer_id");
				}
				return "None";
			}
			
		}));
		return usercart;
	}

	@Override
	public void addToCart(String username, int product_id) {
		if(isPresentInCart(username, product_id)==true)
			return ;
		String sql="insert into user_cart values(?,?,?,'None',0)";
		jdbcTemplate.update(sql, new Object[] {username, product_id,null});
		return ;
	}

	@Override
	public void removeFromCart(String username, int product_id) {
		if(isPresentInCart(username, product_id)==false)
			return ;
		String sql="delete from user_cart where username=? and product_id=? and order_id is NULL";
		jdbcTemplate.update(sql, new Object[] {username, product_id});
		return ;
	}

	@Override
	public int getCountInCart(String username) {
		String sql="select count(*) from user_cart where username=? and order_id is NULL and reserved_status=0";
		int count = jdbcTemplate.queryForObject(sql, new Object[] {username}, Integer.class);
		return count;
	}

	@Override
	public boolean isPresentInCart(String username, int product_id) {
		
		String sql="select count(*) from user_cart where username=? and product_id=?";
		int count = jdbcTemplate.queryForObject(sql, new Object[] {username,product_id}, Integer.class);
		if(count>0)
			return true;
		else
			return false;
		
	}

	@Override
	public int getamount(String username) {
		int count=0;
		if(getCountInCart(username)!=0) 
		{
			String sql="select sum(M.making_charges+M.cost_price) from myproduct M where M.product_id in (select A.product_id from user_cart A where A.username=? and A.order_id is NULL and A.reserved_status=0) ";
			count = jdbcTemplate.queryForObject(sql, new Object[] {username}, Integer.class);
		}
		return count;
	}

	@Override
	public void addToReserve(String username) {
		String sql="update user_cart set reserved_status=1 where username=? and order_id is NULL";
		jdbcTemplate.update(sql, new Object[] {username});
	}

	@Override
	public UserCart getReservedCartbyusername(String username) {
		String sql="select * from myproduct where product_id in (select product_id from user_cart where username='"+username+"' and order_id is NULL and reserved_status=1)";
		List<myproduct> products= jdbcTemplate.query(sql, new BeanPropertyRowMapper<myproduct>(myproduct.class));
		UserCart usercart=new UserCart();
		usercart.setUsername(username);
		usercart.setProducts(products);
		sql="select * from user_cart where username='"+username+"' and order_id is null and reserved_status=1";
		usercart.setOfferId(jdbcTemplate.query(sql,new ResultSetExtractor<String>() {
			
			public String extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					return rs.getString("offer_id");
				}
				return "None";
			}
			
		}));
		return usercart;
	}

	@Override
	public int getReserveCountInCart(String username) {
		String sql="select count(*) from user_cart where username=? and order_id is NULL and reserved_status=1";
		int count = jdbcTemplate.queryForObject(sql, new Object[] {username}, Integer.class);
		return count;
	}
	
	@Override
	public int getReservedAmount(String username) {
		int count=0;
		if(getReserveCountInCart(username)!=0) 
		{
			String sql="select sum(M.making_charges+M.cost_price) from myproduct M where M.product_id in (select A.product_id from user_cart A where A.username=? and A.order_id is NULL and A.reserved_status=1) ";
			count = jdbcTemplate.queryForObject(sql, new Object[] {username}, Integer.class);
		}
		return count;
	}

	@Override
	public List<myproduct> getReservedOrdersByUsername(String username) {
		String sql="select * from myproduct where product_id in (select product_id from user_cart where username='"+username+"' and reserved_status=1 and order_id is null)";
		List<myproduct> products= jdbcTemplate.query(sql, new BeanPropertyRowMapper<myproduct>(myproduct.class));
		return products;
	}

	@Override
	public boolean checkReserveOrder(String username) {
		String sql="select count(*) from user_cart where username=? and order_id is NULL and reserved_status=1";
		int count = jdbcTemplate.queryForObject(sql, new Object[] {username}, Integer.class);
		if(count>0)
			return true;
		else
			return false;
	}
}