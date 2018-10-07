package com.dbms;

import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dbms.dao.Employeedao;
import com.dbms.dao.Feedbackdao;
import com.dbms.dao.Offerdao;
import com.dbms.dao.Orderdao;
import com.dbms.dao.SalaryTypedao;
import com.dbms.dao.UserCartdao;
import com.dbms.dao.Userdao;
import com.dbms.dao.WholeSaleSellerdao;
import com.dbms.dao.myproductdao;
import com.dbms.model.Employee;
import com.dbms.model.Feedback;
import com.dbms.model.Offer;
import com.dbms.model.Order;
import com.dbms.model.SalaryType;
import com.dbms.model.User;
import com.dbms.model.UserCart;
import com.dbms.model.WholeSaleSeller;
import com.dbms.model.myproduct;
import com.dbms.util.FileUtil;

import java.util.*;



@Controller
@RequestMapping("/admin")
public class AdminController {
	

	@Autowired
	Userdao userdao;
	@Autowired
	myproductdao product_dao;
	@Autowired
	WholeSaleSellerdao sellerdao;
	@Autowired
	Orderdao orderdao;
	@Autowired
	Employeedao employeedao;
	@Autowired
	Offerdao offerdao;
	@Autowired
	UserCartdao usercartdao;
	@Autowired
	Feedbackdao feedbackdao;
	@Autowired
	WholeSaleSellerdao wholesellerdao;
	@Autowired
	SalaryTypedao salarydao;
	
	List<String> AllCategories = Arrays.asList("Rings", "Earrings", "Necklace","Pendants","Nosepins","Bracelets","Mangalsutras","Bangles","Coins","Kadas","Chains");
	
	@RequestMapping("")
	public ModelAndView admin(Principal principal) {
		ModelAndView model = new ModelAndView();
		model.setViewName("admin");
		String loggedInUserName = principal.getName();
		model.addObject("user", loggedInUserName);
		model.addObject("name", "Spring Security Custom Login Demo");
		model.addObject("description", "Protected page !");
		return model;
	}
	
	
	@RequestMapping(value = "/add_product",method = RequestMethod.GET)
	public ModelAndView add_product(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("add_product");
		List <WholeSaleSeller> wholesellers=wholesellerdao.showallsellers();
		myproduct product= new myproduct();
		WholeSaleSeller seller=new WholeSaleSeller();
		String message=request.getParameter("seller_error");
		if(message!=null) {
			mv.addObject("seller_error",message);
			mv.addObject("flag","1");
		}
		message=request.getParameter("product_success");
		if(message!=null) {
			mv.addObject("flag","1");
			mv.addObject("success",message);
		}
		message=request.getParameter("product_error");
		if(message!=null) {
			mv.addObject("flag","1");
			mv.addObject("product_error",message);
		}
		message=request.getParameter("seller_success");
		if(message!=null) {
			mv.addObject("flag","1");
			mv.addObject("seller_success",message);
		}
		
		mv.addObject("seller",seller);
		mv.addObject("product",product);
		mv.addObject("wholesellers",wholesellers);
		mv.addObject("categories",AllCategories);
		return mv;
	}
	
	@RequestMapping(value="/add_product",method = RequestMethod.POST)
	public String add_productProcess(HttpServletRequest request,Model model,@Valid @ModelAttribute("myproduct") myproduct product,BindingResult result,@RequestParam CommonsMultipartFile file) throws IOException, ClassNotFoundException, SQLException
 	{
		//ModelAndView mv=new ModelAndView("home");
		if(result.hasErrors())
		{
			return "redirect:/admin/add_product";
		}
		if(product_dao.checkproductnameexists(product))
		{
			model.addAttribute("product_error", "Product Id already exists");
			return "redirect:/admin/add_product";
		}
		product_dao.addnewproduct(product);
		byte[] barr=file.getBytes();
		InputStream is=file.getInputStream();
		product_dao.setProductImage(product.getProduct_name(), is, barr);
		model.addAttribute("product_success","Product Successfully Added");
		return "redirect:/admin/add_product";
	}
	
	@RequestMapping(value="/add_seller",method=RequestMethod.GET)
	public String addSeller(Model model,HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView("add_seller");
		WholeSaleSeller seller= new WholeSaleSeller();
		mv.addObject("seller",seller);
		String message=request.getParameter("seller_error");
		if(message!=null)
		{
			model.addAttribute("seller_error",message);
		}
		return "redirect:/admin/add_product";
	}
	
