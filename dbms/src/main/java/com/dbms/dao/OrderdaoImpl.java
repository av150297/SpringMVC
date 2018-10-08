package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*; 
import java.io.*; 

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.transaction.annotation.Transactional;

import com.dbms.model.Employee;
import com.dbms.model.Feedback;
import com.dbms.model.Offer;
import com.dbms.model.Order;
import com.dbms.model.User;
import com.dbms.model.UserCart;
import com.dbms.model.myproduct;

public class OrderdaoImpl implements Orderdao{

	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	UserCartdao cartdao;
	@Autowired
	myproductdao productdao;
	@Autowired
	Employeedao employeedao;
	@Autowired
	Userdao userdao;
	
	@Override
	public int getProductCount(int order_id) {
		String sql = "select count(*) from user_cart where order_id='"+Integer.toString(order_id)+"'";
		int product_count = jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class);
		return product_count;
	}
	@Transactional
	@Override
	public void placeorder(String username) {
		UserCart cart=cartdao.getCartbyusername(username);
		if(cart.getProducts().size()==0)
			return ;
		int order_id=1;
		int amount=cartdao.getamount(username);
		Employee employee=employeedao.allocateEmployee();
		User user=userdao.getCustomerbyusername(username);
		String sql="select Count(*) from orderandbill";
		int count=jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class);
		if(count!=0) 
		{
			sql = "select MAX(order_id) from orderandbill";
			order_id = jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class)+1;
		}
		sql="insert into orderandbill(order_id,username,offer_id,address,subtotal,delivered_by) values(?,?,?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {order_id,username,cart.getOfferId(),user.getHouse()+", "+user.getCity()+" "+Integer.toString(user.getPin()),amount,employee.getEmpId()});
		sql="update user_cart set order_id= ? where username= ? and order_id is null and reserved_status=0";
		jdbcTemplate.update(sql,new Object[] {order_id,username});
		employeedao.updateEmployee(employee);
		productdao.updateProductStatus(order_id);
	}
	
	@Transactional
	@Override
	public void placeReserveOrder(String username)
	{
		UserCart cart=cartdao.getReservedCartbyusername(username);
		if(cart.getProducts().size()==0)
			return ;
		int order_id=1;
		int amount=cartdao.getReservedAmount(username);
		String sql="select count(*) from orderandbill";
		int count=jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class);
		if(count!=0) 
		{
			sql = "select MAX(order_id) from orderandbill";
			order_id = jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class)+1;
		}
		sql="insert into orderandbill(order_id,username,offer_id,address,subtotal,delivered_by) values(?,?,?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {order_id,username,cart.getOfferId(),"Offline",amount,"Offline"});
		sql="update user_cart set order_id= ? where username= ? and order_id is null and reserved_status=1";
		jdbcTemplate.update(sql,new Object[] {order_id,username});
		productdao.updateProductStatus(order_id);
	}
	
	
	@Override
	public List<Order> getOrdersbyusername(String username) {
		String sql="Select * from orderandbill where username='"+username+"' order by order_id desc";
		List<Order> orders= jdbcTemplate.query(sql, new BeanPropertyRowMapper<Order>(Order.class));
		return orders;
	}
	@Override
	public List<myproduct> getCartbyorderid(int orderid) {
		String sql="select * from myproduct M,product_image I where product_id in (select product_id from user_cart where order_id='"+Integer.toString(orderid)+"') and M.product_name=I.product_name";
		List<myproduct> products= jdbcTemplate.query(sql, new BeanPropertyRowMapper<myproduct>(myproduct.class));
		return products;
	}
	
	@Override
	public Order getOrderByOrderId(int orderid)
	{
		String sql="select * from orderandbill where order_id='"+Integer.toString(orderid)+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Order>() {
			
			public Order extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					Order order=new Order();
					order.setOrder_id(rs.getInt("order_id"));
					order.setUsername(rs.getString("username"));
					order.setTransaction_id(rs.getInt("transaction_id"));
					order.setAddress(rs.getString("address"));
					order.setOffer_id(rs.getString("offer_id"));
					order.setDelivered_by(rs.getString("delivered_by"));
					order.setOffer_id(rs.getString("offer_id"));
					order.setSubtotal(rs.getInt("subtotal"));
					return order;
				}
				return null;
			}
			
		});
	}
	@Override
	public List<Order> getAllOrders() {
		String sql="select * from orderandbill order by order_id desc";
		List<Order> orders= jdbcTemplate.query(sql, new BeanPropertyRowMapper<Order>(Order.class));
		return orders;
	}
	@Override
	public List<Order> getOrdersByEmployeeId(String emp_id) {
		String sql="select * from orderandbill where delivered_by ='"+emp_id+"' order by order_id desc";
		List<Order> orders= jdbcTemplate.query(sql, new BeanPropertyRowMapper<Order>(Order.class));
		return orders;
	}
	
}