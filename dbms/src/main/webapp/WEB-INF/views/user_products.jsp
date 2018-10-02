<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>User Products</title>
</head>
<body>
	<h3>My Cart</h3>
	 <br>
		<% if (request.getAttribute("flag")=="true") { %>
		<c:forEach items="${products}" var="item">
		    <tr>      
		    	<td>${item.product_id}</td>&emsp;<a href="/dbms/dashboard/my_cart/remove/${item.product_id}"><button class="close">&times;</button></a>
		        <br><td>${item.product_name}</td>
		    </tr>
		    <br><br>
		</c:forEach>
		Current Coupon: ${offer.offer_id}<br>
		<form method="POST" action="/dbms/dashboard/my_cart/apply_offer">
		Enter Coupon code: <input type="text" name="coupon"><br>
		<input type="submit" value="Apply">
		</form>
		<% if (request.getParameter("message")!=null){%>
	 <b><%= request.getParameter("message") %></b>!
	 <%} %><br> 
		<%} else { %>
		<br>
	<br>
	<h3>Oops, No item in a cart</h3>
	<% } %>
	Amount = ${amount} <br>
	Discount = ${discount} <br>
	Total = ${amount-discount}<br>
	<% if (request.getAttribute("flag")=="true") { %>
	<%if (request.getParameter("Reserve_error")!=null) {%>
	<%= request.getParameter("Reserve_error")%><br>
	<%} %>
	<a href="/dbms/dashboard/my_cart/place_order"><button type="button">Place Order</button></a>&emsp;
	<a href="/dbms/dashboard/my_cart/add_in_reserve"><button type="button">Reserve Order</button></a><br>
	
	<% } %><a href="/dbms/dashboard">Dashboard</a><br>
</body>
</html>