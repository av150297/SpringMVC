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
<title>Users</title>
<body>	
	<jsp:include page="admin_base.jsp"></jsp:include>
	
	<!-- Table Starts here --><br><br>	
<div class="container" >
<div class="row">
		        
<div class="col-md-12">
        <div class="table-responsive">
		<table id="mytable" class="table table-bordred table-striped">
    	    <thead>                  
                   <th>Username</th>
                   <th>Name</th>
                   <th>House</th>
                   <th>City</th>
                   <th>Email</th>
                   <th>Status</th>
                   <th>Orders</th>
           	</thead>
<tbody>
    <c:forEach items="${allusers}" var="user">
    <tr>
    <td>${user.username}</td>
    <td>${user.name}</td>
    <td>${user.house}</td>
    <td>${user.city}</tdser.>
    <td>${user.email}</td>
    <c:if test="${user.status==0}">
    <td> <a href="${pageContext.request.contextPath}/admin/manageusers/${user.username}"><p data-placement="top" data-toggle="tooltip" title="Status"><button class="btn btn-success btn-xs" data-title="Enable" data-toggle="modal" data-target="${pageContext.request.contextPath}/admin/manageusers/${user.username}" >Enable</button></p></a></td>
    </c:if>
    <c:if test="${user.status==1}">
    <td><a href="${pageContext.request.contextPath}/admin/manageusers/${user.username}"><p data-placement="top" data-toggle="tooltip" title="Status"><button class="btn btn-danger btn-xs" data-title="Disable" data-toggle="modal" data-target="${pageContext.request.contextPath}/admin/manageusers/${user.username}" >Disable</button></p></a></td>
    </c:if>
    <td><a href="${pageContext.request.contextPath}/admin/user_orders/${user.username}"><p data-placement="top" data-toggle="tooltip" title="Details"><button class="btn btn-primary btn-xs" data-title="Detail" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-list-alt"></span></button></p></a></td>
    </tr>
    </c:forEach>

</tbody>
        
</table>

            </div>
        </div>
	</div>
</div>


</body>

</html>