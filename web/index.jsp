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
            bild_My();
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
    <script type="text/javascript" src="lib/js/paveljs.js"></script>


</head>
<body>
<div class="wepper_main">
    <%@ include file="/jsp/jspf/head.jspf" %>
    <%@ include file="/jsp/jspf/main.jspf" %>
    <%@ include file="jsp/jspf/footer.jspf" %>
</div>


</body>
</html>
