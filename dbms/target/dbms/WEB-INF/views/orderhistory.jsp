<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order History</title>
</head>
<body>
	<h2>My Orders</h2>
	<c:forEach items="${orderlist}" var="order">
	<h3>${order.key.orderid}</h3>
	<h4>Amount : ${order.value}</h4>
		<c:forEach items="${order.key.cart.cartitems}" var="cartitem">
		    <tr>      
		    	<td>${cartitem.product.productname}</td>
		    </tr>
		    <br>
		</c:forEach>
	</c:forEach>
	<br>
	<h3>${message}</h3>
	<a href="/dbms/dashboard">Dashboard</a>
</body>
</html>