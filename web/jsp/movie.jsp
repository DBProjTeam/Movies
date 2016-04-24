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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <script src="/lib/js/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src=/"lib/js/jquery.fitvids.js"></script>
    <link rel="stylesheet" type="text/css" href="lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/styl_detail_movei.css">
    <link href="lib/css/jquery.bxslider.css" rel="stylesheet"/>
    <script src="lib/js/jquery.bxslider.min.js"></script>
    <script type="text/javascript">
        $('.bxslider').bxSlider({
            video: true,
            useCSS: false
        });
    </script>
</head>
<body>
<div class="wepper_main">
    <%@ include file="/jsp/jspf/head/logo.jspf" %>
    <div class="wepper_body">
        <div class="detal_movie">

            <div class="img_movie">
                <img src="img/detal_movie/detal_movie_main.jpg">
            </div>

            <div class="desc_movie_info">
                <div class="desc_static">
                    <ul>
                        <li>Год</li>
                        <li>Страна</li>
                        <li>Режессер</li>
                        <li>Сценарий</li>
                        <li>Продюсер</li>
                        <li>Оператор</li>
                        <li>Жанр</li>
                        <li>Премьера</li>
                        <li>Возраст</li>
                        <li>Время</li>
                    </ul>
                </div>
                <div class="desc_dinamic">
                    <ul>
                        <li><c:out value="${movie.year}" default=" "/></li>
                        <li><c:out value="${country.country.country}" default=" "/></li>
                        <c:if test="${director.size()!=0}">
                            <li><c:out value="${director.get(0).person.name}" default=" "/></li>
                        </c:if>
                        <c:if test="${composer.size()!=0}">
                            <li><c:out value="${composer.get(0).person.name}" default=" "/></li>
                        </c:if>
                        <c:if test="${producer.size()!=0}">
                            <li><c:out value="${producer.get(0).person.name}" default=" "/></li>

                        </c:if>
                        <c:if test="${oper.size()!=0}">
                            <li><c:out value="${oper.get(0).person.name}" default=" "/></li>
                            <li>asd</li>
                        </c:if>
                        <li><c:out value="${movie.releaseDate}" default=" "/></li>
                        <li>asd</li>
                        <li><c:out value="${movie.runtime}" default=" "/></li>
                    </ul>
                </div>
            </div>

        </div>
        <div class="seperator">
            <h3>В кратце о фильме</h3>
        </div>
        <div class="desc_movie">
            <strong>
                ${movie.description}
            </strong>
        </div>
        <div class="seperator">
            <h3>Изображения</h3>
        </div>
        <div class="desc_movie_img">
            <table>
                <tr>
                    <td>
                        <div class="desc_img">
                            <img src="img/detal_movie/detal_movie_02.jpg">
                        </div>
                    </td>
                    <td>
                        <div class="desc_img">
                            <img src="img/detal_movie/detal_movie_01.jpg">
                        </div>
                    </td>
                    <td>
                        <div class="desc_img">
                            <img src="img/detal_movie/detal_movie_03.jpg">
                        </div>
                    </td>
                    <td>
                        <div class="desc_img">
                            <img src="img/detal_movie/detal_movie_04.jpg">
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="seperator">
            <h3>Трейлер</h3>
        </div>
        <div class="desc_movie_treuler">

        </div>

    </div>
</div>

<article align="center">
    Movie:
    <table border="solid 1px #000">
        <thead>
        <td>Id</td>
        <td>runtmie</td>
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
    ${param.id}
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
