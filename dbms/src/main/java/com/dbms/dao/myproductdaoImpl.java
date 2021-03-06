package com.dbms.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.transaction.annotation.Transactional;

//import com.dbms.model.Product;
import com.dbms.model.myproduct;

public class myproductdaoImpl implements myproductdao{
	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	@Override
	public List<myproduct> allproducts() {
		String sql="select * from myproduct order by status";
		List<myproduct> allproducts= jdbcTemplate.query(sql, new BeanPropertyRowMapper<myproduct>(myproduct.class));
		return allproducts;
	}
	
	@Override
	public List<myproduct> showallproducts() {
		String sql="select Distinct M.product_name,image,description,making_charges,cost_price,category from myproduct M,product_image I where M.product_name=I.product_name and M.status=0";
		List<myproduct> allproducts= jdbcTemplate.query(sql, new BeanPropertyRowMapper<myproduct>(myproduct.class));
		return allproducts;
	}
	
	@Override
	public List<myproduct> getProductsbySeller(String seller_id) {
		String sql="select * from myproduct where seller_id='"+seller_id+"'";
		List<myproduct> allproducts= jdbcTemplate.query(sql, new BeanPropertyRowMapper<myproduct>(myproduct.class));
		return allproducts;
	}

	@Override
	public List<myproduct> showallproductsbycategory(String category) {
		String sql = "select distinct myproduct.product_name,product_type,gold,silver,platinum,stones,cost_price,making_charges,description,category,image from myproduct,product_image where category='"+category+"' and myproduct.product_name=product_image.product_name and status=0";
		List<myproduct> categoryproducts= jdbcTemplate.query(sql, new BeanPropertyRowMapper<myproduct>(myproduct.class));
		return categoryproducts;
	}

