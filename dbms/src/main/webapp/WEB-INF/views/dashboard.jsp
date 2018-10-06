<spring:url var="style" value="/style" />
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<jsp:include page="user_base.jsp"></jsp:include>
<html>
<body>
	<h2>${style}style</h2> 
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            Welcome : ${user} | 
        </h2>
        <h3>Hello role login works!!</h3>
        <a href="/dbms/dashboard/product_category">All Products</a><br>
        <a href="/dbms/dashboard/my_cart">My Cart</a><br>
        <a href="/dbms/dashboard/profile">View Profile</a><br>
        <a href="/dbms/dashboard/order_history">Order History</a><br>
        <a href="/dbms/dashboard/my_cart/reserved_products">Reserved Products</a><br>
        <a href="<c:url value="/j_spring_security_logout" />"> Logout</a>
    </c:if>
</body>
</html>
