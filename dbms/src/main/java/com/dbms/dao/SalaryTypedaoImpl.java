package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.dbms.model.myproduct;

public class SalaryTypedaoImpl implements SalaryTypedao{

	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public int getSalary(int type) {
		String sql="select * from salary_type where type='"+Integer.toString(type)+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Integer>() {
			
			public Integer extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					return rs.getInt("salary");
				}
				return 0;
			}
			
		});
	}

}
