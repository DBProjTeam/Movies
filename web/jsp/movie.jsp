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
    <script src="/lib/js/jquery-2.2.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/lib/css/styl_detail_movei.css">
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
        <%@ include file="/jsp/jspf/movie/desc.jspf" %>
        <c:if test="${not empty user}">
            <form action="do?action=add_favorite_movie" id="inCollaction" method="post">
                <input type="hidden" name="movieId" value="${movie.movieId}"/>

                <script type="text/javascript">
                    if (!${is_in_celection}) {
                        $("#inCollaction").append(' <input class="button_style" type="submit" value="Добавить фильм в коллекцию">');
                    } else {
                        $("#inCollaction").append("<p>Фильм уже в колекции</p>");
                    }
                </script>
            </form>
        </c:if>
        <a href="do?action=all_persons_on_film&movie_id=${movie.movieId}">Посмотреть всех персон фильма</a>

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
        <%@ include file="/jsp/jspf/movie/images.jspf" %>

        <div class="seperator">
            <h3>Отзывы</h3>
        </div>
        <%@ include file="/jsp/jspf/movie/coments_and_mark_bloc.jspf" %>

    </div>

    <%@ include file="/jsp/jspf/footer.jspf" %>
</div>
</body>
</html>
