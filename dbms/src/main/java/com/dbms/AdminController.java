package com.dbms;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

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

import com.dbms.dao.Categorydao;
import com.dbms.dao.Employeedao;
import com.dbms.dao.Orderdao;
import com.dbms.dao.Userdao;
import com.dbms.dao.WholeSaleSellerdao;
import com.dbms.dao.myproductdao;
import com.dbms.dao.Productdao;
import com.dbms.model.Category;
import com.dbms.model.Employee;
import com.dbms.model.Order;
import com.dbms.model.Product;
import com.dbms.model.User;
import com.dbms.model.WholeSaleSeller;
import com.dbms.model.myproduct;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	Categorydao categorydao;
	@Autowired
	Productdao productdao;
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
	
	
	@RequestMapping("")
	public ModelAndView admin(Principal principal) {

		ModelAndView model = new ModelAndView("admin");
		String loggedInUserName = principal.getName();
		model.addObject("user", loggedInUserName);
		model.addObject("name", "Spring Security Custom Login Demo");
		model.addObject("description", "Protected page !");
		return model;
	}
	
	@RequestMapping(value = "/addproduct")
	  public ModelAndView allcategories(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("addcategoryproduct");
	    
	    List<Category> allcategories = categorydao.showallcategories();
	    mav.addObject("allcategories", allcategories);
	
	    return mav;
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
			return "redirect:/admin/add_seller";
		}
		employeedao.addNewEmployee(employee);
		return "redirect:/admin";
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
		mv.addObject("order", order);
		mv.addObject("products",products);
		return mv;
	}
	
	
	@RequestMapping(value = "/allcategories")
	public ModelAndView adminallcategories(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("adminallcategories");
	    
	    List<Category> allcategories = categorydao.showallcategories();
	    mav.addObject("allcategories", allcategories);
	
	    return mav;
	  }
	
	@RequestMapping(value = "/allcategories/{categoryid}")
	  public ModelAndView categoryproducts(HttpServletRequest request, HttpServletResponse response, @PathVariable(value = "categoryid") int categoryid, Principal principal) {
	    ModelAndView mav = new ModelAndView("admincategoryproducts");
	    
	    List<Product> categoryproducts = productdao.showallproductsbycategory(categoryid);
	    mav.addObject("category",categorydao.getcategorybyid(categoryid));
	    mav.addObject("admincategoryproducts",categoryproducts); 
	    return mav;
	  }
	
	@RequestMapping(value = "/addnewcategory", method = RequestMethod.GET)
	public ModelAndView addnewcategory(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("addnewcategory");
	    Category category = new Category();
		mav.addObject("category",category);
	    return mav;
	  }
	@RequestMapping(value="/addnewcategory",method=RequestMethod.POST)
	public String addnewcategoryProcess(Model model, @Valid @ModelAttribute("category") Category category, BindingResult result) {
			
		if(result.hasErrors()) {
			return "redirect:/admin/addnewcategory";
		}
		if(categorydao.checkcategoryexists(category)) {
			model.addAttribute("error", "Category already exists");
			return "redirect:/admin/addnewcategory";
		}
		categorydao.addcategory(category);
		model.addAttribute("success", "category added successfully");
		return "redirect:/admin/allcategories";
		
	}

	@RequestMapping("/manageusers")
	public ModelAndView manageusers(Principal principal) {

		ModelAndView model = new ModelAndView("manageusers");
		List<User> allusers = userdao.showallusers();
	    model.addObject("allusers", allusers);
	    
	    return model;
	}
	
	@RequestMapping("/reserved_users/{username}/placed")
	public String reservedToOrder(@PathVariable(value = "username") String username)
	{
		orderdao.placeReserveOrder(username);
		return "redirect:/admin";
	}
}