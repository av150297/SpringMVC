<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.product_name}</title>
</head>
<body>
<h2>Product Detail</h2>
	Product name: ${product.product_name} <br>
	Product type: ${product.product_type} <br>
	Product description: ${product.description}<br>
	Product Price: ${product.making_charges+product.cost_price}<br>
	Product Category: ${product.category}<br>
	<%if (request.getParameter("message")!=null) {%>
	<%= request.getParameter("message")%><br>
	<%} %>
	<button type="button"><a href="/dbms/dashboard/my_cart/add_in_cart/${product.category}/${product.product_name}">Add to Cart</a></button>
	
	
	<br>
	<a href="/dbms/dashboard">Dashboard</a>
</body>
</html>