<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="admin_base.jsp"></jsp:include>
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
	</head>
<body>
	<div class="container">
	<c:if test="${salary_error!=null}">

  	<div class="alert alert-danger" style="border-radius:25px;">
  		<strong>Alert! </strong>${salary_error}<br>
	</div>
	</c:if>
	
	<c:if test="${employee_error!=null}">

  	<div class="alert alert-danger" style="border-radius:25px;">
  		<strong>Alert! </strong>${employee_error}<br>
	</div>
	</c:if>
	
	<c:if test="${salary_success!=null}" >

  	<div class="alert alert-success" style="border-radius:25px;">
  		<strong>Congrats! </strong>${salary_success}<br>
	</div>
	</c:if>
	
	<c:if test="${success!=null}">
  	<div class="alert alert-success" style="border-radius:25px;">
  		<strong>Congrats! </strong>${success}<br>
	</div>
	</c:if>
	<!-- Trigger/Open The Modal -->
	<c:if test="${flag!=null}">
	<button id="myBtn" class="btn btn-primary" style="margin-top:auto;float: right;">Add Salary Type</button>
	</c:if>

	<c:if test="${flag==null}">
	<button id="myBtn" class="btn btn-primary" style="margin-top:30px;float: right;">Add A Salary Type</button>
	</c:if>



<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-dialog modal-lg">
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Add Salary Details</h2>
    </div>
    <br>
    <div style="position: relative; margin-left: 20px; margin-right: 20px">

    <form:form method="post" modelAttribute="salarytype" action="${pageContext.request.contextPath}/admin/add_salary">
    
    <label for="typeid"><b>Type Id</b></label>
    <form:input path="type"  type="text" required="required" placeholder="Type ID" style="border-radius: 25px;"/>
    <form:errors path="type" />
    
    <label for="salary"><b>Salary</b></label>
    <form:input path="salary"  type="text" required="required" placeholder="Salary Amount" style="border-radius: 25px;" pattern="[0-9]*"/>
    <form:errors path="salary" />
    
    
    <div class="modal-footer">
      <button type="submit" class="registerbtn" style="border-radius: 25px;">Add</button>
    </div>
    </form:form>
    </div>
    
  </div>
	</div>
</div>


<!--  Model Ends here-->




	<!-- Form starts here -->

	<form:form method="post" modelAttribute="employee" action="${pageContext.request.contextPath}/admin/add_employee">
    <h1>Employee Record</h1>
    <hr>
    <label for="empid"><b>Employee Id</b></label>
    <form:input path="empId" type="text" required="required" placeholder="Employee Id"/>
	<form:errors path="empId" />
	
	<label for="empname"><b>Employee Name</b></label>
    <form:input path="name" type="text" required="required" placeholder="Employee Name"/>
	<form:errors path="name" />
	
	<div class="custom-select" style="width:200px;">
	<label for="type_id"><b>Type id</b></label>
		<form:select path="type" placeholder="Type" required="required">
		<c:forEach items="${types}" var="tp">
		<option value="${tp.type}">${tp.type}</option>
		</c:forEach>
		</form:select>
		<form:errors path="type" />
	</div>
	
	<label for="contact"><b>Contact</b></label>
    <form:input path="contact" type="text" required="required" pattern="[0-9]{10}" placeholder="Contact"/>
	<form:errors path="contact" />
	
	<label for="address"><b>Address</b></label>
    <form:input path="address" type="text" required="required" placeholder="Address"/>
	<form:errors path="address" />
	
	<label for="email"><b>Email</b></label>
    <form:input path="email" type="text" required="required" placeholder="Email"/>
	<form:errors path="email" />


    <button type="submit" class="registerbtn">Register</button>
  </div>

  </form:form>

	<!-- Form End Here -->
</div>


</body>
	<script>
var x, i, j, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 0; j < selElmnt.length; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
</script>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>	