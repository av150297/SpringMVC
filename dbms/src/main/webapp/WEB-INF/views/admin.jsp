<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<spring:url var="style" value="/style" />
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<html>
<body>
<jsp:include page="admin_base.jsp"></jsp:include>
    <h1>Name : ${name}</h1>
    <h1>Description : ${description}</h1>
 
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            Welcome : ${user} | 
        </h2>
        <div class="container">
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
		</div>
    </c:if>
</body>
</html>
