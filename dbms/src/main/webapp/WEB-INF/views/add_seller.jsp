<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	${error}
	<form:form method="post" modelAttribute="seller" action="/dbms/admin/add_seller">
		<table>

				
		<tr><td>
		Seller id</td><td>
		<form:input path="sellerId" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="sellerId" /></td></tr>		
				
				
		<tr><td>
		Seller Name</td><td>
		<form:input path="name" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="name" /></td></tr>
		
		<tr><td>
		Address</td><td>
		<form:input path="address" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="address" /></td></tr>
		
		<tr><td>
		Email </td><td>
		<form:input path="mail" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="mail" /></td></tr>

			<tr>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>