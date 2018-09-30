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

import com.dbms.model.Cart;
import com.dbms.model.CartItem;
import com.dbms.model.Employee;
import com.dbms.model.Feedback;
import com.dbms.model.Offer;
import com.dbms.model.Order;
import com.dbms.model.Product;
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
//	@Override
//	public void placeorder(Order order) {
//		
//		Cart cart = order.getCart();
//		Double amount = cartdao.getamount(cart);
//		List<CartItem> cartitems = cart.getCartitems();
//		
//		String sql;
//		
//		sql = "insert into USERORDERS(orderid,username,amount) values (?,?,?)";
//		jdbcTemplate.update(sql,new Object[] {order.getOrderid(), order.getUsername(), amount});
//		
//	
//		
//		for(CartItem cartitem:cartitems) {
//			sql = "insert into ORDERPRODUCTS values(?,?,?)";
//			jdbcTemplate.update(sql,new Object[] {order.getOrderid(), cartitem.getProduct().getProductid(), cartitem.getQuantity()});
//		}
//	}
//	@Override
//	public int getordercount() {
//		String sql = "select count(*) from USERORDERS";
//		int ordercount = jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class);
//		return ordercount;
//	}
////	class Sortbyorderid implements Comparator<Object> 
////	{ 
////	    // Used for sorting in ascending order of 
////	    // roll number 
////	    public int compare(Student a, Student b) 
////	    { 
////	        return a.rollno - b.rollno; 
////	    } 
////	} 
//	@Override
//	public List<Order> getOrdersbyusername(String username) { 
//		String sql = "select * from USERORDERS where username='"+username+"' order by orderid desc";
//		return jdbcTemplate.query(sql,new ResultSetExtractor<List<Order>>() {	
//		
//		public List<Order> extractData(ResultSet rs) throws SQLException,DataAccessException{
//			List<Order> myorders = new ArrayList<Order>();
//			while(rs.next()) {
//				Order order = new Order();
//				order.setUsername(username);
//				order.setOrderid(rs.getInt("orderid"));
//				myorders.add(order);
//			}
////			Collections.sort(myorders,);
//			return myorders;
//		}
//	});
//	}
//	@Override
//	public Cart getCartbyorderid(int orderid, String username) {
//		String sql = "select * from ORDERPRODUCTS where orderid="+Integer.toString(orderid);
//		return jdbcTemplate.query(sql,new ResultSetExtractor<Cart>() {	
//		
//		public Cart extractData(ResultSet rs) throws SQLException,DataAccessException{
//			Cart cart = new Cart();
//			List<CartItem> cartitems = new ArrayList<CartItem>();
//			while(rs.next()) {
//				int productid = rs.getInt("productid");
//				Product product = productdao.getproductbyid(productid);
//				CartItem cartitem = new CartItem();
//				cartitem.setProduct(product);
//				cartitem.setQuantity(rs.getInt("orderquantity"));
//				cartitems.add(cartitem);
//			}
//			cart.setCartitems(cartitems);
//			cart.setUsername(username);
//			return cart;
//		}
//	});
//	}
	
	
	@Override
	public int getProductCount(int order_id) {
		String sql = "select count(*) from user_cart where order_id='"+Integer.toString(order_id)+"'";
		int product_count = jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class);
		return product_count;
	}
	@Override
	public void placeorder(String username) {
		UserCart cart=cartdao.getCartbyusername(username);
		if(cart.getProducts().size()==0)
			return ;
		int order_id=1;
		int amount=cartdao.getamount(username);
		Employee employee=employeedao.allocateEmployee();
		String sql="select Count(*) from orderandbill";
		int count=jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class);
		if(count!=0) 
		{
			sql = "select MAX(order_id) from orderandbill";
			order_id = jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class)+1;
		}
		sql="insert into orderandbill(order_id,username,offer_id,address,subtotal,delivered_by) values(?,?,?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {order_id,username,cart.getOfferId(),"XYZ",amount,employee.getEmpId()});
		sql="update user_cart set order_id= ? where username= ? and order_id is null and reserved_status=0";
		jdbcTemplate.update(sql,new Object[] {order_id,username});
		employeedao.updateEmployee(employee);
		productdao.updateProductStatus(order_id);
	}
	
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
		jdbcTemplate.update(sql,new Object[] {order_id,username,cart.getOfferId(),"XYZ",amount,"Offline"});
		sql="update user_cart set order_id= ? where username= ? and order_id is null and reserved_status=1";
		jdbcTemplate.update(sql,new Object[] {order_id,username});
		productdao.updateProductStatus(order_id);
	}
	
	
	@Override
	public List<Order> getOrdersbyusername(String username) {
		String sql="Select * from orderandbill where username='"+username+"'";
		List<Order> orders= jdbcTemplate.query(sql, new BeanPropertyRowMapper<Order>(Order.class));
		return orders;
	}
	@Override
	public List<myproduct> getCartbyorderid(int orderid) {
		String sql="select * from myproduct where product_id in (select product_id from user_cart where order_id='"+Integer.toString(orderid)+"')";
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
		String sql="select * from orderandbill";
		List<Order> orders= jdbcTemplate.query(sql, new BeanPropertyRowMapper<Order>(Order.class));
		return orders;
	}
	
}