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
    <title>Результаты поиска</title>
</head>
<body>
<div class="wepper_main">
    <div class="wepper_head">

        <%@include file="/jsp/jspf/head.jspf" %>
        >
        <div class="discription">
            <span class="titel">Результат поиска</span>
        </div>

    </div>
    <div class="wepper_body">
        <div class="bloc_search_2">
            <h2>Фильмы</h2>
            <div class="list_film">
                <c:if test="${searchMovie!=null}">
                    <c:forEach var="movie" items="${searchMovie}">
                        <div class="items">
                            <%--Здесь постер фильма--%>
                            <img src="img/small_baner_film/${movie.image_id}.png">
                            <div>
                                <span>Год:</span><span>${movie.year}</span><br>
                                <span>Время:</span><span>${movie.runtime}</span><br>
                                <span>Релиз:</span><span>${movie.releaseDate}</span><br>
                                <span>Стнара:</span><span>country</span><br>
                                <span>Режесер:</span><span>bos</span><br>
                            </div>
                            <div class="name">
                                <a href="#">${movie.title}</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${searchMovie==null}">
                    <div>По вашему запросу фильмов не найдено!</div>
                </c:if>
            </div>
        </div>
        <div class="bloc_search_1" style="padding-top: 10px; margin-top:25px; ">
                <h2>Персоны</h2>
            <%--    <div class="person_list">
                    <c:if test="${searchPerson!=null}">
                        <c:forEach var="person" items="searchPerson">
                            <div class="person_items">
                                <img src="img/person_img/Person_07.jpg">
                                <div>
                                    <span>Дата рождения:</span><span>${person}</span><br>
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
                    <c:if test="${searchPerson==null}">
                        <div style="padding-bottom: 10px;">По вашему запросу персон не найдено!</div>
                    </c:if>
                </div>
        --%></div>
    </div>
</body>
</html>
