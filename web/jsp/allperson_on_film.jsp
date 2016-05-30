<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.

  Time: 5:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Все участвующие в фильме </title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/lib/css/person_style.css">
    <link rel="shortcut icon" href="img/logo.JPG" type="image/jpg">

</head>
<body>
<c:import url="/jsp/jspf/head.jspf"/>
<div class="wepper_body">
    <div class="seperator"><h3>Все персоны фильма</h3></div>
    <div class="list">
        <div class="items">
            <img src="img/person_img/person_03.jpg">
            <a href="#">Name</a><br>
            <a>Дата рождения: <span>date</span></a><br>
            <a>тип кто он: <span>date</span></a>
        </div>
        <div class="items">
            <img src="img/person_img/person_03.jpg">
            <a href="#">Name</a><br>
            <a>Дата рождения: <span>date</span></a><br>
            <a>тип кто он: <span>date</span></a>
        </div>
    </div>
    <div style="margin-top:20px; " class="seperator"></div>
</div>


</body>
</html>
