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
    <link type="text/css" rel="stylesheet" href="../lib/css/style_search.css">
    <link type="text/css" rel="stylesheet" href="../lib/css/MyStyle.css">
    <link rel="shortcut icon" href="img/logo.JPG" type="image/jpg">
    <script src="/lib/js/jquery-2.2.3.min.js"></script>
    <title>Результаты поиска по запросу ${word}</title>
</head>
<body>


<div class="wepper_main">
    <div class="wepper_head">

        <%@include file="/jsp/jspf/head.jspf" %>
        <div class="seperator">  </div>
            <div class="discription">
                <span class="titel">Результат поиск по запросу ${word}</span>
            </div>


    </div>
    <div class="wepper_body">
        <div class="bloc_search_2" id="movie">
            <h2>Фильмы</h2>
            <div class="list_film">
                <c:if test="${!searchMovie.isEmpty()}">
                    <c:forEach var="movie" items="${searchMovie}">
                        <div class="items">
                            <%--Здесь постер фильма--%>
                                <img src="/img_temp/${movie.mainImage.name}">
                            <div>
                                <span>Название:</span><span><a href="do?action=movie&movie_id=${movie.movieId}"><c:out
                                    value="${movie.title}" default="Без названия"/></a></span><br>
                                <span>Год:</span><span>${movie.year}</span><br>
                                <span>Время:</span><span>${movie.runtime}</span><br>
                                <span>Релиз:</span><span>${movie.releaseDate}</span><br>
                                <span>Страна:</span><span>${movie.country.country}</span><br>
                                <span>Режисер:</span><span><c:if test="${movie.director.person.id!=1}"> <a
                                    href="do?action=person&person_id=${movie.director.person.id}"></c:if> ${movie.director.person.name}</a></span><br>
                            </div>
                            <div class="name">

                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${searchMovie.isEmpty()}">
                    <div>По вашему запросу фильмов не найдено!</div>
                </c:if>
            </div>
        </div>

        <div class="bloc_search_1" id="person" style="padding-top: 10px; margin-top:25px; ">
                <h2>Персоны</h2>
            <div class="person_list">

                <c:if test="${!persons.isEmpty()}">
                <c:forEach var="person" items="${persons}">
                            <div class="person_items">
                                <img src="img/person_img/Person_07.jpg">
                                <div>
                                    <span>Дата рождения:</span><span>${person.birth_date}</span><br>
                                    <span>Дата смерти:</span><span>   
                                      <c:if test="${person.death_date!=null}">
                                            ${person.death_date}
                                        </c:if>
                                        <c:if test="${person.death_date==null}">
                                            -
                                        </c:if>
                                      </span><br>
                                    <span>Страна:</span><span>${person.country}</span><br>
                                    <span>Роль:</span><span>role</span>
                                </div>
                                <br>
                                <div class="name">
                                    <a href=""><text>${person.name}</text> <text>${person.surname}</text></a>
                                </div>
                            </div>
                        </c:forEach>
                </c:if>
                <c:if test="${persons.isEmpty()}">
                    <div>По вашему запросу фильмов не найдено!</div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    if (${movie}) {
        $("#movie").attr({
            hidden: "hidden"
        });
    }
    if (${person}) {
        $("#person").attr({
            hidden: "hidden"
        });
    }

</script>
</body>
</html>
