package com.dbms;

import java.security.Principal;
import java.sql.SQLException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dbms.dao.Offerdao;
import com.dbms.dao.Orderdao;
import com.dbms.dao.UserCartdao;
import com.dbms.dao.myproductdao;
import com.dbms.model.Offer;
import com.dbms.model.myproduct;
import com.dbms.model.UserCart;

@Controller
public class UserCartController {

	
	@Autowired
	UserCartdao usercartdao;
	@Autowired
	myproductdao myproduct_dao;
	@Autowired
	Offerdao offerdao;
	@Autowired
	Orderdao orderdao;
	
	
	@RequestMapping(value="/dashboard/my_cart")
	public ModelAndView showcart(HttpServletRequest request,Principal principal) throws SQLException {
		Map<String, String> imgmap = new HashMap<>();
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
			for(myproduct product:products)
			{
				byte[] barr=product.getImage().getBytes(1,(int) product.getImage().length());
				String image=Base64.getEncoder().encodeToString(barr);
				imgmap.put(product.getProduct_name(),image);
			}
			amount = usercartdao.getamount(username);
			Offer offer=offerdao.getOffer(usercart.getOfferId());
			discount=(amount*offer.getDiscount())/100;
			model.addObject("products",products);
			model.addObject("offer",offer);
			model.addObject("imgmap",imgmap);
		}
		if(request.getParameter("success")!=null)
		{
			model.addObject("success",request.getParameter("success").toString());
		}
		if(request.getParameter("failure")!=null)
		{
			model.addObject("failure",request.getParameter("failure").toString());
		}
		if(request.getParameter("reserve_error")!=null)
		{
			model.addObject("reserve_error",request.getParameter("reserve_error").toString());
		}
		model.addObject("amount", amount);
		model.addObject("discount",discount);
		return model;
	}
	
	@RequestMapping(value="/dashboard/my_cart/add_in_cart/{category}/{product_name}")
	public String addtocart(Model model,Principal principal, @PathVariable(value="product_name") String product_name,@PathVariable(value="category") String category) {
		
		String username = principal.getName();
		myproduct product = myproduct_dao.getAvailableProductByName(product_name,category);
		if(product==null)
		{
			model.addAttribute("failure","Sorry, Product is out of stock. Contact the store owner");
			return "redirect:/dashboard/product_category/"+category+"/"+product_name;
		}
		usercartdao.addToCart(username, product.getProduct_id());
		model.addAttribute("success","Product Successfully Added");
		return "redirect:/dashboard/product_category/"+category+"/"+product_name;
	}
	
	@RequestMapping(value="/dashboard/my_cart/remove/{productid}")
	public String removefromcart(Model model, Principal principal, @PathVariable(value="productid") int productid) {
		String username = principal.getName();
		usercartdao.removeFromCart(username, productid);
		return "redirect:/dashboard/my_cart";
	}
	
	@RequestMapping(value="/dashboard/my_cart/place_order")
	public String order_placed(Principal principal)
	{
		String username=principal.getName();
		orderdao.placeorder(username);
		return "redirect:/dashboard/order_history";
	}
	
	@RequestMapping(value="/dashboard/my_cart/add_in_reserve")
	public String addtoreserve(Model model,Principal principal)
	{
		String username=principal.getName();
		if(usercartdao.checkReserveOrder(username)==true)
		{
			model.addAttribute("reserve_error","You can not add more than 1 cart in a reserve at a time");
			return "redirect:/dashboard/my_cart";
		}
		else
		{
			usercartdao.addToReserve(username);
			return  "redirect:/dashboard/my_cart/reserved_products";
		}	
	}
	
	@RequestMapping(value="/dashboard/my_cart/reserved_products")
	public ModelAndView displayreservedProducts(Principal principal) throws SQLException
	{
		Map<String, String> imgmap = new HashMap<>();
		ModelAndView model = new ModelAndView();
		model.setViewName("reserved_orders");
		String username = principal.getName();
		String flag="false";
		double amount=0.0;
		double discount=0.0;
		UserCart usercart=new UserCart();
		usercart=usercartdao.getReservedCartbyusername(username);
		List<myproduct> products=usercart.getProducts();
		for(myproduct product:products)
		{
			byte[] barr=product.getImage().getBytes(1,(int) product.getImage().length());
			String image=Base64.getEncoder().encodeToString(barr);
			imgmap.put(product.getProduct_name(),image);
		}
		amount = usercartdao.getReservedAmount(username);
		Offer offer=offerdao.getOffer(usercart.getOfferId());
		discount=(amount*offer.getDiscount())/100;
		model.addObject("products",products);
		model.addObject("offer",offer);
		model.addObject("flag",flag);
		model.addObject("amount", amount);
		model.addObject("discount",discount);
		model.addObject("imgmap",imgmap);
		return model;
	}

}