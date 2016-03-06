<%--
  Connection test
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entities.User"%>
<%@ page import="dao.UserDAO"%>
<html>
<head>
    <title></title>
</head>
<body>
    <%
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getByPK(1);//get user with id=1. Вставте 1 user в свою базу для проверки
    %>
    Hello, <%=user.getLogin() %>
</body>
</html>
