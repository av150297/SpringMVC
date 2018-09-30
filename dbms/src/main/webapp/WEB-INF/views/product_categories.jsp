<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Categories</title>
</head>
<body>
	<h2>All Categories</h2>
	<c:forEach items="${category}" var="item">
		    <tr>      
		    	<td><a href="/dbms/dashboard/product_category/${item}">${item}</a></td><br>
		    </tr>
		    <br>
		</c:forEach> 
</body>
</html>