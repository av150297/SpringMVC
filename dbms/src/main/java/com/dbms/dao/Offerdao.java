package com.dbms.dao;

import java.util.List;

import com.dbms.model.Offer;

public interface Offerdao{
	public Offer getOffer(String offer_id);

	public Boolean checkOffer(String offer_id);

	public void applyOffer(String offer_id,String username);

	public void addNewOffer(Offer offer);

	public List<Offer> getAllOffers();

	public void toggle(String offer_id);
}
