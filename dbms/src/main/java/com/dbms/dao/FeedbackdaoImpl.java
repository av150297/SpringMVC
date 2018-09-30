package com.dbms.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.dbms.model.Feedback;
import com.dbms.model.myproduct;

public class FeedbackdaoImpl implements Feedbackdao{

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public void addFeedack(Feedback feedback) {
		String sql="insert into feedback(product_id,username,description)";
		jdbcTemplate.update(sql,new Object[] {feedback.getProductId(),feedback.getUsername(),feedback.getDescription()});
	}

	@Override
	public List<Feedback> getFeedbackbyProductId(int productId) {
		String sql="Select * from feedback where product_id='"+Integer.toString(productId)+"'";
		List<Feedback> feedbacks= jdbcTemplate.query(sql, new BeanPropertyRowMapper<Feedback>(Feedback.class));
		return feedbacks;
	}
}
