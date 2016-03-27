<%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 27.03.2016
  Time: 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Profile </title>
</head>
<body>
<table border="solid 1px #000">
    <tr>
    <td contenteditable="true">${user.id}</td>
    <td contenteditable="true">${user.login}</td>
    <td contenteditable="true">${user.password}</td>
    <td contenteditable="true">${user.name}</td>
    <td contenteditable="true">${user.surname}</td>
    <td contenteditable="true">${user.role}</td>
    <td contenteditable="true">${user.imageId}</td>
</tr>
    <a href="do?action=favorite_movies">favorite</a>

<%--
    <form action="do?action=profile_change" method="post">
        <input type="text" name = "name" value="${user.name}">
        <input type="text" name = "surname" value="${user.surname}">
        <input type="text" name = "password" value="${user.password}">
        <input type="submit">
    </form>--%>
</table>
</body>
</html>