	@Override
	public myproduct getproductbyid(int productid) {
		String sql = "select * from myproduct M,product_image I where product_id="+Integer.toString(productid)+" and M.product_name=I.product_name";
		return jdbcTemplate.query(sql,new ResultSetExtractor<myproduct>() {
			
			public myproduct extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					myproduct product = new myproduct();
					product.setProduct_id(rs.getInt("product_id"));
					product.setProduct_name(rs.getString("product_name"));
					product.setCategory(rs.getString("category"));
					product.setCost_price((double)rs.getInt("cost_price"));
					product.setGold((double)rs.getInt("gold"));
					product.setSilver((double)rs.getInt("silver"));
					product.setPlatinum((double)rs.getInt("platinum"));
					product.setSeller_id(rs.getString("seller_id"));
					product.setDescription(rs.getString("description"));
					product.setMaking_charges((double)rs.getInt("making_charges"));
					product.setStones(rs.getString("stones"));
					product.setProduct_type(rs.getString("product_type"));
					product.setStatus(rs.getInt("status"));
					product.setImage(rs.getBlob("image"));
					return product;
				}
				return null;
			}
			
		});
	}
	@Transactional
	@Override
	public void addnewproduct(myproduct product) {

		String sql = "insert into productIdTable values(?,?,?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {product.getProduct_id(),product.getProduct_name(),product.getSeller_id(),product.getStatus(),product.getCost_price(),product.getMaking_charges()});
		
	}
	
	@Override
	public void addnewProductname(myproduct product)
	{
		String sql = "insert into productNameTable values(?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {product.getProduct_name(),product.getProduct_type(),product.getCategory(),product.getGold(),product.getSilver(),product.getPlatinum(),product.getStones(),product.getDescription()});
	}

	@Override
	public boolean checkproductexists(myproduct product) {
		String sql = "select count(*) from myproduct where product_id=?";
		int count = jdbcTemplate.queryForObject(sql, new Object [] {product.getProduct_id()}, Integer.class);
		if(count>0) return true;
		return false;
	}
	@Override
	public boolean checkproductnameexists(myproduct product) {
		String sql = "select count(*) from myproduct where product_id=?";
		int count = jdbcTemplate.queryForObject(sql, new Object [] {product.getProduct_id()}, Integer.class);
		if(count>0) return true;
		return false;
	}

	@Override
	public myproduct getproductbyname(String product_name) {
		String sql="select * from myproduct P,product_image I where P.product_name='"+product_name+"' and P.product_name=I.product_name and status=0";
		myproduct product=jdbcTemplate.query(sql,new ResultSetExtractor<myproduct>() {
			
			public myproduct extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					myproduct product = new myproduct();
					product.setProduct_id(rs.getInt("product_id"));
					product.setProduct_name(rs.getString("product_name"));
					product.setCategory(rs.getString("category"));
					product.setCost_price((double)rs.getInt("cost_price"));
					product.setGold((double)rs.getInt("gold"));
					product.setSilver((double)rs.getInt("silver"));
					product.setPlatinum((double)rs.getInt("platinum"));
					product.setSeller_id(rs.getString("seller_id"));
					product.setDescription(rs.getString("description"));
					product.setMaking_charges((double)rs.getInt("making_charges"));
					product.setStones(rs.getString("stones"));
					product.setProduct_type(rs.getString("product_type"));
					product.setImage(rs.getBlob("image"));
					return product;
				}
				return null;
			}
			
		});
		
		return product;
	}

	@Override
	public List<myproduct> getAllCategories() {
		String sql="select Distinct category from myproduct";
		List<myproduct> allcategories= jdbcTemplate.query(sql, new BeanPropertyRowMapper<myproduct>(myproduct.class));
		return allcategories;
	}
	
	@Override
	public void updateProductStatus(int order_id)
	{
		String sql="update productIdTable M set M.status=1 where M.product_id in (select U.product_id from user_cart U where U.order_id = ?)";
		jdbcTemplate.update(sql,new Object[] {order_id});
	}

	@Override
	public myproduct getAvailableProductByName(String product_name,String category) {
		String sql="select * from myproduct M where product_name='"+product_name+"' and category='"+category+"' and product_id not in (Select distinct product_id from user_cart)";
		return jdbcTemplate.query(sql,new ResultSetExtractor<myproduct>() {
			
			public myproduct extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					myproduct product = new myproduct();
					product.setProduct_id(rs.getInt("product_id"));
					product.setProduct_name(rs.getString("product_name"));
					product.setCategory(rs.getString("category"));
					product.setCost_price((double)rs.getInt("cost_price"));
					product.setGold((double)rs.getInt("gold"));
					product.setSilver((double)rs.getInt("silver"));
					product.setPlatinum((double)rs.getInt("platinum"));
					product.setSeller_id(rs.getString("seller_id"));
					product.setDescription(rs.getString("description"));
					product.setMaking_charges((double)rs.getInt("making_charges"));
					product.setStones(rs.getString("stones"));
					product.setProduct_type(rs.getString("product_type"));
					return product;
				}
				return null;
			}
			
		});
	}
	
	@Override
	public void setProductImage(String id,InputStream is,byte[] barr) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/spring";
		String user="root";
		String password="audirs8";
		Connection con=DriverManager.getConnection(url, user, password);
		String sql="insert into product_image values(?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setBinaryStream(2,is,barr.length);
		ps.executeUpdate();
	}
	
	@Transactional
	@Override
	public void UpdateProduct(myproduct product) {
		String sql = "update productNameTable set gold=?,silver=?,platinum=?,stones=?,description=? where product_name=?";
		jdbcTemplate.update(sql,new Object[] {product.getGold(),product.getSilver(),product.getPlatinum(),product.getStones(),product.getDescription(),product.getProduct_name()});
		sql = "update productIdTable set cost_price=?,making_charges=? where product_name=? and status=0";
		jdbcTemplate.update(sql,new Object[] {product.getCost_price(),product.getMaking_charges(),product.getProduct_name()});
	}

	@Override
	public List<myproduct> getProductNames() {
		String sql="select distinct product_name from myproduct";
		List<myproduct> allproducts= jdbcTemplate.query(sql, new BeanPropertyRowMapper<myproduct>(myproduct.class));
		return allproducts;
	}

	
}