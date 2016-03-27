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
        <td>${user.id}</td>
        <td>${user.login}</td>
        <td>${user.password}</td>
        <td>${user.name}</td>
        <td>${user.surname}</td>
        <td>${user.role}</td>
        <td>${user.imageId}</td>

    </tr>

</table>
</body>
</html>
