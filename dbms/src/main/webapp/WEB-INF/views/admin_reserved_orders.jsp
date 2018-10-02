<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>${username} Reserved Products</title>
</head>
<body>
	<h3>Reserved Orders</h3>
	 <br>
	 <c:if test="${products.size()>0}">
		<c:forEach items="${products}" var="item">
		    <tr>      
		    	<td>${item.product_id}</td>&emsp;<a href="/dbms/admin/reserved_users/${username}/remove/${item.product_id}"><button class="close">&times;</button></a>
		        <br><td>${item.product_name}</td>
		    </tr>
		    <br><br>
		</c:forEach>
		Current Coupon: ${offer.offer_id}<br>

		<br>
	<br>
	</c:if>
	<c:if test="${products.size()==0}">
	<h3>Oops, No item in a Reserve List</h3>
	</c:if>
	<c:if test="${products.size()!=0}">
	Amount = ${amount} <br>
	Discount = ${discount} <br>
	Total = ${amount-discount}<br>
	<a href="/dbms/admin/reserved_users/${username}/placed"><button type="button">Proceed To Confirm</button></a>
</c:if>
</body>
</html>