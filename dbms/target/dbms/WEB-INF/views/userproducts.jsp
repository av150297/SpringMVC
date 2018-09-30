<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
</head>
<body>
	<h3>My Cart</h3>
		<c:forEach items="${mycart.cartitems}" var="cartitem">
		    <tr>      
		    	<td>${cartitem.product.productname}</td>
		        <td>${cartitem.product.productprice}</td>
		        <td>${cartitem.quantity}</td>
		        <td><a href="/dbms/remove/${cartitem.product.productid}">REMOVE</a></td>
		    </tr>
		    <br>
		</c:forEach>
		Amount = ${amount}<br>
	<br>
	<a href="/dbms/orderhistory">Place Order</a><br>
	<a href="/dbms/dashboard">Dashboard</a><br>
	<a href="/dbms/categories">All Products</a>
</body>
</html>