	@RequestMapping(value="/add_seller",method=RequestMethod.POST)
	public String addSellerProcess(Model model,@Valid @ModelAttribute("seller") WholeSaleSeller seller,BindingResult result)
	{
		if(result.hasErrors())
		{
			return "redirect:/admin/add_seller";
		}
		if(sellerdao.checksellerexists(seller))
		{
			model.addAttribute("seller_error", "Seller Id already exists");
			return "redirect:/admin/add_seller";
		}
		sellerdao.addnewseller(seller);
		model.addAttribute("seller_success","Seller Added Successfully");
		return "redirect:/admin/add_product";
	}
	
	@RequestMapping(value="/add_employee",method=RequestMethod.GET)
	public ModelAndView addEmployee(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("add_employee");
		Employee employee= new Employee();
		List <SalaryType> types=salarydao.getAllTypes();
		mv.addObject("employee",employee);
		mv.addObject("types",types);
		return mv;
	}
	
	@RequestMapping(value="/add_employee",method=RequestMethod.POST)
	public String addEmployeeProcess(Model model,@Valid @ModelAttribute("emp") Employee employee,BindingResult result)
	{
		if(result.hasErrors())
		{
			return "redirect:/admin/add_employee";
		}
		if(employeedao.checkEmployee(employee))
		{
			model.addAttribute("error", "Employee already exists");
			return "redirect:/admin/add_employee";
		}
		employeedao.addNewEmployee(employee);
		return "redirect:/admin/employees";
	}
	
