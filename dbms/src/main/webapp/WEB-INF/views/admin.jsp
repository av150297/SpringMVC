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
        <a href="add_product">Add a new Product</a><br>
        <a href="add_employee">Add Employee</a><br>
        <a href="/dbms/admin/manageusers">Manage users</a><br>
        <a href="add_seller">Add Whole Seller</a><br>
        <a href="all_orders">Find All orders</a><br>
        <a href="<c:url value="/j_spring_security_logout" />"> Logout</a>
    </c:if>
</body>
</html>
