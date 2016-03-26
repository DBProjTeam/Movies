<%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 24.03.2016
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Movie</title>
</head>
<body>

<%@ include file="/jsp/jspf/head.jspf" %>

<article align="center">
    Movie:
    <table border="solid 1px #000">
        <thead>
        <td>Id</td>
        <td>runtime</td>
        <td>releaseDate</td>
        <td>year</td>
        <td>description</td>
        <td>image_ID</td>
        </thead>
        <tr>
            <td>${movie.movie_id}</td>
            <td>${movie.runtime}</td>
            <td>${movie.releaseDate}</td>
            <td>${movie.year}</td>
            <td>${movie.description}</td>
            <td>${movie.image_id}</td>
        </tr>
    </table>
</article>
<article align="center">
    Coments:
    <table border="solid 1px #000">
        <c:forEach var="coment" items="${comments}">
            <tr>
                <td>${coment.comment_ID}</td>
                <td>${coment.user_ID}</td>
                <td>${coment.movie_ID}</td>
                <td>${coment.text}</td>
                <td>${coment.date}</td>
            </tr>
        </c:forEach>
    </table>
    Persons:
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
        <c:forEach var="pers" items="${persons}">
            <tr>
                <td>${pers.role}</td>
                <td>${pers.person.name}</td>
                <td>${pers.person.surname}</td>
                <td>${pers.person.birth_date}</td>
                <c:if test="val.death_date!=null">
                <td>${person.death_date}</td>
            </c:if>
                <td>${pers.person.country}</td>
                <td>${pers.person.imageId}</td>
            </tr>

        </c:forEach>
    </table>
    Rating:
    <c:out value="${rating}" default="0"/>
</article>
</body>
</html>
