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
<title>Users</title>
<body>	
	<jsp:include page="admin_base.jsp"></jsp:include>
	
	<!-- Table Starts here -->	
<div class="container" >
<div class="row">
		        
<div class="col-md-12">
        <div class="table-responsive">
       <input type="text" id="myInput" onkeyup="myFunction()"  placeholder="Search for username"> 
		<table id="mytable" class="table table-bordred table-striped">
    	    <thead>                  
                   <th>Username</th>
                   <th>Name</th>
                   <th>House</th>
                   <th>City</th>
                   <th>Email</th>
                   <th>Orders</th>
                   <th>Confirm</th>
                   <th>Decline</th>
           	</thead>
<tbody>
    <c:forEach items="${allusers}" var="user">
    <tr>
    <td>${user.username}</td>
    <td>${user.name}</td>
    <td>${user.house}</td>
    <td>${user.city}</tdser.>
    <td>${user.email}</td>
    <td><a href="/dbms/admin/reserved_users/${user.username}"><p data-placement="top" data-toggle="tooltip" title="Products"><button class="btn btn-primary btn-sm" data-title="Products" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-list-alt"></span></button></p></a></td>
    <td><a href="/dbms/admin/reserved_users/${user.username}/placed"><p data-placement="top" data-toggle="tooltip" title="Confirm Order"><button class="btn btn-success btn-sm" data-title="Confirm Order" data-toggle="modal" data-target="#edit" >Confirm Order</button></p></a></td>
    <td><a href="/dbms/admin/reserved_users/${user.username}/remove"><p data-placement="top" data-toggle="tooltip" title="Decline Order"><button class="btn btn-danger btn-sm" data-title="Decline Order" data-toggle="modal" data-target="#edit" >Remove</button></p></a></td>
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


</body>

</html>