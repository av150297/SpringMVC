package com.dbms.dao;

import com.dbms.model.UserCart;

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
}