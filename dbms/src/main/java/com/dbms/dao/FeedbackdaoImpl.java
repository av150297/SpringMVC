package com.dbms.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.dbms.model.Employee;
import com.dbms.model.Feedback;
import com.dbms.model.myproduct;

public class FeedbackdaoImpl implements Feedbackdao{

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<Feedback> getFeedbackbyProductId(int productId) {
		String sql="Select * from feedback where product_id='"+Integer.toString(productId)+"'";
		List<Feedback> feedbacks= jdbcTemplate.query(sql, new BeanPropertyRowMapper<Feedback>(Feedback.class));
		return feedbacks;
	}

	@Override
	public void addFeedack(Feedback feedback) {
		String sql="insert into feedback(product_id,username,description) values(?,?,?)";
		jdbcTemplate.update(sql,new Object[] {feedback.getProductId(),feedback.getUsername(),feedback.getDescription()});
	}

	@Override
	public void deleteFeedback(int feedbackid) {
		String sql="delete from feedback where feedback_id=?";
		jdbcTemplate.update(sql,new Object[] {feedbackid});
	}
	
}
