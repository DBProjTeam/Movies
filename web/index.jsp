<%--
  Created by IntelliJ IDEA.
  User: Павел
  Date: 06.03.2016
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/img/ico.png">
    <link href="lib/css/bootstrap.min.css" rel="stylesheet">
    <script src="lib/js/jquery-2.2.3.min.js"></script>
    <link href="lib/css/MyStyle.css" rel="stylesheet">
    <link href="lib/css/jquery.bxslider.css" rel="stylesheet"/>
    <script src="lib/js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="lib/js/MyPlusBxslider.js"></script>
    <script type="application/javascript">
        $(document).ready(function () {
            var mas_url_img_head = [
                <c:forEach var="img"  varStatus="stat"   items="${movie.images}">
                "/img_temp/${img.name}"<c:if test="${stat.end!=stat.index}">, </c:if>
                </c:forEach>
            ];
            //console.log(mas_url_img_head);
            var mas_url_img_prem = {
                'Name_Film': 'img/small_baner_film/small-baner-film_02.png',
                'Name_Film_3': 'img/small_baner_film/small-baner-film_03.png',
                'Name_Film_4': 'img/small_baner_film/small-baner-film_04.png',
                'Name_Film_5': 'img/small_baner_film/small-baner-film_05.png',
                'Name_Film_6': 'img/small_baner_film/small-baner-film_06.png',
                'Name_Film_7': 'img/small_baner_film/small-baner-film_07.jpg'
            };
            for (var i = 0; i < mas_url_img_head.length; i++) {
                $('.bxslider').append('<li><img src="' + mas_url_img_head[i] + '" /></li>');
            }
            /* for (var i = 0; i < mas_url_img_head.length; i++) {
             $('#bx-pager').append('<a data-slide-index="' + i + '" href=""><img class="Mybaner" src="' + mas_url_img_head[i] + '" /></a>');
             }*/
            for (var i in mas_url_img_prem) {
                $('.bxslider_2').append('<li><img  src="' + mas_url_img_prem[i] + '"/><div id="neme_film_smal_baner"><a href="#">' + i + '</a></div></li>');
            }
            $('.bxslider').bxSlider({
                pagerCustom: '#bx-pager',
                auto: true,
                slideMargin: 5
            });
            $('.bxslider_2').bxSlider({
                minSlides: 3,
                maxSlides: 5,
                slideWidth: 190,
                auto: true
            });

        });

    </script>
    <title>FilmSearch.ua</title>
    <link rel="shortcut icon" href="img/logo.JPG" type="image/jpg">

</head>
<body>
<div class="wepper_main">
    <%@ include file="/jsp/jspf/head.jspf" %>
    <%@ include file="/jsp/jspf/index/main.jspf" %>
    <%@ include file="/jsp/jspf/footer.jspf" %>
</div>
</body>
</html>
