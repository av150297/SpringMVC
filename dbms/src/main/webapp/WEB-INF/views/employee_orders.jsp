<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${emp_id}</title>
</head>
<body>
	<c:if test="${message!=null}">
	${message}
	</c:if><br>
	<c:forEach items="${orders}" var="order">
		    <tr>      
		    	Order Id: <td>${order.order_id}</td><br>
		    	Customer Id: <td> ${order.username} </td><br>
		        Address: <td>${order.address}</td><br>
		        Coupon Code Applied: <td>${order.offer_id}</td><br>
		        Subtotal: <td>${order.subtotal} </td><br>
		    </tr>
		    <br><br>
		</c:forEach>
</body>
</html>