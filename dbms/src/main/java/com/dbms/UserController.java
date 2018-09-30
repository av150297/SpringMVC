package com.dbms;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dbms.dao.Cartdao;
import com.dbms.dao.Offerdao;
import com.dbms.dao.Orderdao;
import com.dbms.dao.Userdao;
import com.dbms.dao.myproductdao;
import com.dbms.model.Cart;
import com.dbms.model.Offer;
import com.dbms.model.Order;
import com.dbms.model.Product;
import com.dbms.model.User;
import com.dbms.model.myproduct;


@Controller
public class UserController {

	@Autowired
	Cartdao cartdao;
	@Autowired
	Userdao userdao;
	@Autowired
	Orderdao orderdao;
	@Autowired
	myproductdao productdao;
	@Autowired
	Offerdao offerdao;
	
	@RequestMapping("/dashboard")
	public ModelAndView user(Principal principal) {

		ModelAndView model = new ModelAndView("dashboard");
		String loggedInUserName = principal.getName();
		model.addObject("user", loggedInUserName);
		model.addObject("name", "Spring Security USER Custom Login");
		model.addObject("description", "Protected page for user !");
		return model;
	}
	
	@RequestMapping(value="/dashboard/profile")
	public ModelAndView viewprofile(Principal principal) {
		
		ModelAndView model = new ModelAndView("profiledetails");
		String username = principal.getName();
		User user = userdao.getCustomerbyusername(username);
		model.addObject("userinfo", user);
		return model;
	}
	
	@RequestMapping(value="/dashboard/product_category/{category}")
	public ModelAndView product_category(@PathVariable(value="category") String category)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("product_category");
		List <myproduct> products=productdao.showallproductsbycategory(category);
		mv.addObject("products",products);
		mv.addObject("category",category);
		return mv;
	}
	@RequestMapping(value="/dashboard/product_category")
	public ModelAndView categories()
	{
		List <myproduct> all_categories=productdao.getAllCategories();
		List <String> all = new ArrayList<>();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("product_categories");
		for(myproduct p:all_categories)
			all.add(p.getCategory());
		mv.addObject("category",all);
		return mv;
	}
	
	@RequestMapping(value="/dashboard/product_category/{category}/{productname}")
	public ModelAndView product_detail(@PathVariable(value="productname") String productname,@PathVariable(value="category") String category)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("product_detail");
		myproduct product=new myproduct();
		product=productdao.getproductbyname(productname);
		mv.addObject("product",product);
		return mv;
	}
	
	@RequestMapping(value="/dashboard/my_cart/place_order")
	public String order_placed(Principal principal)
	{
		//ModelAndView mv=new ModelAndView();
		String username=principal.getName();
		orderdao.placeorder(username);
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value="/dashboard/my_cart/apply_offer")
	public String apply_offer(Model model,HttpServletRequest request,HttpServletResponse response, Principal principal)
	{
		String offer_id=request.getParameter("coupon");
		System.out.println(offer_id);
		if(offerdao.checkOffer(offer_id)==true)
		{
			String username=principal.getName();
			offerdao.applyOffer(offer_id,username);
			model.addAttribute("message","Coupon code successfully applied");
		}
		else
		{
			model.addAttribute("message","Coupon code is invalid or expired...!");
		}
		return "redirect:/dashboard/my_cart";
	}
	
	
	
	
	@RequestMapping(value="/dashboard/order_history")
	public ModelAndView userOrderHistory(Principal principal) {
		
		ModelAndView mv = new ModelAndView();
		String username = principal.getName();
		mv.setViewName("order_history");
		List <Order> orders=orderdao.getOrdersbyusername(username);
		Map<Integer, Integer> orderCounts = new HashMap<>();
		Map<Integer, Offer> offers = new HashMap<>();
		for(Order order:orders)
		{
			orderCounts.put(order.getOrder_id(),orderdao.getProductCount(order.getOrder_id()));
			offers.put(order.getOrder_id(), offerdao.getOffer(order.getOffer_id()));
		}
		mv.addObject("orders", orders);
		mv.addObject("orderCounts",orderCounts);
		mv.addObject("offers",offers);
		return mv;
	}
	@RequestMapping(value="/dashboard/order_history/{order_id}")
	public ModelAndView userOrderDetail(Principal principal,@PathVariable(value="order_id") int order_id)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("order_history_detail");
		Order order=orderdao.getOrderByOrderId(order_id);
		List<myproduct> products=orderdao.getCartbyorderid(order_id);
		mv.addObject("order", order);
		mv.addObject("products",products);
		return mv;
	}
	
}