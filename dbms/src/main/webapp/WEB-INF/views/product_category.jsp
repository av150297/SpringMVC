<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${category}</title>
</head>
<body>
	<h3>Ring: </h3>
	<c:forEach items="${products}" var="item">
		    <tr>      
		    	<td>${item.product_type}</td><br>
		        <td>${item.product_name}</td><br>
		        <td><a href="/dbms/dashboard/product_category/${category}/${item.product_name}">Details</a></td><br>
		    </tr>
		    <br>
		</c:forEach>
</body>
</html>