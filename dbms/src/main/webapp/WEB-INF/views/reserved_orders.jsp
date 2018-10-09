<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:url var="style" value="/style" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="${style}/css/cart.css" rel="stylesheet">
<jsp:include page="user_base.jsp"></jsp:include>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>Reserved Products</title>
</head>
<html>
<div class="container">
<h2> User <strong>${username}</strong> Reserved Items</h2>
	<c:if test="${products.size()==0}">
	<center><h2>Reserve Cart is Empty</h2></center>
	<img src="${style}/images/emptycart.jpg" style="margin-left:320px;">
	</c:if>
	<c:if test="${products.size()!=0}">
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
									<div class="col-sm-2 hidden-xs"><img src="data:image/jpeg;base64,${imgmap[item.product_name]}" alt="" class="img-responsive"/></div>
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
							<td><a href="/dbms/dashboard" class="btn btn-warning"><i class="fa fa-angle-left"></i> Homepage</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong >Total: <strong style="color: green;">${amount-discount}</strong></strong></td>
							<td><a href="/dbms/dashboard/my_cart" class="btn btn-success btn-block">Cart <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
					
					
				</table>
</c:if>
</div>
</html>