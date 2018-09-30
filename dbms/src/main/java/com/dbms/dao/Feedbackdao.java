package com.dbms.dao;

import java.util.List;

import com.dbms.model.Feedback;

public interface Feedbackdao {
	public List<Feedback> getFeedbackbyProductId(int productId);
	public void addFeedack(Feedback feedback);
}
