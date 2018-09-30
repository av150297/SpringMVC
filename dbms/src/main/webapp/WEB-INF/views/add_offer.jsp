<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	${error}
	<form:form method="post" modelAttribute="offer" action="/dbms/admin/add_offer">
		<table>

				
		<tr><td>
		Offer id: </td><td>
		<form:input path="offer_id" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="offer_id" /></td></tr>		
				
				
		<tr><td>
		Offer Name: </td><td>
		<form:input path="name" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="name" /></td></tr>
		
		<tr><td>
		Discount: </td><td>
		<form:input path="discount" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="discount" /></td></tr>
		
		<tr><td>
		Status: </td><td>
		<form:input path="status" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="status" /></td></tr>
			<tr>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>