<%--
  Created by IntelliJ IDEA.
  User: Poimanov Pavel
  Date: 24.03.2016
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Movie-<c:out value="${movie.title}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <script src="../../lib/js/jquery-2.2.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../lib/css/styl_detail_movei.css">
    <link rel="shortcut icon" href="../../img/logo.JPG" type="image/jpg">

</head>
<body>
<div class="wepper_main">
    <%@ include file="/jsp/jspf/head.jspf" %>
    <div class="wepper_Head">
        <div class="seperator">
            <h3><c:out value="${movie.title}"/></h3>
        </div>
    </div>
    <div class="wepper_body">
        <div class="detal_movie">

            <div class="img_movie">
                <img src="img_temp/${images.get(0).name}">
            </div>
            <%@ include file="jspf/movie/desc_movie_info.jspf" %>
            <%@ include file="jspf/movie/bloc_rating.jspf" %>
            <a href="/jsp/allperson_on_film.jsp">...</a>
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
        <%@ include file="jspf/movie/images.jspf" %>

        <div class="seperator">
            <h3>Трейлер</h3>
        </div>
        <div class="desc_movie_treuler">

        </div>
        <div class="seperator">
            <h3>Отзывы</h3>
        </div>
        <%@ include file="/jsp/jspf/movie/coments_and_mark_bloc.jspf" %>

    </div>

    <%@ include file="/jsp/jspf/footer.jspf" %>
</div>

</body>
</html>
