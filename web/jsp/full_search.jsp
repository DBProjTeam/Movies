<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 31.05.2016
  Time: 2:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Расширеный поиск</title>
    <%-- <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
     <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
 --%>
    <link href="/lib/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <link href="../lib/css/styl_detail_movei.css" type="text/css" rel="stylesheet">
    <script src="/lib/js/jquery-2.2.3.min.js"></script>
    <script src="/lib/js/jquery-ui.min.js"></script>

    <link rel="stylesheet" type="text/css" href="../lib/css/style_search.css">
    <link type="text/css" rel="stylesheet" href="../lib/css/MyStyle.css">
    <link rel="shortcut icon" href="img/logo.JPG" type="image/jpg">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#search").keyup(function () {
                var title = $("#search").val();
                $.ajax({
                    type: 'GET',
                    data: {title: title},
                    url: 'ServletAjax',
                    success: function (data) {
                        console.log(data);
                        $("#search").autocomplete({
                            minLength: 0,
                            source: data,
                            select: function (event, ui) {
                                location.href = "do?action=movie&movie_id=" + ui.item.movieId;
                            }
                        });
                    }
                });
            });
        });
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<div class="wepper_main">
    <div class="wepper_head">
        <div class="seperator">
            <h3><big>F</big>ilms<big>S</big>earch</h3>
        </div>
        <div class="discription">
            <span class="titel">Расширенный поиск</span><br>
            <span>Поиск фильмов,актеров...</span>
        </div>
    </div>
    <div class="wepper_body">
        <div class="bloc_search_1">
            </form>
            <form method="get" id="res" accept-charset="utf-8" name="to_search">
                <span><h2>Искать фильм:</h2></span><br>
                <input hidden="hidden" value="search" name="action">
                <div class="head_bloc_1">
                    <div>
                        <input id="search" name="title" type="text"/>
                        <text>Полное или частичное названия фильма</text>
                    </div>
                    <div>
                        <text style="font-size: 1.3em;">Год c</text>
                        <div style=" width: 35%; display: inline-block; position: relative;">
                            <input style="width: 100%; height: 35px;" id="to_year" name="to" min="${min_year}"
                                   max="${max_year}"
                                   type="number">
                        </div>
                        <text style="font-size: 1.3em; float: right; padding-right:5px; "> по</text>
                        <div style="width: 35%; display: inline-block; position: relative; float: right;">
                            <input style="width: 100%; height: 35px;" id="from_year" name="from" min="${min_year}"
                                   max="${max_year}" type="number">
                            <input id="spinner" class="ui-spinner-input">
                        </div>
                        <script src="/lib/js/scripts_change_year.js" type="application/javascript"></script>
                    </div>
                </div>
                <div class="main_bloc_1">
                    <div>
                        <span style="padding-right: 25px;">Страна: </span>
                        <select name="country">
                            <option selected>Пусто</option>
                            <c:forEach var="count" items="${countries}">
                                <option>${count.country}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div style="padding-top: 20px;">
                        <span style="padding-right: 35px;">Жанр:</span>
                        <select name="genre">
                            <option selected>Пусто</option>
                            <c:forEach items="${genres}" var="genr">
                                <option>${genr.genre}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div style="padding-top: 20px;">
                        <span style="padding-right: 24px;">Студия: </span>
                        <select name="studio">
                            <option selected>Пусто</option>
                            <c:forEach items="${studios}" var="stud">
                                <option value="${stud.id}">${stud.name}</option>
                            </c:forEach>
                        </select>
                        <button style="margin-left: 41%;" class="coment_button" type="submit">
                            Найти
                        </button>
                    </div>
                </div>
        </form>
        </div>
        <div class="bloc_search_2">
            <span>
                <h2>Искать фильмы по участникам:</h2>
            </span><br>

            <form action="do?" method="get">
                <input name="action" hidden="hidden" value="psearch">

                <div style="width: 100%;">
                    <div style="width: 29%;display: inline-block; position: relative;">
                        <select style="width: 95%;" name="role">
                            <option selected>Пусто</option>
                            <c:forEach var="rol" items="${roles}">

                            <option>${rol.role}</option>
                            </c:forEach>
                        </select>
                        <span>Роль</span>
                    </div>
                    <div style="width: 49%;display: inline-block; position: relative;">
                        <input type="text" name="name">
                        <span>Имя или фамилия  участника</span>
                    </div>
                    <div style="width: 18%;padding-left:1.3em; padding-bottom: 1em; vertical-align: bottom;  display: inline-block; position: relative;">
                        <button type="submit" class="coment_button">Найти</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
    <%@include file="/jsp/jspf/footer.jspf" %>
</div>
</body>
</html>
