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
	<link href="${style}/css/seller.css" rel="stylesheet">
</head>

<!--  Model Starts here-->




<!-- Form starts here -->


	


	<div class="container" style="border-radius: 25px;">
	<c:if test="${seller_error!=null}">

  	<div class="alert alert-danger">
  		<strong>Alert! </strong>${seller_error}<br>
	</div>
	</c:if>
	
	<c:if test="${product_error!=null}">

  	<div class="alert alert-danger">
  		<strong>Alert! </strong>${product_error}<br>
	</div>
	</c:if>
	
	<c:if test="${seller_success!=null}">

  	<div class="alert alert-success">
  		<strong>Congrats! </strong>${seller_success}<br>
	</div>
	</c:if>
	
	<c:if test="${success!=null}">
  	<div class="alert alert-success">
  		<strong>Congrats! </strong>${success}<br>
	</div>
	</c:if>
	
	<!-- Trigger/Open The Modal -->
	<c:if test="${flag!=null}">
	<button id="myBtn" class="btn btn-primary" style="margin-top:auto;float: right;">Add A Seller</button>
	</c:if>

	<c:if test="${flag==null}">
	<button id="myBtn" class="btn btn-primary" style="margin-top:30px;float: right;">Add A Seller</button>
	</c:if>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-dialog modal-lg">
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Add A WholeSeller Details</h2>
    </div>
    <br>
    <div style="position: relative; margin-left: 20px; margin-right: 20px">
    <form:form method="post" modelAttribute="seller" action="${pageContext.request.contextPath}/admin/add_seller">
    
    <label for="Sellerid"><b>Seller Id</b></label>
    <form:input  path="seller_id" type="text" required="required" placeholder="Seller ID" style="border-radius: 25px;"/>
    <form:errors path="seller_id" />
    
    <label for="Name"><b>Seller Name</b></label>
    <form:input path="name" type="text" required="required" placeholder="Seller Name"/>
    <form:errors path="name" />
    
    <label for="Address"><b>Address</b></label>
    <form:input path="address" type="text" required="required" placeholder="Address"/>
    <form:errors path="address" />
    
    <label for="email"><b>E-mail</b></label>
    <form:input path="email" pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" type="text" required="required" placeholder="Email" />
    <form:errors path="email" />
    
    <div class="modal-footer">
      <button type="submit" class="registerbtn" style="border-radius: 25px;">Add</button>
    </div>
    </form:form>
    </div>
    
  </div>
	</div>
</div>


<!--  Model Ends here-->
	
	
	<form:form method="post" modelAttribute="product" action="${pageContext.request.contextPath}/admin/add_product" enctype="multipart/form-data">
    <h1 style="position: center; margin-left: 10px;">Add Product</h1>
    <hr>
    <label for="Productid"><b>Product Id</b></label>
    <input type="text"  required="required" placeholder="Enter comma separated product ids without space" name="product_ids"/>
	<br><br>
	
	<div class="custom-select" style="width:200px;">
	<label for="seller_id"><b>Seller ID</b></label>
		<form:select path="seller_id" placeholder="Seller ID" required="required">
		<c:forEach items="${wholesellers}" var="seller">
		<option value="${seller.seller_id}">${seller.seller_id}</option>
		</c:forEach>
		</form:select>
		<form:errors path="seller_id" />
	</div><br>
	
	<label for="name"><b>Product Name</b></label>
    <form:input path="product_name" type="text" required="required" placeholder="Product Name"/>
	<form:errors path="product_name" />
	
	<label for="file"><b>Choose a File</b></label>
    <input name="file" type="file" required="required" />
	
	
	<label for="Product_Type"><b>Product Type</b></label>
    <form:input path="product_type" type="text" required="required" placeholder="Product Type"/>
	<form:errors path="product_type" />
	
	<div class="custom-select" style="width:200px;">
	<label for="category"><b>Category</b></label>
		<form:select path="category" placeholder="Category" required="required" >
		<c:forEach items="${categories}" var="x">
		<option value="${x}">${x}</option>
		</c:forEach>
		</form:select>
		<form:errors path="category" />
	</div><br>
	
	
	<label for="Cost Price"><b>Cost Price</b></label>
    <form:input path="cost_price" type="number" required="required" min="0" placeholder="0" style="text-align: right;"/>
	<form:errors path="cost_price" />
	
	<label for="Making Charges"><b>Making Charges</b></label>
    <form:input path="making_charges" type="number" required="required" min="0" placeholder="0" style="text-align: right;"/>
	<form:errors path="making_charges" />
	
	<label for="Gold"><b>Gold Wt</b></label>
    <form:input path="gold" type="number" step="0.01" required="required" min="0" max="1000" placeholder="In Gram" style="text-align: right;"/>
	<form:errors path="gold" />
	
	<label for="Silver"><b>Silver Wt</b></label>
    <form:input path="silver" type="number" step="0.01" required="required" min="0" max="1000" placeholder="In Gram" style="text-align: right;"/>
	<form:errors path="silver" />
	
	<label for="Platinum"><b>Platinum Wt</b></label>
    <form:input path="platinum" type="number" step="0.01" required="required" min="0" max="1000" placeholder="In Gram" style="text-align: right;"/>
	<form:errors path="platinum" />
	<br><br>
	<label for="Stones"><b>Stones</b></label>
    <form:input path="stones" type="text" required="required" placeholder="Stones"/>
	<form:errors path="stones" />
	
	<label for="Description"><b>Description</b></label>
    <form:input path="description" type="text" required="required" placeholder="Enter Description"/>
	<form:errors path="description" />
	
    <button type="submit" class="registerbtn" style="border-radius: 25px;">Add</button>
  

  </form:form>
  <hr>
  <h1 style="position: center; margin-left: 10px;">Increase the Quantity</h1>
	<form method="post" action="${pageContext.request.contextPath}/admin/add_product/increase_quantity">
	<label for="Product Ids"><b>Product Ids</b></label>
	<input type="text" required="required" name="product_ids" placeholder="Enter comma separated product ids without space">
	<div class="custom-select" style="width:200px;">
	<label for="product_name"><b>Product Name</b></label>
		<select name="product_name" placeholder="Product Name" required="required">
		<c:forEach items="${product_names}" var="name">
		<option value="${name}">${name}</option>
		</c:forEach>
		</select>
		
	</div><br>
	
	
	
	<button type="submit" class="registerbtn" style="border-radius: 25px;">Add</button>
	</form>
	
	</div>  
	
  

	<!-- Form End Here -->
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

