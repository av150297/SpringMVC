<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:url var="style" value="/style" />
<!DOCTYPE html>
<html>
<head>
<spring:url var="style" value="/style" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<title>Products</title>
<style>

#myInput {
     /* Add a search icon to input */
    background-position: 10px 12px; /* Position the search icon */
    background-repeat: no-repeat; /* Do not repeat the icon image */
    width: 100%; /* Full-width */
    font-size: 16px; /* Increase font-size */
    padding: 12px 20px 12px 40px; /* Add some padding */
    border: 1px solid #ddd; /* Add a grey border */
    margin-bottom: 12px; /* Add some space below the input */
}
}

</style>
<body>	
	<jsp:include page="admin_base.jsp"></jsp:include>
	
		
	
	
	
	
	<!-- Table Starts here -->	
<div class="container" >
<input type="text" id="myInput" onkeyup="myFunction()"  placeholder="Search for Id">
<c:if test="${seller_id!=null}">
<h3>Product Bought from Seller Id: ${seller_id}</h3></c:if>
<a href="/dbms/admin/add_product"><button class="btn btn-primary" style="margin-top:40px;float: right;">Add a Product</button></a>
<div class="row">
		        
<div class="col-md-12">
        <div class="table-responsive">
		<table id="mytable" class="table table-bordred table-striped">
    	    <thead>                  
                   <th>Product Id</th>
                   <th>Product Name</th>
                   <th>Product Type</th>
                   <th>Category</th>
                   <th>Gold, Silver, Platinum</th>
                   <th>Stones</th>
                   <th>Cost Price+Making Charges</th>
                   <th>Status</th>
                   <th>Seller</th>
                   <th>Edit</th>
                   </thead>
<tbody>
    <c:forEach items="${products}" var="item">
    <tr>
    <td>${item.product_id}</td>
    <td>${item.product_name}</td>
    <td>${item.product_type}</td>
    <td>${item.category}</td>
    <td>${item.gold}, ${item.silver}, ${item.platinum}</td>
    <td>${item.stones}</td>
    <td>${item.cost_price}+${item.making_charges}</td>
    <c:if test="${item.status==0}">
    <td> <a href=""><p data-placement="top" data-toggle="tooltip" title="Status"><button class="btn btn-success btn-xs" data-title="Enable" data-toggle="modal" data-target="" >Unsold</button></p></a></td>
    </c:if>
    <c:if test="${item.status==1}">
    <td><a href=""><p data-placement="top" data-toggle="tooltip" title="Status"><button class="btn btn-danger btn-xs" data-title="Disable" data-toggle="modal" data-target="" >Sold</button></p></a></td>
    </c:if>
    <td><a href="/dbms/admin/seller_info/${item.seller_id}"><p data-placement="top" data-toggle="tooltip" title="Details"><button class="btn btn-primary btn-xs" data-title="Detail" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-list-alt"></span></button></p></a></td>
    <c:if test="${item.status==0}">
    <td><a href="/dbms/admin/products/info/${item.product_id}/edit"><p data-placement="top" data-toggle="tooltip" title="Details"><button class="btn btn-warning btn-xs" data-title="Detail" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-edit"></span></button></p></a></td>
    </c:if>
    <c:if test="${item.status==1}">
    <td></td>
    </c:if>
    </tr>
    </c:forEach>
</tbody>
        
</table>

            </div>
        </div>
	</div>
</div>

<script>
function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
</script>
	

	<!-- Table Ends Here -->

</body>
</html>