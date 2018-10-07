<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<spring:url var="style" value="/style" />
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="${style}/css/Emp_form.css" rel="stylesheet">
	<link href="${style}/css/seller.css" rel="stylesheet">
</head>

<jsp:include page="user_base.jsp"></jsp:include>
      
      <!-- edit form column -->
      <div class="container">
        <c:if test="${success!=null}">
  		<div class="alert alert-success alert-dismissible" style="border-radius:25px;">
  			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong>Congrats! </strong>${success}<br>
		</div>
		</c:if>
        <form class="form-horizontal" role="form" action="/dbms/dashboard/edit_profile">
        	<h3 style="text-align: center;">Personal info</h3><br>
          <div class="form-group">
            <label class="col-lg-3 control-label">Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${userinfo.name}" name="name">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">House:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${userinfo.house}" name="house">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">State:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${ userinfo.state}" name="state">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">City:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="${ userinfo.city}" name="city">
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-md-3 control-label">Pincode:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="${userinfo.pin}" name="pin">
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${userinfo.email }" name="mail">
            </div>
          </div>
          <br>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Save Changes">
              <span></span>
              <input type="reset" class="btn btn-default" value="Cancel">
            </div>
          </div>
        </form>
      </div>
<hr>
</body>