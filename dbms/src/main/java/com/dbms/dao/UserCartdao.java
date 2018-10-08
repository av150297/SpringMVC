package com.dbms.dao;

import java.util.List;

import com.dbms.model.UserCart;
import com.dbms.model.myproduct;

public interface UserCartdao {

	public UserCart getCartbyusername(String username);
	public void addToCart(String username, int product_id);
	public void removeFromCart(String username, int product_id);
	public int getCountInCart(String username);
	public boolean isPresentInCart(String username, int product_id);
	public int getamount(String username);
	public void addToReserve(String username);
	public UserCart getReservedCartbyusername(String username);
	public int getReservedAmount(String username);
	public List<myproduct> getReservedOrdersByUsername(String username);
	int getReserveCountInCart(String username);
	public boolean checkReserveOrder(String username);
	public void removeCartByUsername(String username);
	public void removeReservedCartByUsername(String username);
}