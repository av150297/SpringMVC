<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<form:form method="post" modelAttribute="user" action="register">
		<table><tr><td>
		username</td><td>
		<form:input path="username" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="username" /></td></tr>
		
		<tr><td>
		password</td><td>
		<form:input path="password" type="password" /> </td><!-- bind to user.name-->
		<td><form:errors path="password" /></td></tr>
		
		<tr><td>Confirm password</td>
		<td>
		<form:input path="mpassword" type="password" /> </td><!-- bind to user.name-->
		<td><form:errors path="mpassword" /></td></tr>
		
		<tr><td>Name</td>
		<td>
		<form:input path="name" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="name" /></td></tr>
		
		<tr><td>Dno street</td>
		<td>
		<form:input path="dno_street" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="dno_street" /></td></tr>
		
		<tr><td>PIN</td>
		<td>
		<form:input path="pin" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="pin" /></td></tr>
		
		<tr><td>City</td>
		<td>
		<form:input path="city" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="city" /></td></tr>
		<tr>
		
		<tr><td>PAN</td>
		<td>
		<form:input path="pan" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="pan" /></td></tr>
		<tr>
		<tr><td>Shop</td>
		<td>
		<form:input path="shop" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="shop" /></td></tr>
		<tr>
		<tr><td>Mail</td>
		<td>
		<form:input path="mail" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="mail" /></td></tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>