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
<h2>Produuct Detail</h2>
	Product name: ${product.product_name} <br>
	Product type: ${product.product_type} <br>
	Product description: ${product.description}<br>
	Product Price: ${product.making_charges+product.cost_price}
	
	
	<br>
	<a href="/dbms/dashboard">Dashboard</a>
</body>
</html>