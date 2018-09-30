package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.dbms.model.Offer;

public class OfferdaoImpl implements Offerdao{
	
	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public Offer getOffer(String offer_id) {
		String sql="Select * from offer where offer_id='"+offer_id+"' and status=1";
return jdbcTemplate.query(sql,new ResultSetExtractor<Offer>() {
			
			public Offer extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					Offer offer=new Offer();
					offer.setOfferId(rs.getString("offer_id"));
					offer.setName(rs.getString("name"));
					offer.setDiscount(rs.getInt("discount"));
					offer.setStatus(rs.getInt("status"));
					return offer;
				}
				return null;
			}
			
		});
	}
	
	@Override
	public Boolean checkOffer(String offer_id)
	{
		String sql = "select count(*) from offer where offer_id=? and status=1";
		Integer queryForObject = jdbcTemplate.queryForObject(sql, new Object [] {offer_id}, Integer.class);
		int count = queryForObject;
		if(count>0) return true;
		return false;
	}

	@Override
	public void applyOffer(String offer_id,String username) {
		String sql="update user_cart set offer_id=? where username=? and order_id is NULL";
		jdbcTemplate.update(sql, new Object[] {offer_id, username});
	}

}
