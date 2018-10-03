<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Custom Login Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

      
      <!-- edit form column -->
        <h3>Personal info</h3>
        
        <form class="form-horizontal" role="form" action="/dbms/dashboard/edit_profile">
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
              <input class="form-control" type="text" value="${userinfo.mail }" name="mail">
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
  </div>
</div>
<hr>