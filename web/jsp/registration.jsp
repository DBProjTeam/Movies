<%--
  Created by Vyacheslav
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="do" method="post">
    <input type="hidden" name="action" value="registration">
    Login: <input name="login"><br>
    Password: <input name="password"><br>
    Name: <input name="name"><br>
    Surname: <input name="surname"><br>
    <input type="submit" value="Регистрация">
</form>
<%
    if (request.getAttribute("error") != null) {
%>
<%=request.getAttribute("error") %>
<%

    }
%>
</body>
</html>
