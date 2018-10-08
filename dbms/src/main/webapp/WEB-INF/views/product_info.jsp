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
              <h3 class="panel-title">Product Id: ${product.product_id}</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img  src="data:image/jpeg;base64,${image}" class="img-circle img-responsive"> </div>
                
        
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Product Name:</td>
                        <td>${product.product_name}</td>
                      </tr>
                      <tr>
                        <td>Product Type: </td>
                        <td>${product.product_type}</td>
                      </tr>
                      <tr>
                        <td>Category: </td>
                        <td>${product.category}</td>
                      </tr>
                   	  <tr>
                        <td>Gold (in gm): </td>
                        <td>${product.gold}</td>
                      </tr>
                      <tr>
                        <td>Silver (in gm): </td>
                        <td>${product.silver}</td>
                      </tr>
                      <tr>
                        <td>Platinum (in gm): </td>
                        <td>${product.platinum}</td>
                      </tr>
                      <tr>
                        <td>Stones: </td>
                        <td>${product.stones}</td>
                      </tr>
                      <tr>
                        <td>Description: </td>
                        <td>${product.description}</td>
                      </tr>
                     
                    </tbody>
                  </table>
                  
                  <a href="/dbms/admin/products" class="btn btn-warning">Back to Products</a>
                  <a href="/dbms/admin/" class="btn btn-success">Home</a>
                </div>
              </div>
            </div>
                 <div class="panel-footer">
                        <a href="/dbms/admin/seller_info/${product.seller_id}" data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
            
          </div>
        </div>
      </div>
    </div>