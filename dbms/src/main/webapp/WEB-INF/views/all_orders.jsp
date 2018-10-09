<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<spring:url var="style" value="/style" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
</head>
<title>Orders</title>
<body>	
	<jsp:include page="admin_base.jsp"></jsp:include>
	
	<!-- Table Starts here -->
	<br><br>	
<div class="container" >

<h2>Orders</h2><br>
<div class="row">
		        
<div class="col-md-12">
        <div class="table-responsive">
        <input type="text" id="myInput" onkeyup="myFunction()"  placeholder="Search for Id">
		<table id="mytable" class="table table-bordred table-striped">
    	    <thead>                  
                   <th>Order Id</th>
                   <th>Transaction Id</th>
                   <th>Username</th>
                   <th>Address</th>
                   <th>Number of Products</th>
                   <th>Offer Code</th>
                   <th>Total</th>
                   <th>Delivered By</th>
                   <th>Details</th>
           	</thead>
<tbody>
    <c:forEach items="${orders}" var="order">
    <tr>
    <td>${order.order_id}</td>
    <td>${order.transaction_id}</td>
    <td>${order.username}</td>
    <td>${order.address}</td>
    <td>${orderCounts.get(order.order_id)}</td>
    <td>${order.offer_id}</td>
    <td>${order.subtotal - (offers.get(order.order_id).discount)*(order.subtotal/100)}</td>
    <td>${order.delivered_by}</td>
    <td><a href="${pageContext.request.contextPath}/admin/user_orders/${order.username}/${order.order_id}"><p data-placement="top" data-toggle="tooltip" title="Details"><button class="btn btn-primary btn-xs" data-title="Detail" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-list-alt"></span></button></p></a></td>
    </tr>
    </c:forEach>

</tbody>
        
</table>

            </div>
        </div>
	</div>
</div>
<!-- Table Ends here -->


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

</body>

</html>