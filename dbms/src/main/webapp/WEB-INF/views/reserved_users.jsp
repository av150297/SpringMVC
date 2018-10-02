<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reserved Users</title>
</head>
<body>
	<h3>Users</h3>
		<c:forEach items="${users}" var="user">
		    <tr>
		    	<td><a href="/dbms/admin/reserved_users/${user.username}">${user.username}</a></td>
		    	<br>
		    <br>
		</c:forEach>
	<br>
	<h3>${message}</h3>
	<a href="/dbms/admin/">Dashboard</a><br>
</body>
</html>