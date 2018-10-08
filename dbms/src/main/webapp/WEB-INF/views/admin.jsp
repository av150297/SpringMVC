<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:url var="style" value="/style" />
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${style}/css/slideshow.css" rel="stylesheet">
</head>
<html>
<body>
<jsp:include page="admin_base.jsp"></jsp:include>

<div id="myCarousel" class="carousel slide" data-ride="carousel" style="float:top">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <div class="carousel-inner">
    <div class="item active">
    <div class="item pic">
      <img src="${style}/images/slideshow1.jpg" class="responsive" style="width:100%;height:90%;overrflow:hidden">
    <span class="imgtext">
           <center><div style="font-family:'myFont';font-size:200% ; color: black;">Sparkle</div></center>
           </span>
    </div>
    </div>

    <div class="item pic">
 	    <img src="${style}/images/slideshow2.jpg" class="responsive" style="width:100%;height:90%;overrflow:hidden">
     	<span class="imgtext">
           <center><div style="font-family:'myFont';font-size:200%;">Sparkle</div></center>
           </span>
     </div>

         <div class="item pic">
      <img src="${style}/images/slideshow3.jpg" class="responsive" style="width:100%;height:90%;overrflow:hidden">
            <span class="imgtext">
           	<center><div style="font-family:'myFont';font-size:200%; color: black;">Sparkle</div></center>
           </span>     
    </div>
  </div>

  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>



    
</body>
</html>
