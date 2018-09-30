package com.dbms.dao;

import com.dbms.model.Offer;

public interface Offerdao{
	public Offer getOffer(String offer_id);

	public Boolean checkOffer(String offer_id);

	public void applyOffer(String offer_id,String username);
}
