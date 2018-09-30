<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order History</title>
</head>
<body>
${order.order_id }<br>
	<c:forEach items="${products}" var="product">
		    <tr>      
		    	Product Id: <td>${product.product_id}</td><br>
		        Product: <td>${product.product_name}</td><br>
		    </tr>
		    <br><br>
		</c:forEach>
</body>
</html>