<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
	<h2>${message}</h2> 
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            Welcome : ${user} | 
        </h2>
        <h3>Hello role login works!!</h3>
        <a href="/dbms/dashboard/product_category">All Products</a><br>
        <a href="/dbms/dashboard/my_cart">My Cart</a><br>
        <a href="/dbms/dashboard/profile">View Profile</a><br>
        <a href="/dbms/dashboard/order_history">Order History</a><br>
        <a href="<c:url value="/j_spring_security_logout" />"> Logout</a>
    </c:if>
</body>
</html>
