<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<form:form method="post" modelAttribute="category" action="/dbms/admin/addnewcategory/">
		<table>
		
		<tr><td>
		Category Name</td><td>
		<form:input path="categoryname" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="categoryname" /></td></tr>
			<tr>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>