	@RequestMapping(value="/employees")
	public ModelAndView allEmployees()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("all_employee");
		Employee employee=new Employee();
		List<Employee> employees=employeedao.getAllEmployee();
		mv.addObject("employees",employees);
		mv.addObject("emp",employee);
		return mv;
	}
	
	@RequestMapping("/employees/{emp_id}")
	public ModelAndView EmployeeOrders(@PathVariable(value="emp_id") String emp_id)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("employee_orders");
		List <Order> orders=orderdao.getOrdersByEmployeeId(emp_id);
		Map<Integer, Integer> orderCounts = new HashMap<>();
		Map<Integer, Offer> offers = new HashMap<>();
		for(Order order:orders)
		{
			orderCounts.put(order.getOrder_id(),orderdao.getProductCount(order.getOrder_id()));
			offers.put(order.getOrder_id(), offerdao.getOffer(order.getOffer_id()));
		}
		mv.addObject("emp_id",emp_id);
		mv.addObject("orders", orders);
		mv.addObject("orderCounts",orderCounts);
		mv.addObject("offers",offers);
		return mv;
	}
	@RequestMapping("/employees/toggle/{emp_id}")
	public String toggleEmployee(@PathVariable(value="emp_id") String emp_id)
	{
		employeedao.toggle(emp_id);
		return "redirect:/admin/employees";
	}
	
	
	@RequestMapping(value="/add_offer",method=RequestMethod.GET)
	public ModelAndView addOffer(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView("add_offer");
		Offer offer= new Offer();
		mv.addObject("offer",offer);
		return mv;
	}
	
	@RequestMapping(value="/add_offer",method=RequestMethod.POST)
	public String addOfferProcess(Model model,@Valid @ModelAttribute("offered") Offer offer,BindingResult result)
	{
		if(result.hasErrors())
		{
			return "redirect:/admin/add_offer";
		}
		if(offerdao.checkOffer(offer.getOffer_id()))
		{
			model.addAttribute("error", "Offer already exists");
			return "redirect:/admin/add_offer";
		}
		offerdao.addNewOffer(offer);
		return "redirect:/admin/offers";
	}
	
	@RequestMapping("/offers")
	public ModelAndView allOffers()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("all_offers");
		List<Offer> offers=offerdao.getAllOffers();
		Offer offer=new Offer();
		mv.addObject("offers",offers);
		mv.addObject("offered",offer);
		return mv;
	}
	
	@RequestMapping("/offers/{offer_id}")
	public String toggleOffers(@PathVariable(value="offer_id") String offer_id)
	{
		offerdao.toggle(offer_id);
		return "redirect:/admin/offers";
	}
	
	
	
	
	@RequestMapping(value="/all_orders")
	public ModelAndView all_orders()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("all_orders");
		List<Order> orders=orderdao.getAllOrders();
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
	
	@RequestMapping(value="/all_orders/{order_id}")
	public ModelAndView AdminOrderDetail(Principal principal,@PathVariable(value="order_id") int order_id) throws SQLException
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("order_history_detail");
		Map<String, String> imgmap = new HashMap<>();
		Order order=orderdao.getOrderByOrderId(order_id);
		List<myproduct> products=orderdao.getCartbyorderid(order_id);
		Map <Integer,List<Feedback> > mp=new HashMap<>();
		for(myproduct product:products)
		{
			byte[] barr=product.getImage().getBytes(1,(int) product.getImage().length());
			String image=Base64.getEncoder().encodeToString(barr);
			imgmap.put(product.getProduct_name(),image);
			mp.put(product.getProduct_id(),feedbackdao.getFeedbackbyProductId(product.getProduct_id()));
		}
		mv.addObject("order", order);
		mv.addObject("products",products);
		mv.addObject("mp",mp);
		mv.addObject("flag","true");
		mv.addObject("imgmap",imgmap);
		return mv;
	}
	
	@RequestMapping("/manageusers")
	public ModelAndView manageusers(Principal principal) {

		ModelAndView model = new ModelAndView("manageusers");
		List<User> allusers = userdao.showallusers();
	    model.addObject("allusers", allusers);
	    return model;
	}
	
	@RequestMapping("user_orders/{username}")
	public ModelAndView user_orders(@PathVariable(value="username") String username)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user_orders");
		List <Order> orders=orderdao.getOrdersbyusername(username);
		Map<Integer, Integer> orderCounts = new HashMap<>();
		Map<Integer, Offer> offers = new HashMap<>();
		for(Order order:orders)
		{
			orderCounts.put(order.getOrder_id(),orderdao.getProductCount(order.getOrder_id()));
			offers.put(order.getOrder_id(), offerdao.getOffer(order.getOffer_id()));
		}
		mv.addObject("username",username);
		mv.addObject("orders", orders);
		mv.addObject("orderCounts",orderCounts);
		mv.addObject("offers",offers);
		return mv;
	}
	
	@RequestMapping("user_orders/{username}/{order_id}")
	public ModelAndView user_orders_details(@PathVariable(value="username") String username,@PathVariable(value="order_id") int order_id) throws SQLException
	{
		Map<String, String> imgmap = new HashMap<>();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("user_order_detail");
		Order order=orderdao.getOrderByOrderId(order_id);
		List<myproduct> products=orderdao.getCartbyorderid(order_id);
		Map <Integer,List<Feedback> > mp=new HashMap<>();
		for(myproduct product:products)
		{
			byte[] barr=product.getImage().getBytes(1,(int) product.getImage().length());
			String image=Base64.getEncoder().encodeToString(barr);
			imgmap.put(product.getProduct_name(),image);
			mp.put(product.getProduct_id(),feedbackdao.getFeedbackbyProductId(product.getProduct_id()));
		}
		Offer offer=offerdao.getOffer(order.getOffer_id());
		double discount=offer.getDiscount()*order.getSubtotal()/100;
		mv.addObject("order", order);
		mv.addObject("discount",discount);
		mv.addObject("products",products);
		mv.addObject("mp",mp);
		mv.addObject("imgmap",imgmap);
		return mv;
	}
	
	@RequestMapping("/manageusers/{username}")
	public String manageusers(@PathVariable(value="username") String username) {

		userdao.toggle(username);
	    return "redirect:/admin/manageusers";
	}
	
	
	
	
	@RequestMapping("/reserved_users")
	public ModelAndView reserved_users()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("reserved_users");
		List<User> allReservedUsers = userdao.getAllReservedUsers();
	    mv.addObject("allusers", allReservedUsers);
	    return mv;
	}
	
	@RequestMapping("/reserved_users/{username}")
	public ModelAndView reservedProducts(@PathVariable(value = "username") String username) throws SQLException
	{
		Map<String, String> imgmap = new HashMap<>();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin_reserved_orders");
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
		mv.addObject("username",username);
		mv.addObject("products",products);
		mv.addObject("offer",offer);
		mv.addObject("flag",flag);
		mv.addObject("amount", amount);
		mv.addObject("discount",discount);
		mv.addObject("imgmap",imgmap);
		return mv;
	}
	
	@RequestMapping(value="/feedback/{username}/{order_id}/{id}")
	public String deleteFeedback(Principal principal,@PathVariable(value="username") String username,@PathVariable(value="id") int feedbackid,@PathVariable(value="order_id") int order_id)
	{
		feedbackdao.deleteFeedback(feedbackid);
		return "redirect:/admin/user_orders/"+username+"/"+Integer.toString(order_id);
	}
	
	@RequestMapping("/reserved_users/{username}/remove/{product_id}")
	public String removeFromReserve(@PathVariable(value = "username") String username,@PathVariable(value = "product_id") int product_id)
	{
		usercartdao.removeFromCart(username, product_id);
		return "redirect:/admin/reserved_users/"+username;
	}
	
	@RequestMapping("/reserved_users/{username}/placed")
	public String reservedToOrder(@PathVariable(value = "username") String username)
	{
		orderdao.placeReserveOrder(username);
		return "redirect:/admin/all_orders";
	}
}