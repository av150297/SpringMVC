<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:url var="style" value="/style" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/dbms/dashboard">Sparkle</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="/dbms/dashboard/product_category">Products</a></li>
      <li><a href="/dbms/dashboard/my_cart/reserved_products">Reserved Orders</a></li>
      <li><a href="/dbms/dashboard/order_history">Orders</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="/dbms/dashbord/about_us"><span class="glyphicon glyphicon-info-sign"></span> About Us</a></li>
      <li><a href="/dbms/dashboard/my_cart"><span class="glyphicon">&#xe116;</span> Cart</a></li>
      <li><a href="/dbms/dashboard/profile"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
      <li><a href="<c:url value="/j_spring_security_logout" />"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav>