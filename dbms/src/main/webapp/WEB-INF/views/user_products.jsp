<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>User Products</title>
<spring:url var="style" value="/style" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="${style}/css/cart.css" rel="stylesheet">
<jsp:include page="user_base.jsp"></jsp:include>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>Cart</title>
</head>
<body>
<div class="container">
<h2> User <strong>${username}</strong> Cart</h2>

	<c:if test="${failure!=null}">

  	<div class="alert alert-warning">
  		<strong>Alert! </strong>${failure}<br>
	</div>
	</c:if>
	
		<c:if test="${success!=null}">

  	<div class="alert alert-success">
  		<strong>Congrats!  </strong>${success}<br>
	</div>
	</c:if>
	
	<c:if test="${reserve_error!=null}">

  	<div class="alert alert-danger">
  		<strong>Alert!  </strong>${reserve_error}<br>
	</div>
	</c:if>
	
	
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:45%">Product</th>
							<th style="width:10%">Type</th>
							<th style="width:8%">Category</th>
							<th style="width:22%" class="text-center">Price</th>
							<th style="width:15%"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products}" var="item">
					
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="" class="img-responsive"/></div>
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
							<td class="actions" data-th="">
								
								<a href="/dbms/dashboard/my_cart/remove/${item.product_id}"><button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button></a>								
							</td>
						</tr>
					</c:forEach>	
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td data-th="Price"><strong>Subtotal: <strong style="color:green;">${amount}</strong></strong><br><strong>Offer: ${offer.offer_id}</strong><br><strong>Discount:</strong><strong style="color:red;"> -${discount}</strong></td>
					</tr>	
						
					</tbody>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Total 1.99</strong></td>
						</tr>
						<tr>
							<td><a href="/dbms/dashboard/my_cart/add_in_reserve" class="btn btn-primary"><i class="fa fa-angle-left"></i> Add To Reserve</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong >Total: <strong style="color: green;">${amount-discount}</strong></strong></td>
							<td><a href="/dbms/dashboard/my_cart/place_order" class="btn btn-success btn-block">Place Order <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
					
					
				</table>
				<form method="POST" action="/dbms/dashboard/my_cart/apply_offer">
								Coupon code: <input type="text" name="coupon" required>
								<button class="btn btn-success" type="submit" value="Apply">Apply</button>
							</form>
</div>
</body>
</html>