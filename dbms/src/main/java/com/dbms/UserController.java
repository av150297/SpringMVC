package com.dbms;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
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

import com.dbms.dao.Feedbackdao;
import com.dbms.dao.Offerdao;
import com.dbms.dao.Orderdao;
import com.dbms.dao.Userdao;
import com.dbms.dao.myproductdao;
import com.dbms.model.Feedback;
import com.dbms.model.Offer;
import com.dbms.model.Order;
import com.dbms.model.User;
import com.dbms.model.myproduct;


@Controller
public class UserController {

	@Autowired
	Userdao userdao;
	@Autowired
	Orderdao orderdao;
	@Autowired
	myproductdao productdao;
	@Autowired
	Offerdao offerdao;
	@Autowired
	Feedbackdao feedbackdao;
	
	@RequestMapping("/dashboard")
	public ModelAndView user(Principal principal) throws SQLException {
		ModelAndView model = new ModelAndView();
		model.setViewName("dashboard");
		String loggedInUserName = principal.getName();
		List <myproduct> products=productdao.showallproducts();
		Map<String, String> imgmap = new HashMap<>();
		for(myproduct product:products)
		{
			byte[] barr=product.getImage().getBytes(1,(int) product.getImage().length());
			String image=Base64.getEncoder().encodeToString(barr);
			imgmap.put(product.getProduct_name(),image);
			System.out.println(product.getProduct_id());
		}
		System.out.println("I m here");
		model.addObject("products",products);
		model.addObject("imgmap",imgmap);
		return model;
	}
	
	@RequestMapping(value="/dashboard/profile")
	public ModelAndView viewprofile(HttpServletRequest request,Principal principal) {
		
		ModelAndView model = new ModelAndView("profiledetails");
		String username = principal.getName();
		User user = userdao.getCustomerbyusername(username);
		if(request.getParameter("message")!=null)
		{
			model.addObject("success","Profile Updated Successfully");
		}
		model.addObject("userinfo", user);		
		return model;
	}
	
	@RequestMapping(value="/dashboard/edit_profile")
	public String viewprofile(HttpServletRequest request,Model model,Principal principal) {
		String username = principal.getName();
		String name=request.getParameter("name");
		String house=request.getParameter("house");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String email=request.getParameter("mail");
		int pin=Integer.parseInt(request.getParameter("pin"));
		userdao.UpdateCustomer(username,name,house,state,city,email,pin);
		model.addAttribute("message","Profile Edit Successfully");
		return "redirect:/dashboard/profile";
	}
	
	
	
	@RequestMapping(value="/dashboard/product_category/{category}")
	public ModelAndView product_category(@PathVariable(value="category") String category) throws SQLException
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("product_category");
		List <myproduct> products=productdao.showallproductsbycategory(category);
		Map<String, String> imgmap = new HashMap<>();
		for(myproduct product:products)
		{
			byte[] barr=product.getImage().getBytes(1,(int) product.getImage().length());
			String image=Base64.getEncoder().encodeToString(barr);
			imgmap.put(product.getProduct_name(),image);
		}
		mv.addObject("products",products);
		mv.addObject("category",category);
		mv.addObject("imgmap",imgmap);
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
	public ModelAndView product_detail(HttpServletRequest request,@PathVariable(value="productname") String productname,@PathVariable(value="category") String category) throws SQLException
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("product_detail");
		myproduct product=new myproduct();
		product=productdao.getproductbyname(productname);
		mv.addObject("product",product);
		byte[] barr=product.getImage().getBytes(1,(int) product.getImage().length());
		String image=Base64.getEncoder().encodeToString(barr);
		mv.addObject("image",image);
		if(request.getParameter("success")!=null)
		{
			mv.addObject("success",request.getParameter("success").toString());
		}
		if(request.getParameter("failure")!=null)
		{
			mv.addObject("failure",request.getParameter("failure").toString());
		}
		return mv;
	}
	
	
	@RequestMapping(value="/dashboard/my_cart/apply_offer")
	public String apply_offer(Model model,HttpServletRequest request,HttpServletResponse response, Principal principal)
	{
		String offer_id=request.getParameter("coupon");
		if(offerdao.checkOffer(offer_id)==true)
		{
			String username=principal.getName();
			offerdao.applyOffer(offer_id,username);
			model.addAttribute("success","Coupon code successfully applied");
		}
		else
		{
			model.addAttribute("failure","Coupon code is invalid or expired...!");
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
	public ModelAndView userOrderDetail(HttpServletRequest request,Principal principal,@PathVariable(value="order_id") int order_id) throws SQLException
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("user_order_history_detail");
		Order order=orderdao.getOrderByOrderId(order_id);
		List<myproduct> products=orderdao.getCartbyorderid(order_id);
		Map <Integer,List<Feedback> > mp=new HashMap<>();
		Map<String, String> imgmap = new HashMap<>();
		for(myproduct product:products)
		{
			byte[] barr=product.getImage().getBytes(1,(int) product.getImage().length());
			String image=Base64.getEncoder().encodeToString(barr);
			imgmap.put(product.getProduct_name(),image);
			mp.put(product.getProduct_id(),feedbackdao.getFeedbackbyProductId(product.getProduct_id()));
		}
		Offer offer=offerdao.getOffer(order.getOffer_id());
		double discount=offer.getDiscount()*order.getSubtotal()/100;
		if(request.getParameter("added")!=null)
		{
			mv.addObject("success",request.getParameter("added").toString());
		}
		mv.addObject("order", order);
		mv.addObject("discount",discount);
		mv.addObject("products",products);
		mv.addObject("mp",mp);
		mv.addObject("imgmap",imgmap);
		return mv;
	}
	
	@RequestMapping(value="/dashboard/feedback/{order_id}/{product_id}")
	public String addFeedback(Model model,HttpServletRequest request, Principal principal, @PathVariable(value="product_id") int product_id,@PathVariable(value="order_id")int order_id)
	{
		String description=request.getParameter("description");
		String username=principal.getName();
		Feedback feedback=new Feedback();
		feedback.setUsername(username);
		feedback.setDescription(description);
		feedback.setProductId(product_id);
		feedbackdao.addFeedack(feedback);
		model.addAttribute("added","Feedback Added Successfully");
		return "redirect:/dashboard/order_history/"+Integer.toString(order_id);
	}
	
	@RequestMapping(value="/dashboard/feedback/delete/{username}/{order_id}/{id}")
	public String deleteFeedback(Principal principal,@PathVariable(value="id") int feedbackid,@PathVariable(value="order_id") int order_id,@PathVariable(value="username") String username)
	{
		if(principal.getName().equals(username))
			feedbackdao.deleteFeedback(feedbackid);
		return "redirect:/dashboard/order_history/"+Integer.toString(order_id);
	}
	
	@RequestMapping("/dashboard/about_us")
	public ModelAndView aboutUs()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("about_us");
		return mv;
	}
}