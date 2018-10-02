<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<form:form method="post" modelAttribute="product" action="/dbms/admin/add_product">
		<table>

		<tr><td>
		Product id</td><td>
		<form:input path="product_id"  type="number" required="required" min="0"/> </td><!-- bind to user.name-->
		<td><form:errors path="product_id" /></td></tr>
				
		<tr><td>
		Seller id</td><td>
		<form:input path="seller_id" type="text" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="seller_id" /></td></tr>		
				
				
		<tr><td>
		Product Name</td><td>
		<form:input path="product_name" type="text" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="product_name" /></td></tr>
		
		<tr><td>
		Product Type</td><td>
		<form:input path="product_type" type="text" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="product_type" /></td></tr>
		
		<tr><td>
		Category</td><td>
		<form:input path="category" type="text" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="category" /></td></tr>
		
		<tr><td>
		Cost Price</td><td>
		<form:input path="cost_price" type="number" required="required" min="0"/> </td><!-- bind to user.name-->
		<td><form:errors path="cost_price" /></td></tr>
		
		<tr><td>
		Making Charges</td><td>
		<form:input path="making_charges" type="number" required="required" min="0" /> </td><!-- bind to user.name-->
		<td><form:errors path="making_charges" /></td></tr>
		
		<tr><td>
		Gold(in gm)</td><td>
		<form:input path="gold" type="number" step="0.01" required="" min="0" max="1000"/> </td><!-- bind to user.name-->
		<td><form:errors path="gold" /></td></tr>
		
		<tr><td>
		Silver(in gm)</td><td>
		<form:input path="silver" type="number" step="0.01" required="" min="0" max="1000" /> </td><!-- bind to user.name-->
		<td><form:errors path="silver" /></td></tr>
		
		<tr><td>
		Platinum(in gm)</td><td>
		<form:input path="platinum" type="number" step="0.01" required="" min="0" max="1000" /> </td><!-- bind to user.name-->
		<td><form:errors path="platinum" /></td></tr>
		
		<tr><td>
		Stones</td><td>
		<form:input path="stones" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="stones" /></td></tr>
		
		<tr><td>
		Product Description</td><td>
		<form:input path="description" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="description" /></td></tr>

			<tr>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>