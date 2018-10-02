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

import com.dbms.model.Employee;
import com.dbms.model.Offer;

public class EmployeedaoImpl implements Employeedao{

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public Employee getEmployeeById(String emp_id) {
		String sql="select * from employee where emp_id='"+emp_id+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Employee>() {
			
			public Employee extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					Employee employee = new Employee();
					employee.setEmpId(rs.getString("emp_id"));
					employee.setName(rs.getString("name"));
					employee.setType(rs.getInt("type"));
					employee.setContact(rs.getString("contact"));
					employee.setAddress(rs.getString("address"));
					employee.setNumber_of_order(rs.getInt("number_of_orders"));
					employee.setStatus(rs.getInt("status"));
					return employee;
				}
				return null;
			}
			
		});
	}
	@Override
	public Employee allocateEmployee()
	{
		String sql="select * from employee where emp_id !='offline' and status=1 order by number_of_order";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Employee>() {
			
			public Employee extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					Employee employee = new Employee();
					employee.setEmpId(rs.getString("emp_id"));
					employee.setName(rs.getString("name"));
					employee.setType(rs.getInt("type"));
					employee.setContact(rs.getString("contact"));
					employee.setAddress(rs.getString("address"));
					employee.setNumber_of_order(rs.getInt("number_of_order"));
					return employee;
				}
				return null;
			}
			
		});
	}
	
	@Override
	public void updateEmployee(Employee employee)
	{
		String sql="update employee set number_of_order = ? where emp_id = ?";
		jdbcTemplate.update(sql,new Object[] {employee.getNumber_of_order()+1,employee.getEmpId()});
	}
	@Override
	public boolean checkEmployee(Employee employee) {
		String sql = "select count(*) from employee where emp_id=?";
		Integer queryForObject = jdbcTemplate.queryForObject(sql, new Object [] {employee.getEmpId()}, Integer.class);
		int count = queryForObject;
		if(count>0) return true;
		return false;
	}
	@Override
	public void addNewEmployee(Employee employee) {
		String sql="insert into employee values(?,?,?,?,?,?,?,1)";
		jdbcTemplate.update(sql,new Object[] {employee.getEmpId(),employee.getName(),employee.getType(),employee.getContact(),employee.getEmail(),employee.getAddress(),0});
	}
	@Override
	public List<Employee> getAllEmployee() {
		String sql="select * from employee where emp_id !='offline'";
		List<Employee> employees= jdbcTemplate.query(sql, new BeanPropertyRowMapper<Employee>(Employee.class));
		return employees;
	}
	@Override
	public void toggle(String emp_id) {
		String sql="update employee set status=1-status where emp_id=?";
		jdbcTemplate.update(sql, new Object[] {emp_id});
	}

}