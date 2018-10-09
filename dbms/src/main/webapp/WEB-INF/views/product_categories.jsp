<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:url var="style" value="/style" />
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="${style}/css/product.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<jsp:include page="user_base.jsp"></jsp:include> 
</head>
<!--  
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard">Sparkle</a>
    </div>
    <ul class="nav navbar-nav" style="display: inline;">
      <li><a href="${pageContext.request.contextPath}/dashboard/product_category">Products</a></li>
      <li><a href="${pageContext.request.contextPath}/dashboard/my_cart/reserved_products">Reserved Orders</a></li>
      <li><a href="${pageContext.request.contextPath}/dashboard/order_history">Orders</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right" style="display: inline;">
      <li><a href="${pageContext.request.contextPath}/dashbord/about_us"><span class="glyphicon glyphicon-info-sign"></span> About Us</a></li>
      <li><a href="${pageContext.request.contextPath}/dashboard/my_cart"><span class="glyphicon">&#xe116;</span> Cart</a></li>
      <li><a href="${pageContext.request.contextPath}/dashboard/profile"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
      <li><a href="<c:url value="/j_spring_security_logout" />"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav>

-->

<div class="container">
    <div class="row">
        <div class="col-lg-12 my-3">
            <div class="pull-right">
                <div class="btn-group">
                    <button class="btn btn-info" id="list">
                        List View
                    </button>
                    <button class="btn btn-danger" id="grid">
                        Grid View
                    </button>
                </div>
            </div>
        </div>
    </div> 
    <div id="products" class="row view-group">
    <c:forEach items="${category}" var="item">
                <div class="item col-xs-4 col-lg-4">
                    <div class="thumbnail card">
                        <div class="img-event">
                            <img class="group list-group-image img-fluid" src="${style}/images/${item}.jpg"  alt="http://placehold.it/400x250/000/fff" />
                        </div>
                        <div class="caption card-body">
                            <h4 class="group card-title inner list-group-item-heading">
                                ${item}</h4>
                        
                            <div class="row">
                            	<div class="col-xs-12 col-md-6">
                                    <a class="btn btn-success" href="${pageContext.request.contextPath}/dashboard/product_category/${item}">View</a>
                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <p class="lead">
                                   </p>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                     
                </div>
		</c:forEach>
</div>



<script>

$(document).ready(function() {
    $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
    $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
});

</script>
</body>
</html>