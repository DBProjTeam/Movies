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
    <title>Movie</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <script src="/lib/js/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src="/lib/js/jquery.fitvids.js"></script>
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
    <%@ include file="/jsp/jspf/head.jspf" %>
    <div class="wepper_Head">
        <div class="seperator">
            <h3><c:out value="${movie.title}"/></h3>
        </div>
    </div>
    <div class="wepper_body">
        <div class="detal_movie">

            <div class="img_movie">
                <img src="img/detal_movie/detal_movie_main.jpg">
            </div>
            <%@ include file="jspf/movie/desc_movie_info.jspf" %>
            <%@ include file="jspf/movie/bloc_rating.jspf" %>
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
        <div class="seperator">
            <h3>Отзывы</h3>
        </div>
        <%@ include file="/jsp/jspf/movie/coments_and_mark_bloc.jspf" %>

    </div>
</div>

<%@ include file="/jsp/jspf/footer.jspf" %>
</body>
</html>
