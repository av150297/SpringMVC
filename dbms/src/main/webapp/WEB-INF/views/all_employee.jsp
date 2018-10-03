<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>Employees</title>
<body>	
	<jsp:include page="admin_base.jsp"></jsp:include>
	
	<!-- Table Starts here -->	
<div class="container" >
<a href="/dbms/admin/add_employee"><button class="btn btn-primary" style="margin-top:40px;float: right;">Add An Employee</button></a>
<div class="row">
		        
<div class="col-md-12">
        <div class="table-responsive">
		<table id="mytable" class="table table-bordred table-striped">
    	    <thead>                  
                   <th>Emp Id</th>
                   <th>Name</th>
                   <th>Type</th>
                   <th>Contact</th>
                   <th>Email</th>
                   <th>Address</th>
                   <th>Number of Orders</th>
                   <th>Status</th>
                   <th>Orders</th>
                   </thead>
<tbody>
    <c:forEach items="${employees}" var="employee">
    <tr>
    <td>${employee.empId}</td>
    <td>${employee.name}</td>
    <td>${employee.type}</td>
    <td>${employee.contact}</td>
    <td>${employee.email}</td>
    <td>${employee.address}</td>
    <td>${ employee.number_of_order}</td>
    <c:if test="${employee.status==0}">
    <td> <a href="/dbms/admin/employees/toggle/${employee.empId}"><p data-placement="top" data-toggle="tooltip" title="Status"><button class="btn btn-success btn-xs" data-title="Enable" data-toggle="modal" data-target="/dbms/admin/employees/toggle/${employee.empId}" >Enable</button></p></a></td>
    </c:if>
    <c:if test="${employee.status==1}">
    <td><a href="/dbms/admin/employees/toggle/${employee.empId}"><p data-placement="top" data-toggle="tooltip" title="Status"><button class="btn btn-danger btn-xs" data-title="Disable" data-toggle="modal" data-target="/dbms/admin/employees/toggle/${employee.empId}" >Disable</button></p></a></td>
    </c:if>
    <td><a href="/dbms/admin/employees/${employee.empId}"><p data-placement="top" data-toggle="tooltip" title="Details"><button class="btn btn-primary btn-xs" data-title="Detail" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-list-alt"></span></button></p></a></td>
    </tr>
    </c:forEach>
</tbody>
        
</table>

            </div>
        </div>
	</div>
</div>
	
<script>
// If user clicks anywhere outside of the modal, Modal will close

var modal = document.getElementById('modal-wrapper');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

	<!-- Table Ends Here -->

</body>
</html>