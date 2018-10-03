<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="admin_base.jsp"></jsp:include>
<head>
<spring:url var="style" value="/style" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${style}/css/homepage.css" rel="stylesheet">
</head>
<title>Offers</title>

	<!-- Table Starts here -->	
<div class="container" >
<a href="/dbms/admin/add_offer"><button class="btn btn-primary" style="margin-top:50px;float: right;">Add An Offer</button></a>
<div class="row">
		        
<div class="col-md-12">
        <div class="table-responsive">
		<table id="mytable" class="table table-bordred table-striped">
    	    <thead>                  
                   <th>Offer Id</th>
                   <th>Name</th>
                   <th>Discount</th>
                   <th>Status</th>
                   </thead>
<tbody>
    <c:forEach items="${offers}" var="offer">
    <tr>
    <td>${offer.offer_id}</td>
    <td>${offer.name}</td>
    <td>${offer.discount}</td>
    <c:if test="${offer.status==0}">
    <td> <a href="/dbms/admin/offers/${offer.offer_id}"><p data-placement="top" data-toggle="tooltip" title="Status"><button class="btn btn-success btn-xs" data-title="Enable" data-toggle="modal" data-target="/dbms/admin/employees/toggle/${employee.empId}" >Enable</button></p></a></td>
    </c:if>
    <c:if test="${offer.status==1}">
    <td><a href="/dbms/admin/offers/${offer.offer_id}"><p data-placement="top" data-toggle="tooltip" title="Status"><button class="btn btn-danger btn-xs" data-title="Disable" data-toggle="modal" data-target="/dbms/admin/employees/toggle/${employee.empId}" >Disable</button></p></a></td>
    </c:if>
    </tr>
    </c:forEach>
</tbody>
        
</table>

            </div>
        </div>
	</div>
</div>

<!-- Table Ends Here -->

</body>
</html>