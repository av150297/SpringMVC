<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
</head>
<body>
	<h3>${category.categoryname}</h3>
		<c:forEach items="${productQuantity}" var="entry">
		    <tr>      
		        <td>${entry.key.productname}</td>
		        <td>${entry.key.productprice}</td>
		        <td>${entry.key.description}</td>
		        <td>${entry.value}</td>
		        <td><a href="/dbms/add/${entry.key.productid}">ADD </a></td><br>
		    </tr>
		</c:forEach>
	<br>
	<a href="/dbms/myproducts">My Cart</a><br>
	<a href="/dbms/categories">Back</a>
</body>
</html>