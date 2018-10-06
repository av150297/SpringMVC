<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:url var="style" value="/style" />
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<jsp:include page="user_base.jsp"></jsp:include>

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