<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<title>Salary</title>
<body>	
	<jsp:include page="admin_base.jsp"></jsp:include>
	
	

	
	
	<!-- Table Starts here -->	
<div class="container" >
<c:if test="${success!=null}">
  		<div class="alert alert-success alert-dismissible" style="border-radius:25px;">
  			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong>Congrats! </strong>${success}<br>
		</div>
</c:if>
<h2>Salary Info</h2>
<div class="row">
		        
<div class="col-md-12">
        <div class="table-responsive">
		<table id="mytable" class="table table-bordred table-striped">
    	    <thead>                  
                   <th>Type Id</th>
                   <th>Salary</th>
                   <th>Change</th>
                   </thead>
<tbody>
    <c:forEach items="${salaries}" var="salary">
    <form method="post" action="/dbms/admin/salary/${salary.type}">
    <tr>
    <td>${salary.type}</td>
    <td><input type="number" required="required" value="${salary.salary}" name="salary"></td>
    <td><a href="/dbms/admin/salary/${salary.type}"><p data-placement="top" data-toggle="tooltip" title="Status"><button style="width:60px;" type="submit" class="btn btn-success btn-sm" data-title="Disable" data-toggle="modal" data-target="/dbms/admin/salary/${salary.type}" >Update</button></p></a></td>
    </tr>
    </form>
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