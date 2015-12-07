<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit an employee</title>
</head>
<body>

<c:url var="saveUrl" value="/test/main/employees/edit?id=${employeeAttribute.id}" />
<form:form modelAttribute="employeeAttribute" method="POST" action="${saveUrl}">
	<table>
		<tr>
			<td><form:label path="id">Id:</form:label></td>
			<td><form:input path="id" disabled="true"/></td>
		</tr>
	
		<tr>
			<td><form:label path="firstName">First Name:</form:label></td>
			<td><form:input path="firstName"/></td>
		</tr>

		<tr>
			<td><form:label path="secondName">Second Name</form:label></td>
			<td><form:input path="secondName"/></td>
		</tr>

		<tr>
			<td><form:label path="lastName">Last Name</form:label></td>
			<td><form:input path="lastName"/></td>
		</tr>

		<tr>
			<td><form:label path="age">Age</form:label></td>
			<td><form:input path="age"/></td>
		</tr>

		<tr>
			<td><form:label path="experience">Experience</form:label></td>
			<td><form:input path="experience"/></td>
		</tr>

		<tr>
			<td><form:label path="description">Description</form:label></td>
			<td><form:input path="description"/></td>
		</tr>
	</table>
	
	<input type="submit" value="Save" />
</form:form>

</body>
</html>