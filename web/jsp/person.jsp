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
<article>
    <table border="solid 1px #000">
        <thead>
        <td>Id</td>
        <td>name</td>
        <td>surname</td>
        <td>birth_date</td>
        <c:if test="val.death_date!=null">
            <td>birth_death</td>
        </c:if>
        <td>country</td>
        <td>image_ID</td>
        </thead>
        <tr>
            <td>${person.id}</td>
            <td>${person.name}</td>
            <td>${person.surname}</td>
            <td>${person.birth_date}</td>
            <c:if test="val.death_date!=null">
                <td>${person.death_date}</td>
            </c:if>
            <td>${person.country}</td>
            <td>${person.imageId}</td>
        </tr>

    </table>
</article>
<p>
    сыграл в :<c:out value="${countMovie}" default="0"/> фильмах
</p>


</body>
</html>
