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
	 <% if (request.getParameter("message")!=null){%>
	 <b><%= request.getParameter("message") %></b>!
	 <%} %>
		<% if (request.getAttribute("flag")=="true") { %>
		<c:forEach items="${products}" var="item">
		    <tr>      
		    	<td>${item.product_id}</td><br>
		        <td>${item.product_name}</td>
		    </tr>
		    <br>
		</c:forEach> 
		<%} else { %>
		<br>
	<br>
	<h3>Oops, No item in a cart</h3>
	<% } %>
	Amount = ${amount} <br>
	Discount = ${discount} <br>
	Total = ${amount-discount}<br>
	
	<a href="/dbms/dashboard">Dashboard</a><br>
</body>
</html>