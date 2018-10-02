<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
    <h1>Name : ${name}</h1>
    <h1>Description : ${description}</h1>
 
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            Welcome : ${user} | 
        </h2>
        <a href="/dbms/admin/add_product">Add a new Product</a><br>
        <a href="/dbms/admin/add_employee">Add Employee</a><br>
        <a href="/dbms/admin/employees">All Employees</a><br>
        <a href="/dbms/admin/manageusers">Manage users</a><br>
        <a href="/dbms/admin/add_seller">Add Whole Seller</a><br>
        <a href="/dbms/admin/add_offer">Add Offer</a><br>
        <a href="/dbms/admin/offers">All Offer</a><br>
        <a href="/dbms/admin/reserved_users">Reserved Users</a><br>
        <a href="/dbms/admin/all_orders">Find All orders</a><br>
        
        <a href="<c:url value="/j_spring_security_logout" />"> Logout</a>
        <c:forEach items="${ws}" var="x">
	${x}<br>
	</c:forEach>
    </c:if>
</body>
</html>
