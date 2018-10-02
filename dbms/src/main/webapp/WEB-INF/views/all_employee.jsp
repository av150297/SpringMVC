<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees</title>
</head>
<body>
	<c:forEach items="${employees}" var="employee">
		    <tr>      
		    	Employee Id: <td>${employee.empId}</td><br>
		    	Employee Name: <td> ${employee.name} </td><br>
		        Type : <td>${ employee.type}</td><br>
		        Contact : <td>${ employee.contact}</td><br>
		        Email : <td>${ employee.email}</td><br>
		        Address : <td>${ employee.address}</td><br>
		        Number_of_orders : <td>${ employee.number_of_order}</td><br>
		        <a href="/dbms/admin/employees/${employee.empId}"><input type="button" value="Detail"></a>
		        <c:if test="${employee.status==1}">
		        <a href="/dbms/admin/employees/toggle/${employee.empId}"><button type="button">Disable</button></a>
		        </c:if>
		        <c:if test="${employee.status==0}">
		        <a href="/dbms/admin/employees/toggle/${employee.empId}"><button type="button">Enable</button></a>
		        </c:if>
		        
		    </tr>
		    <br><br>
		</c:forEach>
<a href="/dbms/admin">Dashboard </a>
</body>
</html>