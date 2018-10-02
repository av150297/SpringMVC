<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<form:form method="post" modelAttribute="seller" action="/dbms/admin/add_seller">
		<table>

				
		<tr><td>
		Seller id</td><td>
		<form:input path="seller_id" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="seller_id" /></td></tr>		
				
				
		<tr><td>
		Seller Name</td><td>
		<form:input path="name" type="text" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="name" /></td></tr>
		
		<tr><td>
		Address</td><td>
		<form:input path="address" type="text" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="address" /></td></tr>
		
		<tr><td>
		Email </td><td>
		<form:input path="email" type="email" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="email" /></td></tr>

			<tr>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form:form>	