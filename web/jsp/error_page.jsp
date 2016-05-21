<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 01.06.2016
  Time: 4:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <link type="text/css" href="../lib/css/MyStyle.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<body>
<div class="wepper_main">
    <%--<c:import url="jspf/head.jspf"/>--%>
    <div class="wepper_body">
        <strong style="color: #000; font-size: 1.5em; font-family: 'Open Sans', sans-serif;">Доступ запрещен</strong>
        <br>
        <c:if test="${not empty error}">
            ${error}
        </c:if>
    </div>
    <div class="wepper_footer">
        <%--<%@include file="jspf/footer.jspf"%>--%>
    </div>
</div>
</body>
</html>
