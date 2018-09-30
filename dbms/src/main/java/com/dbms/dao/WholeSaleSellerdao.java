package com.dbms.dao;

import java.util.List;

import com.dbms.model.WholeSaleSeller;

public interface WholeSaleSellerdao {
	
	public List<WholeSaleSeller> showallsellers();
	public WholeSaleSeller getsellerbyid(String sellerId);
	public void addnewseller(WholeSaleSeller seller);
	public boolean checksellerexists(WholeSaleSeller seller);
}
