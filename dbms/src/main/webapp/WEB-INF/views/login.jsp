<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<title>Custom Login Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body onload='document.loginForm.j_username.focus();'>
	<div class="container-fluid">
	<h3>Custom Login Page</h3>

	<%
		String errorString = (String) request.getAttribute("error");
		if (errorString != null && errorString.trim().equals("true")) {
			out.println("<span class=\"errorblock\">Incorrect login name or password or the account has been disabled by the admin. Please try again");
		}
	%>

	<form name='loginForm' action="<c:url value='login' />" method='POST'>

		<table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='username' value=''></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='password' /></td>
			</tr>
			<tr>
				<td><input name="submit" type="submit" value="submit" /></td>
				<td><input name="reset" type="reset" /></td>
			</tr>
		</table>

	</form>
	<% if (request.getParameter("message")!=null) {%>
	<%= request.getParameter("message") %>
	<% } %>
	</div>
</body>
</html>