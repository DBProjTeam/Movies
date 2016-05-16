<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="../lib/css/style_search.css">
    <link type="text/css" rel="stylesheet" href="../lib/css/MyStyle.css">
    <link rel="shortcut icon" href="img/logo.JPG" type="image/jpg">

    <title>Коллекция фильмов</title>
</head>
<body>
<div class="wepper_main">
        <%@include file="/jsp/jspf/head.jspf" %>
    <div class="wepper_Head">
        <div class="seperator"><h3>Коллекция фильмов</h3></div>
    </div>
    <div class="wepper_body">
        <div class="bloc_search_2">

            <div class="list_film">
                <c:if test="${favoriteMovies!=null}">
                    <c:forEach var="movie" items="${favoriteMovies}">
                        <div class="items">
                                <%--Здесь постер фильма--%>
                            <img src="/img_temp/${movie.mainImage.name}">

                            <div>
                                <span>Год:</span><span>${movie.year}</span><br>
                                <span>Время:</span><span>${movie.runtime}</span><br>
                                <span>Страна:</span><span>${movie.country.country}</span><br>
                                <span>Режисер:</span><span><c:if test="${movie.director.person.id!=1}"> <a
                                    href="do?action=person&person_id=${movie.director.person.id}"></c:if> ${movie.director.person.name}</a></span><br>

                            </div>
                                    <a class="button_detali_from_faborite" href="do?action=delete_favorite_movie&movieId=${movie.movieId}">Удалить из коллекции</a>
                            <div class="name">
                                <span>Название:</span><span><a href="do?action=movie&movie_id=${movie.movieId}"><c:out
                                    value="${movie.title}" default="Без названия"/></a></span><br>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty favoriteMovies}">
                    <div>У вас пока что нет фильмов в коллекции!</div>
                </c:if>
            </div>
        </div>

    </div>
</div>
</body>
</html>