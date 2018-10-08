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
              <h3 class="panel-title">Product Name: ${product.product_name}</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img  src="data:image/jpeg;base64,${image}" class="img-circle img-responsive"> </div>
                
        
                <div class=" col-md-9 col-lg-9 "> 
                  
                  <form method="post" action="/dbms/admin/products/info/${product.product_id}/edit">
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
                        <td><input type="number" required="required" min="0" max="1000" value="${product.gold}" name="gold" /></td>
                      </tr>
                      <tr>
                        <td>Silver (in gm): </td>
                        <td><input type="number" required="required" min="0" max="1000" value="${product.silver}" name="silver" /></td>
                      </tr>
                      <tr>
                        <td>Platinum (in gm): </td>
                        <td><input type="number" required="required" min="0" max="1000" value="${product.platinum}" name="platinum"/></td>
                      </tr>
                      <tr>
                        <td>Stones: </td>
                        <td><input type="text" required="required" value="${product.stones}" name="stones"/></td>
                      </tr>
                      <tr>
                      <tr>
                        <td>Cost Price: </td>
                        <td><input type="number" required="required" value="${product.cost_price}" name="cost_price"/></td>
                      </tr>
                      
                      <tr>
                        <td>Making Charges: </td>
                        <td><input type="number" required="required" value="${product.making_charges}" name="making_charges"/></td>
                      </tr>
                      
                      <tr>
                        <td>Description: </td>
                        <td><input type="text" required="required" value="${product.description}" name="description"/></td>
                      </tr>
                     
                    </tbody>
                  </table>
                  
                  <button type="submit" class="btn btn-success">Submit</button>
                  <button type="reset" class="btn btn-warning">Reset</button>
                  </form>
                </div>
              </div>
            </div>
                 <div class="panel-footer">
                        <a href="/dbms/admin/products/info/${product.product_id}" data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger">Back</a>
                    </div>
            
          </div>
        </div>
      </div>
    </div>