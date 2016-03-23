<%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 22.03.2016
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Person</title>
</head>
<body>
<%@ include file="/jsp/jspf/head.jspf" %>
person:
<c:out default="none" value="${person.name}"/>



</body>
</html>
