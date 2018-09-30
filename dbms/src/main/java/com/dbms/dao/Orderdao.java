package com.dbms.dao;

import java.util.List;

import com.dbms.model.Order;
import com.dbms.model.UserCart;
import com.dbms.model.myproduct;

public interface Orderdao {

	public int getProductCount(int orderid);
	public List<Order> getOrdersbyusername(String username);
	public List<myproduct> getCartbyorderid(int orderid);
	void placeorder(String username);
	void placeReserveOrder(String username);
	public Order getOrderByOrderId(int orderid);
	public List<Order> getAllOrders();
}