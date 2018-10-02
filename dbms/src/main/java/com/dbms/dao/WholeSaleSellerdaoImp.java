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

import com.dbms.model.WholeSaleSeller;

public class WholeSaleSellerdaoImp implements WholeSaleSellerdao {

	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<WholeSaleSeller> showallsellers() {
		String sql="select * from wholesale_seller";
		List<WholeSaleSeller> allsellers= jdbcTemplate.query(sql, new BeanPropertyRowMapper<WholeSaleSeller>(WholeSaleSeller.class));
		return allsellers;
	}

	@Override
	public WholeSaleSeller getsellerbyid(String sellerId) {
		String sql = "select * from wholesaleseller where seller_id='"+sellerId+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<WholeSaleSeller>() {
			
			public WholeSaleSeller extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					WholeSaleSeller seller = new WholeSaleSeller();
					seller.setSeller_id(rs.getString("seller_id"));
					seller.setName(rs.getString("name"));
					seller.setAddress(rs.getString("address"));
					seller.setEmail(rs.getString("email"));
					return seller;
				}
				return null;
			}
			
		});
	}

	@Override
	public void addnewseller(WholeSaleSeller seller) {
		
		String sql = "insert into wholesale_seller values(?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {seller.getSeller_id(),seller.getName(),seller.getEmail(),seller.getAddress()});
		
	}

	@Override
	public boolean checksellerexists(WholeSaleSeller seller) {
		String sql = "select count(*) from wholesale_seller where seller_id=?";
		int count = jdbcTemplate.queryForObject(sql, new Object [] {seller.getSeller_id()}, Integer.class);
		if(count>0) return true;
		return false;
	}
}
