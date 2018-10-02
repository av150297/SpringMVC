package com.dbms;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.dbms.dao.Employeedao;
import com.dbms.dao.Feedbackdao;
import com.dbms.dao.Offerdao;
import com.dbms.dao.Orderdao;
import com.dbms.dao.UserCartdao;
import com.dbms.dao.Userdao;
import com.dbms.dao.WholeSaleSellerdao;
import com.dbms.dao.myproductdao;
import com.dbms.model.Employee;
import com.dbms.model.Feedback;
import com.dbms.model.Offer;
import com.dbms.model.Order;
import com.dbms.model.User;
import com.dbms.model.UserCart;
import com.dbms.model.WholeSaleSeller;
import com.dbms.model.myproduct;

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
	
	
	@RequestMapping("")
	public ModelAndView admin(Principal principal) {

		ModelAndView model = new ModelAndView("admin");
		String loggedInUserName = principal.getName();
		model.addObject("user", loggedInUserName);
		model.addObject("name", "Spring Security Custom Login Demo");
		model.addObject("description", "Protected page !");
		return model;
	}
	
	
	@RequestMapping(value = "/add_product",method = RequestMethod.GET)
	public ModelAndView add_product(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView("add_product");
		myproduct product= new myproduct();
		mv.addObject("product",product);
		return mv;
	}
	
	@RequestMapping(value="/add_product",method = RequestMethod.POST)
	public String add_productProcess(Model model,@Valid @ModelAttribute("myproduct") myproduct product,BindingResult result)
	{
		//ModelAndView mv=new ModelAndView("home");
		if(result.hasErrors())
		{
			return "redirect:/admin/add_product";
		}
		if(product_dao.checkproductnameexists(product))
		{
			model.addAttribute("error", "Product already exists");
			return "redirect:/admin/add_product";
		}
		product_dao.addnewproduct(product);
		return "redirect:/admin";
	}
	
	@RequestMapping(value="/add_seller",method=RequestMethod.GET)
	public ModelAndView addSeller(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView("add_seller");
		WholeSaleSeller seller= new WholeSaleSeller();
		mv.addObject("seller",seller);
		return mv;
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
			model.addAttribute("error", "Seller already exists");
			return "redirect:/admin/add_seller";
		}
		sellerdao.addnewseller(seller);
		return "redirect:/admin";
	}
	
	@RequestMapping(value="/add_employee",method=RequestMethod.GET)
	public ModelAndView addEmployee(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView("add_employee");
		Employee employee= new Employee();
		mv.addObject("employee",employee);
		return mv;
	}
	
	@RequestMapping(value="/add_employee",method=RequestMethod.POST)
	public String addEmployeeProcess(Model model,@Valid @ModelAttribute("employee") Employee employee,BindingResult result)
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
		return "redirect:/admin";
	}
	
	@RequestMapping(value="/employees")
	public ModelAndView allEmployees()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("all_employee");
		List<Employee> employees=employeedao.getAllEmployee();
		mv.addObject("employees",employees);
		return mv;
	}
	
	@RequestMapping("/employees/{emp_id}")
	public ModelAndView EmployeeOrders(@PathVariable(value="emp_id") String emp_id)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("employee_orders");
		List <Order> orders=orderdao.getOrdersByEmployeeId(emp_id);
		mv.addObject("orders",orders);
		mv.addObject("emp_id",emp_id);
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
	public String addOfferProcess(Model model,@Valid @ModelAttribute("offer") Offer offer,BindingResult result)
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
		return "redirect:/admin";
	}
	
	@RequestMapping("/offers")
	public ModelAndView allOffers()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("all_offers");
		List<Offer> offers=offerdao.getAllOffers();
		mv.addObject("offers",offers);
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
		mv.addObject("orders",orders);
		return mv;
	}
	
	@RequestMapping(value="/all_orders/{order_id}")
	public ModelAndView AdminOrderDetail(Principal principal,@PathVariable(value="order_id") int order_id)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("order_history_detail");
		Order order=orderdao.getOrderByOrderId(order_id);
		List<myproduct> products=orderdao.getCartbyorderid(order_id);
		Map <Integer,List<Feedback> > mp=new HashMap<>();
		for(myproduct product:products)
		{
			mp.put(product.getProduct_id(),feedbackdao.getFeedbackbyProductId(product.getProduct_id()));
		}
		mv.addObject("order", order);
		mv.addObject("products",products);
		mv.addObject("mp",mp);
		mv.addObject("flag","true");
		return mv;
	}
	
	@RequestMapping("/manageusers")
	public ModelAndView manageusers(Principal principal) {

		ModelAndView model = new ModelAndView("manageusers");
		List<User> allusers = userdao.showallusers();
	    model.addObject("allusers", allusers);
	    return model;
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
	    mv.addObject("users", allReservedUsers);
	    return mv;
	}
	
	@RequestMapping("/reserved_users/{username}")
	public ModelAndView reservedProducts(@PathVariable(value = "username") String username)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin_reserved_orders");
		String flag="false";
		double amount=0.0;
		double discount=0.0;
		UserCart usercart=new UserCart();
		usercart=usercartdao.getReservedCartbyusername(username);
		List<myproduct> products=usercart.getProducts();
		amount = usercartdao.getReservedAmount(username);
		Offer offer=offerdao.getOffer(usercart.getOfferId());
		discount=(amount*offer.getDiscount())/100;
		mv.addObject("username",username);
		mv.addObject("products",products);
		mv.addObject("offer",offer);
		mv.addObject("flag",flag);
		mv.addObject("amount", amount);
		mv.addObject("discount",discount);
		return mv;
	}
	
	@RequestMapping("/reserved_users/{username}/placed")
	public String reservedToOrder(@PathVariable(value = "username") String username)
	{
		orderdao.placeReserveOrder(username);
		return "redirect:/admin";
	}
}