<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:url var="style" value="/style" />
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/dbms/admin">Sparkle</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="/dbms/admin/products">Products</a></li>
      <li><a href="/dbms/admin/employees">Employees</a></li>
      <li><a href="/dbms/admin/offers">Offers</a></li>
      <li><a href="/dbms/admin/salary">Salary Info</a></li>
      <li><a href="/dbms/admin/manageusers">Manage Users</a></li>
      <li><a href="/dbms/admin/reserved_users">Reserved Orders</a></li>
      <li><a href="/dbms/admin/all_orders">Orders</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    	<li><a href="/dbms/admin/user_cart"><span class="glyphicon glyphicon-shopping-cart"></span> User Carts</a></li>
      <li><a href="<c:url value="/j_spring_security_logout" />"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav>