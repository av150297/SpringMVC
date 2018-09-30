<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<form:form method="post" modelAttribute="product" action="/dbms/admin/addproduct/${categoryid}">
		<table>
		
		<tr><td>
		Product Name</td><td>
		<form:input path="productname" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="productname" /></td></tr>
		
		<tr><td>
		Product Price</td><td>
		<form:input path="productprice" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="productprice" /></td></tr>
		
		<tr><td>
		Product Quantity</td><td>
		<form:input path="availablequantity" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="availablequantity" /></td></tr>
		
		<tr><td>
		Product Description</td><td>
		<form:input path="description" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="description" /></td></tr>

			<tr>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>