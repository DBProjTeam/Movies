<%--
  Created by IntelliJ IDEA.

  Date: 22.03.2016
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Person-${person.name}</title>
    <link href="lib/css/bootstrap.min.css" rel="stylesheet">
    <script src="lib/js/jquery-2.2.3.min.js"></script>
    <link href="lib/css/MyStyle.css" rel="stylesheet">
    <link href="lib/css/jquery.bxslider.css" rel="stylesheet"/>
    <script src="lib/js/jquery.bxslider.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../lib/css/styl_detal_actor.css">

</head>
<body>
<div class="wepper_main">
    <%@ include file="/jsp/jspf/head.jspf" %>
    <%@ include file="/jsp/jspf/person/descrip.jspf" %>
    <div class="seperator"><h3>Фото:</h3></div>
    <%@ include file="/jsp/jspf/person/images.jspf" %>
    <div class="seperator"><h3>Все фильмы:</h3></div>
    <%@ include file="/jsp/jspf/person/films.jspf" %>
</div>


</body>
</html>
