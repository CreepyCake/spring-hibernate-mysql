<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Search for an employee</title>
</head>
<body>
<c:url var="searchUrl" value="/test/main/employees/searchResults" />
<form:form modelAttribute="employeeAttribute" method="GET" action="${searchUrl}">
  <table>
    <tr>
      <td><form:label path="firstName">First Name:</form:label></td>
      <td><form:input path="firstName"/></td>
    </tr>

    <tr>
      <td><form:label path="secondName">Second Name:</form:label></td>
      <td><form:input path="secondName"/></td>
    </tr>

    <tr>
      <td><form:label path="lastName">Last Name:</form:label></td>
      <td><form:input path="lastName"/></td>
    </tr>

    <tr>
      <td><form:label path="age">Age:</form:label></td>
      <td><form:input path="age"/></td>
    </tr>

    <tr>
      <td><form:label path="experience">Experience:</form:label></td>
      <td><form:input path="experience"/></td>
    </tr>

    <tr>
      <td><form:label path="description">Description:</form:label></td>
      <td><form:input path="description"/></td>
    </tr>
  </table>

  <input type="submit" value="Search" />
</form:form>
</body>
</html>
