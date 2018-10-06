<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<spring:url var="style" value="/style" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="${style}/css/cart.css" rel="stylesheet">
<jsp:include page="user_base.jsp"></jsp:include>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>Order Detail</title>
</head>

<body>
<!-- Tables Starts Here -->

<div class="container">
<c:if test="${success!=null}">
  		<div class="alert alert-success" style="border-radius:25px;">
  			<strong>Congrats! </strong>${success}<br>
		</div>
		</c:if>
<h2> Detail of Order Number: <strong>${order.order_id}</strong></h2>
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:45%">Product</th>
							<th style="width:10%">Type</th>
							<th style="width:8%">Category</th>
							<th style="width:22%" class="text-center">Price</th>
							<th style="width:15%">Feedbacks</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products}" var="item">
					
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="${style}/images/${item.product_id}.jpg" alt="..." "style class="img-responsive"/></div>
									<div class="col-sm-10">
										<h4 class="nomargin">${item.product_name}</h4>
										<p>${item.description}</p>
									</div>
								</div>
							</td>
							<td data-th="Type">${item.product_type}</td>
							<td data-th="Category">
								${item.category}
							</td>
							<td data-th="Price" class="text-center">${item.making_charges+item.cost_price}</td>
							<td class="actions" data-th="Feedbacks">
								<c:forEach items="${mp[item.product_id]}" var="fb">
		        				<p>${fb.description}</p>
		        				<a href="/dbms/dashboard/feedback/delete/${order.username}/${order.order_id}/${fb.feedbackId}"><button class="btn btn-danger btn-sm"  ><i class="fa fa-trash-o" ></i></button></a>
		        				<br><br>
		        				</c:forEach>
								<form method="get" action="/dbms/dashboard/feedback/${order.order_id}/${item.product_id}">
		        			<input type="text-area" name="description" required="required"><br><br>
		        			<button class="btn btn-success" type="submit">Add</button>
		       	 			</form>
																
							</td>
						</tr>
					</c:forEach>	
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td data-th="Price"><strong>Subtotal: <strong style="color:green;">${order.subtotal}</strong></strong><br><strong>Offer: ${order.offer_id}</strong><br><strong>Discount:</strong><strong style="color:red;"> -${discount}</strong></td>
					</tr>	
						
					</tbody>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Total 1.99</strong></td>
						</tr>
						<tr>
							<td><a href="/dbms/dashboard/order_history" class="btn btn-warning"><i class="fa fa-angle-left"></i>Order History</a></td>
							<td colspan="2" class="hidden-xs"></td>
							
							<td class="hidden-xs text-center"><strong >Total: <strong style="color: green;">${order.subtotal-discount}</strong></strong></td>
							<td><a href="/dbms/dashboard" class="btn btn-success" >Homepage <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
					
					
				</table>
</div>



<!-- Table End Here -->
</body>
</html>