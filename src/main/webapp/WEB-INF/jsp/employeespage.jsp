<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employees</title>
</head>
<body>

<c:url var="addUrl" value="/test/main/employees/add" />
<c:url var="searchUrl" value="/test/main/employees/search" />
<table style="border: 1px solid; width: 500px; text-align:center">
	<thead style="background:#fcf">
		<tr>
			<th>First Name</th>
			<th>Second Name</th>
			<th>Last Name</th>
			<th>Age</th>
			<th>Experience</th>
			<th>Description</th>
			<th colspan="6"></th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${employees}" var="employee">
			<c:url var="editUrl" value="/test/main/employees/edit?id=${employee.id}" />
			<c:url var="deleteUrl" value="/test/main/employees/delete?id=${employee.id}" />
		<tr>
			<td><c:out value="${employee.firstName}" /></td>
			<td><c:out value="${employee.secondName}" /></td>
			<td><c:out value="${employee.lastName}" /></td>
			<td><c:out value="${employee.age}" /></td>
			<td><c:out value="${employee.experience}" /></td>
			<td><c:out value="${employee.description}" /></td>
			<td><a href="${editUrl}">Edit</a></td>
			<td><a href="${deleteUrl}">Delete</a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<p><a href="${addUrl}">Add</a> an employee</p>
<p><a href="${searchUrl}">Search</a> for an employee</p>

</body>
</html>