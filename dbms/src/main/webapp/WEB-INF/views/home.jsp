<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:url var="style" value="/style" />
<html>
<head>
<link href="${style}/css/homepage.css" rel="stylesheet"></head>

<body background="${style}/images/home_background1.jpg">

<h1 style="text-align:center; font-size:50px; color:#fff">   </h1>

<button onclick="document.getElementById('modal-wrapper').style.display='block'" style="width:200px; margin-top:200px; margin-left:160px;">
Login</button>

<div id="modal-wrapper" class="modal">
  
  <form class="modal-content animate" name='loginForm' action="<c:url value='login' />" method='POST'>
        
    <div class="imgcontainer">
      <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
      <img src="${style}/images/1.png" alt="Avatar" class="avatar">
      <h1 style="text-align:center">Sign In</h1>
    </div>

    <div class="container">
      <input type="text" placeholder="Enter Username" name="username">
      <input type="password" placeholder="Enter Password" name="password">        
      <button type="submit">Login</button>
      <input type="checkbox" style="margin:26px 30px;"> Remember me      
    </div>
    
  </form>
  
</div>

<!-- Registration -->

<button onclick="document.getElementById('modal-wrapper2').style.display='block'" style="width:200px; margin-top:200px; margin-left:160px;">
Register</button>

<div id="modal-wrapper2" class="modal">
  
  <form:form class="modal-content animate" method="post" modelAttribute="user" action="register">
        
    <div class="imgcontainer">
      <span onclick="document.getElementById('modal-wrapper2').style.display='none'" class="close" title="Close PopUp">&times;</span>
      <img src="${style}/images/1.png" alt="Avatar" class="avatar">
      <h1 style="text-align:center">Sign Up</h1>
    </div>

    <div class="container">
    	<form:input path="username" type="text" placeholder="Enter Username" required="required"/>
    	<form:errors path="username" />
    	<form:input path="password" id="password" type="password" placeholder="Enter Password" required="required"/>
    	<form:errors path="password" />
    	<form:input path="mpassword" id="confirm_password" type="password" placeholder="Confirm Password" required="required"/>
    	<form:errors path="mpassword" />
    	<form:input path="name" type="text" placeholder="Enter Name" required="required"/>
    	<form:errors path="name" />
    	<form:input path="house" type="text" placeholder="Enter house address" required="required"/>
    	<form:errors path="house" />
    	<form:input path="pin" type="text" placeholder="Enter Pincode" required="required" pattern="[0-9]{6}" />
    	<form:errors path="pin" />
    	<form:input path="city" type="text" placeholder="Enter City" required="required"/>
    	<form:errors path="city" />
    	<form:input path="state" type="text" placeholder="Enter State" required="required" />
    	<form:errors path="state" />
    	<form:input path="email" type="text" placeholder="Enter Email" required="required" pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
    	<form:errors path="email" />
      <button type="submit">Register</button>      
    </div>
    
  </form:form>
  
</div>

<!-- Registration end here -->



<script>
// If user clicks anywhere outside of the modal, Modal will close

var modal = document.getElementById('modal-wrapper');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<script>
var password = document.getElementById("password")
, confirm_password = document.getElementById("confirm_password");

function validatePassword(){
if(password.value != confirm_password.value) {
  confirm_password.setCustomValidity("Passwords Don't Match");
} else {
  confirm_password.setCustomValidity('');
}
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;

</script>



</body>
<!--  

	<h1>Name : ${name}</h1>
	<h1>Description : ${description}</h1>
	<br>
		<a href="login">Login</a>
		<a href="register">Register</a>
--></html>