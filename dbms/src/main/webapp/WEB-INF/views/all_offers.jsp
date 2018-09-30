<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Offers</title>
</head>
<body>
	<c:forEach items="${offers}" var="offer">
		    <tr>      
		    	Offer Id: <td>${offer.offer_id}</td><br>
		    	Offer Name: <td> ${offer.name} </td><br>
		        Discount : <td>${offer.discount} %</td><br>
		        <c:if test="${offer.status==1}">
		        <a href="/dbms/admin/offers/${offer.offer_id}"><button type="button">Disable</button></a>
		        </c:if>
		        <c:if test="${offer.status==0}">
		        <a href="/dbms/admin/offers/${offer.offer_id}"><button type="button">Enable</button></a>
		        </c:if>
		    </tr>
		    <br><br>
		</c:forEach>
<a href="/dbms/admin">Dashboard </a>
</body>
</html>