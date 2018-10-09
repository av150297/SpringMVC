<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<spring:url var="style" value="/style" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="${style}/css/cart.css" rel="stylesheet">
<jsp:include page="admin_base.jsp"></jsp:include>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>Reserved Products</title>
</head>
<body>
${order.order_id }<br>
	<c:forEach items="${products}" var="product">
		    <tr>      
		    	Product Id: <td>${product.product_id}</td><br>
		        Product: <td>${product.product_name}</td><br>
		        <c:if test="${flag==null}">
		        <form method="get" action="${pageContext.request.contextPath}/dashboard/feedback/${order.order_id}/${product.product_id}">
		        <input type="text" name="description" required="required">&emsp;
		        <input type="submit" value="Submit">
		        </form>
		        </c:if>
		        <br>
		        All Feedbacks related to ${product.product_id}<br>
		        <br>
		        <c:forEach items="${mp[product.product_id]}" var="fb">
		        <td>${fb.description}</td>
		        <a href="${pageContext.request.contextPath}/welcome/delete/${order.order_id}/${fb.feedbackId}"><button type="button">Delete</button></a><br><br>
		        </c:forEach>
		    </tr>
		    <br><br>
		</c:forEach>
</body>
</html>