<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Search results</title>
</head>
<body>
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

    <c:url var="mainUrl" value="/test/main/employees" />
    <p>Return to <a href="${mainUrl}">Main List</a></p>
</body>
</html>
