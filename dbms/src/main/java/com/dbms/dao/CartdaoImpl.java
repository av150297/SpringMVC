package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.dbms.model.Cart;
import com.dbms.model.CartItem;
import com.dbms.model.Product;

public class CartdaoImpl implements Cartdao{

	@Autowired
    DataSource datasource;

    @Autowired
	JdbcTemplate jdbcTemplate;
    
	
	@Override
	public Cart getCartbyusername(String username) {
		String sql="select * from CART natural join PRODUCTS where username='"+username+"'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Cart>() {

			@Override
			public Cart extractData(ResultSet rs) throws SQLException, DataAccessException {
				
				Cart cart = new Cart();
				List<CartItem> cartitems = new ArrayList<CartItem>();
				if(!rs.isBeforeFirst())
					return null;
				while(rs.next()) {
					Product product = new Product();
					CartItem cartitem = new CartItem();
					product.setProductid(rs.getInt("productid"));
					product.setProductname(rs.getString("productname"));
					product.setProductprice(rs.getDouble("productprice"));
					cartitem.setProduct(product);
					cartitem.setQuantity(rs.getInt("quantity"));
					cartitems.add(cartitem);
				}
				cart.setCartitems(cartitems);
				return cart;
			}
			
		});
		
	}

	@Override
	public void addToCart(String username, Product product) {
		if(isPresentInCart(username,product) == false) {
			String sql="insert into CART values(?,?,1)";
			jdbcTemplate.update(sql, new Object[] {username, product.getProductid()});
			return;
		}
		int productcount=getCountInCart(username, product);
		String sql="update CART set quantity=? where username=? and productid=?";
		jdbcTemplate.update(sql, new Object[] {++productcount, username, product.getProductid()});
		return;
	}

	@Override
	public void removeFromCart(String username, Product product) {
		int productcount=getCountInCart(username, product);
		if(productcount==1) {
			String sql = "delete from CART where username=? and productid=?";
			jdbcTemplate.update(sql, new Object[] {username, product.getProductid()});	
			return;
		}
		String sql="update CART set quantity=? where username=? and productid=?";
		jdbcTemplate.update(sql, new Object[] {--productcount, username, product.getProductid()});
		return;
	}

	@Override
	public int getCountInCart(String username, Product product) {
		String sql="select (quantity) from CART where username=? and productid=?";
		int count = jdbcTemplate.queryForObject(sql, new Object[] {username, product.getProductid()}, Integer.class);
		return count;
	}
	
	@Override
	public boolean isPresentInCart(String username, Product product) {
		String sql="select count(quantity) from CART where username=? and productid=?";
		int count = jdbcTemplate.queryForObject(sql, new Object[] {username, product.getProductid()}, Integer.class);
		return count>0?true:false;
	}

	@Override
	public Double getamount(Cart cart) {
		Double amount=0.0;
		List<CartItem> cartitems = cart.getCartitems();
		for(CartItem cartitem:cartitems) {
			Double productvalue = cartitem.getProduct().getProductprice();
			int productquantity = cartitem.getQuantity();
			amount=amount+1.0*productvalue*productquantity;
		}
		return amount;
	}
	
}
