<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 27.03.2016
  Time: 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
${user.name}
Movies:
<table border="solid 1px #000">
    <thead>
    <td>Role</td>
    <td>name</td>
    <td>surname</td>
    <td>birth_date</td>
    <td>death_date</td>
    <td>country</td>
    <td>imageId</td>

    </thead>

    <c:forEach var="movie" items="${movies}">
        <tr>
            <td>${movie.movie_id}</td>
            <td>${movie.runtime}</td>
            <td>${movie.releaseDate}</td>
            <td>${movie.year}</td>
            <td>${movie.description}</td>
            <td>${movie.image_id}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
