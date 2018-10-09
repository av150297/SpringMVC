<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:url var="style" value="/style" />


<head>
<spring:url var="style" value="/style" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<jsp:include page="admin_base.jsp"></jsp:include>
<div class="container">
      <div class="row">
      
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Seller Id: ${seller.seller_id}</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img  src="${style}/images/1.png" class="img-circle img-responsive"> </div>
                
        
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Seller Name:</td>
                        <td>${seller.name}</td>
                      </tr>
                      <tr>
                        <td>Email: </td>
                        <td>${seller.email}</td>
                      </tr>
                      <tr>
                        <td>Address: </td>
                        <td>${seller.address}</td>
                      </tr>
                   
                         
                     
                    </tbody>
                  </table>
                  
                  <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-warning">Back</a>
                  <a href="${pageContext.request.contextPath}/admin/products/${seller.seller_id}" class="btn btn-success">Products</a>
                </div>
              </div>
            </div>
                 
            
          </div>
        </div>
      </div>
    </div>