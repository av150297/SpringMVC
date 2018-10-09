<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<spring:url var="style" value="/style" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${style}/css/homepage.css" rel="stylesheet">
</head>
<title>Users</title>
<body>	
	<jsp:include page="admin_base.jsp"></jsp:include>
	
	<!-- Table Starts here -->
	<br><br>	
<div class="container" >

<h2>Order History of ${username}</h2><br>
<div class="row">
		        
<div class="col-md-12">
        <div class="table-responsive">
		<table id="mytable" class="table table-bordred table-striped">
    	    <thead>                  
                   <th>Order Id</th>
                   <th>Transaction Id</th>
                   <th>Address</th>
                   <th>Number of Products</th>
                   <th>Offer Code</th>
                   <th>Total</th>
                   <th>Details</th>
           	</thead>
<tbody>
    <c:forEach items="${orders}" var="order">
    <tr>
    <td>${order.order_id}</td>
    <td>${order.transaction_id}</td>
    <td>${order.address}</td>
    <td>${orderCounts.get(order.order_id)}</td>
    <td>${order.offer_id}</td>
    <td>${order.subtotal - (offers.get(order.order_id).discount)*(order.subtotal/100)}</td>
    <td><a href="${pageContext.request.contextPath}/admin/user_orders/${username}/${order.order_id}"><p data-placement="top" data-toggle="tooltip" title="Details"><button class="btn btn-primary btn-xs" data-title="Detail" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-list-alt"></span></button></p></a></td>
    </tr>
    </c:forEach>

</tbody>
        
</table>

            </div>
        </div>
	</div>
</div>
<!-- Table Ends here -->

</body>

</html>