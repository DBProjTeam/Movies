<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15.05.2016
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Panel</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="../lib/css/admin_styl.css">
</head>
<body>
<div class="wepper_main">
    <%@include file="/jsp/jspf/head.jspf" %>
    <div class="wepper_body">
        <div class="left_nav">
            <div>
                <ul class="menu">
                    <li><a href="do?action=show_persons">Персоны</a>
                    </li>
                    <li><a href="do?action=show_movies">Фильм</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="content_main">
            <c:if test="${persons!=null}">
                <div class="in_context" style="padding: 2px;">
                    <div class="link"><a href="">Главная</a>»<a href="#">Панель управления</a>»<a href="">Персоны</a><a
                            href="">Добавить материал</a></div>
                    <hr style="width: 100%;">
                    <%@include file="/jsp/editor/person/show_persons.jspf" %>
                    <div class="pagination">
                        <a href="">Назад</a>
                        <a href="">1</a>
                        <a href="">Вперед</a>
                    </div>
                </div>

            </c:if>
            <c:if test="${movies!=null}">

                <div class="in_context" style="padding: 2px;">
                    <div class="link"><a href="">Главная</a>»<a href="#">Панель управления</a>»<a href="">Фильмы</a><a
                            href="">Добавить материал</a></div>
                    <hr style="width: 100%;">

                    <%@include file="/jsp/editor/movies/show_movies.jspf" %>

                </div>
            </c:if>
        </div>
        <%@include file="/jsp/jspf/footer.jspf" %>
    </div>
</div>


</body>
</html>
