package com.dbms.dao;


import com.dbms.model.Cart;
import com.dbms.model.Product;

public interface Cartdao {

	public Cart getCartbyusername(String username);
	public void addToCart(String username, Product product);
	public void removeFromCart(String username, Product product);
	public int getCountInCart(String username, Product product);
	public boolean isPresentInCart(String username, Product product);
	public Double getamount(Cart cart);
}
