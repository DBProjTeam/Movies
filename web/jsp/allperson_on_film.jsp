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
    <link rel="stylesheet" type="text/css" href="../lib/css/person_style.css">
    <link rel="shortcut icon" href="img/logo.JPG" type="image/jpg">

</head>
<body>
<div class="wepper_main">
    <c:import url="/jsp/jspf/head.jspf"/>
    <div class="wepper_body">
        <div class="seperator"><h3>Все персоны фильма</h3></div>
        <div class="list">
           <c:import url="jspf/person/items_from_allperson_on_film.jspf"></c:import>
        </div>
        <div style="margin-top:20px; " class="seperator"></div>
    </div>
</div>


</body>
</html>
