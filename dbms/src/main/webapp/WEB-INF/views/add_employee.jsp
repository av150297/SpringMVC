<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	${error}
	<form:form method="post" modelAttribute="employee" action="/dbms/admin/add_employee">
		<table>

				
		<tr><td>
		Employee id</td><td>
		<form:input path="empId" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="empId" /></td></tr>		
				
				
		<tr><td>
		Employee Name</td><td>
		<form:input path="name" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="name" /></td></tr>
		
		
		<tr><td>
		Type_id: </td><td>
		<form:input path="type" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="type" /></td></tr>
		
		<tr><td>
		Contact</td><td>
		<form:input path="contact" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="contact" /></td></tr>
		
		<tr><td>
		Address</td><td>
		<form:input path="address" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="address" /></td></tr>
		
		<tr><td>
		Email </td><td>
		<form:input path="email" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="email" /></td></tr>

			<tr>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>