<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:url var="style" value="/style" />
<html>
<head>
<meta charset="UTF-8">
<title>${product.product_name}</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<jsp:include page="user_base.jsp"></jsp:include> 
<link href="${style}/css/product_detail.css" rel="stylesheet">
</head>
<body>

        <div class="container">
        <c:if test="${success!=null}">
  		<div class="alert alert-success alert-dismissible" style="border-radius:25px;">
  			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong>Congrats! </strong>${success}<br>
		</div>
		</c:if>
		<c:if test="${failure!=null}">
  		<div class="alert alert-danger alert-dismissible" style="border-radius:25px;">
  			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong>Alert! </strong>${failure}<br>
		</div>
		</c:if>
		
        	<div class="row">
               <div class="col-xs-4 item-photo">
                    <img style="max-width:100%;" src="data:image/jpeg;base64,${image}" />
                </div>
                <div class="col-xs-5" style="border:0px solid gray">
                    <h3>${product.product_name}</h3>    
                    <h5 style="color:#337ab7"><a href="${pageContext.request.contextPath}/dashboard/product_category/${product.category}">${product.category}</a> · <small style="color:#337ab7">${product.product_type}</small></h5>
        
                    <h6 class="title-price"><small>PRICE</small></h6>
                    <h3 style="margin-top:0px;"> <i class="fa fa-inr"></i> ${product.making_charges+product.cost_price}</h3>
        
                    <div class="section">
                        <h6 class="title-attr" style="margin-top:15px;" ><small>Silver</small></h6>                    
                        <div>
							<div class="attr2">${product.silver}</div>
                        </div><br>
                    </div>
                    <div class="section" style="padding-bottom:5px;">
                        <h6 class="title-attr"><small>Gold</small></h6>                    
                        <div>
                            <div class="attr2">${product.gold}</div>
                        </div>
                    </div>   
                    <div class="section" style="padding-bottom:5px;">
                        <h6 class="title-attr"><small>Platinum</small></h6>                    
                        <div>
                            <div class="attr2">${product.platinum}</div>
                        </div>
                    </div>
                    <div class="section" style="padding-bottom:20px;">
                        <h6 class="title-attr"><small>Stones</small></h6>                    
                        <div>
                            <div class="attr2">${product.stones}</div>
                        </div>
                    </div>
                                    
        
                    <div class="section" style="padding-bottom:20px; float:left;">
                        <a href="${pageContext.request.contextPath}/dashboard/my_cart/add_in_cart/${product.category}/${product.product_name}"><button class="btn btn-warning " style="height:30px;width:210px;"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Add To Cart</button></a>
                        <a href="${pageContext.request.contextPath}/dashboard/my_cart"><button class="btn btn-success" style="height:30px;width:210px;"><span style="margin-right:20px " class="glyphicon glyphicon-check" aria-hidden="true"></span> Check Out</button></a>
                    </div>                                        
                </div>                              
        
                <div class="col-xs-9">
                    <ul class="menu-items">
                        <li class="active">Description</li>
                    </ul>
                    <div style="width:100%;border-top:1px solid silver">
                        <p style="padding:15px;">
                            <small>
                            ${product.description}</small>
                        </p>
                        
                    </div>
                </div>		
            </div>
        </div>        
<script type="text/javascript">


$(document).ready(function(){
    //-- Click on detail
    $("ul.menu-items > li").on("click",function(){
        $("ul.menu-items > li").removeClass("active");
        $(this).addClass("active");
    })

    $(".attr,.attr2").on("click",function(){
        var clase = $(this).attr("class");

        $("." + clase).removeClass("active");
        $(this).addClass("active");
    })

    //-- Click on QUANTITY
    $(".btn-minus").on("click",function(){
        var now = $(".section > div > input").val();
        if ($.isNumeric(now)){
            if (parseInt(now) -1 > 0){ now--;}
            $(".section > div > input").val(now);
        }else{
            $(".section > div > input").val("1");
        }
    })            
    $(".btn-plus").on("click",function(){
        var now = $(".section > div > input").val();
        if ($.isNumeric(now)){
            $(".section > div > input").val(parseInt(now)+1);
        }else{
            $(".section > div > input").val("1");
        }
    })                        
}) 

</script>
</body>
</html>
