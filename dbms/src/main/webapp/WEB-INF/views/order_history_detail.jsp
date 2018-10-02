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
		        <c:if test="${flag==null}">
		        <form method="get" action="/dbms/dashboard/feedback/${product.product_id}">
		        <input type="text" name="description" required="required">&emsp;
		        <input type="submit" value="Submit">
		        </form>
		        </c:if>
		        <br>
		        All Feedbacks related to ${product.product_id}<br>
		        <br>
		        <c:forEach items="${mp}" var="feedback">
		        <c:forEach items="${feedback.value}" var="fb">
		        <td>${fb.description}</td><br><br>
		        </c:forEach>
		        </c:forEach>
		    </tr>
		    <br><br>
		</c:forEach>
</body>
</html>