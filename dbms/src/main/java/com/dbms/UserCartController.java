package com.dbms;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dbms.dao.Cartdao;
import com.dbms.dao.Offerdao;
import com.dbms.dao.Orderdao;
import com.dbms.dao.Productdao;
import com.dbms.dao.UserCartdao;
import com.dbms.dao.myproductdao;
import com.dbms.model.Cart;
import com.dbms.model.Offer;
import com.dbms.model.myproduct;
import com.dbms.model.UserCart;

@Controller
public class UserCartController {

	@Autowired
	Cartdao cartdao;
	
	@Autowired
	UserCartdao usercartdao;
	@Autowired
	myproductdao myproduct_dao;
	@Autowired
	Productdao product_dao;
	@Autowired
	Offerdao offerdao;
	@Autowired
	Orderdao orderdao;
	
	
	@RequestMapping(value="/dashboard/my_cart")
	public ModelAndView showcart(Principal principal) {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("user_products");
		String username = principal.getName();
		String flag="false";
		double amount=0.0;
		double discount=0.0;
		UserCart usercart=new UserCart();
		if(usercartdao.getCountInCart(username)!=0) {
			flag="true";
			usercart=usercartdao.getCartbyusername(username);
			List<myproduct> products=usercart.getProducts();
			amount = usercartdao.getamount(username);
			Offer offer=offerdao.getOffer(usercart.getOfferId());
			discount=(amount*offer.getDiscount())/100;
			model.addObject("products",products);
			model.addObject("offer",offer);
		}
		model.addObject("flag",flag);
		model.addObject("amount", amount);
		model.addObject("discount",discount);
		return model;
	}
	
	@RequestMapping(value="/dashboard/my_cart/add_in_cart/{category}/{product_name}")
	public String addtocart(Principal principal, @PathVariable(value="product_name") String product_name,@PathVariable(value="category") String category) {
		
		String username = principal.getName();
		myproduct product = myproduct_dao.getAvailableProductByName(product_name,category);
		usercartdao.addToCart(username, product.getProduct_id());
		return "redirect:/dashboard/my_cart";
	}
	
	@RequestMapping(value="/dashboard/my_cart/remove/{productid}")
	public String removefromcart(Model model, Principal principal, @PathVariable(value="productid") int productid) {
		String username = principal.getName();
		System.out.println(username+' '+productid);
		usercartdao.removeFromCart(username, productid);
		return "redirect:/dashboard/my_cart";
	}
	
	@RequestMapping(value="/dashboard/my_cart/place_order")
	public String order_placed(Principal principal)
	{
		//ModelAndView mv=new ModelAndView();
		String username=principal.getName();
		orderdao.placeorder(username);
		return "redirect:/dashboard/order_history";
	}
	
	@RequestMapping(value="/add_in_reserve")
	public String addtoreserve(Principal principal)
	{
		String username=principal.getName();
		usercartdao.addToReserve(username);
		return "redirect:/dashboard/my_cart";
	}
	
}