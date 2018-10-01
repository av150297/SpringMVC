package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import com.dbms.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class UserdaoImpl implements Userdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public UserdaoImpl() {
		
	}
	public UserdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(User user) {
		 String sql = "INSERT INTO USERS(username, password) VALUES (?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getUsername(),user.getPassword()});
		 sql = "INSERT INTO USERS_ROLES(user,role) VALUES(?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getUsername(),"ROLE_USER"});
		 saveOrUpdateCustomer(user);
		 //System.out.println("EROOR");
	}
	public void delete(String username) {
		String sql = "DELETE FROM USERS WHERE username=?";
		jdbcTemplate.update(sql,username);
	}
	public User getUserbyusername(String username) {
		String sql = "SELECT * FROM USERS WHERE username='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<User>() {
		
		public User extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				return user;
			}
			return null;
		}
		
	});
		
	}
	public void saveOrUpdateCustomer(User user) {
		String sql="INSERT INTO customer VALUES(?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {user.getUsername(),user.getName(),user.getHouse(),user.getPin(),user.getCity(),user.getState(),user.getMail()});
	}
	
	public User getCustomerbyusername(String username) {
		String sql = "SELECT * FROM customer WHERE username='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<User>() {
		
	public User extractData(ResultSet rs) throws SQLException,DataAccessException{
		if(rs.next()) {
			User user = new User();
			user.setUsername(rs.getString("username"));
			//user.setPassword(rs.getString("password"));
			user.setName(rs.getString("name"));
			user.setHouse(rs.getString("house"));
			user.setPin(rs.getLong("pincode"));
			user.setCity(rs.getString("city"));
			user.setState(rs.getString("state"));
			user.setMail(rs.getString("email"));
			user.setStatus(rs.getInt("status"));
			return user;
		}
		return null;
	}
	});
	}
	@Override
	  public List<User> showallusers() {
	    String sql = "select * from USERS where username !='root'";
	    List<User> allusers = jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));
	    return allusers;
	 }
	@Override
	public void toggle(String username) {
		String sql="update USERS set status=1-status where username=?";
		jdbcTemplate.update(sql,new Object[] {username});
	}
}