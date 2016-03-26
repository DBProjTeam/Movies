<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20.03.2016
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

    <title>Результаты поиска</title>
</head>
<body>
<%@ include file="/jsp/jspf/head.jspf" %>
Фильмы:<br>
<table>
    <c:forEach var="movie" items="searchMovie">
        <tr>
            <td>${movie.movie_id}</td>
            <td>${movie.runtime}</td>
            <td>${movie.year}</td>
            <td>${movie.releaseDate}</td>
            <td>${movie.description}</td>
            <td>${movie.image_id}</td>
        </tr>
    </c:forEach>
</table>
Люди:<br>
<table>
    <c:forEach var="person" items="searchPerson">
        <tr>
            <td>${person.id}</td>
            <td>${person.name}</td>
            <td>${person.surname}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
