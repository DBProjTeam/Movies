<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="../lib/css/style_search.css">
    <link rel="shortcut icon" href="img/logo.JPG" type="image/jpg">

    <title>Коллекция фильмов</title>
</head>
<body>
<div class="wepper_main">
    <div class="wepper_head">

        <%@include file="/jsp/jspf/head.jspf" %>

        <div class="discription">
            <span class="titel">Коллекция фильмов</span>
        </div>

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
                                <span>Релиз:</span><span>${movie.releaseDate}</span><br>
                                <span>Страна:</span><span>country</span><br>
                                <span>режиссер:</span><span>bos</span><br>
                            </div>
                                    <a href="do?action=delete_favorite_movie&movieId=${movie.movieId}">Удалить из коллекции</a>
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
</body>
</html>