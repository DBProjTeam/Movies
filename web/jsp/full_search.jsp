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
    <script src="/lib/js/jquery-2.2.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="lib/css/style_search.css">
    <link rel="shortcut icon" href="img/logo.JPG" type="image/jpg">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<div class="wepper_main">
    <div class="wepper_head">
        <div class="seperator">
            <h3><big>F</big>ilms<big>S</big>earch.ua</h3>
        </div>
        <div class="discription">
            <span class="titel">Расширенный поиск</span><br>
            <span>Поиск фильмов,актеров...</span>
        </div>
    </div>
    <div class="wepper_body">
        <div class="bloc_search_1">
            <form method="get" accept-charset="utf-8">
                <span><h2>Искать фильм:</h2></span><br>
                <input hidden="hidden" formenctype="application/x-www-form-urlencoded" value="search" name="action">
                <div class="head_bloc_1">
                    <div>
                        <input type="text" name="title">
                        <text>Полное или частичное названия фильма</text>
                    </div>
                    <div>
                        <text style="font-size: 1.3em;">Год c</text>
                        <div style=" width: 35%; display: inline-block; position: relative;">
                            <input style="width: 100%; height: 35px;" id="to_year" min="${min_year}" max="${max_year}"
                                   type="number">
                        </div>
                        <text style="font-size: 1.3em; float: right; padding-right:5px; "> по</text>
                        <div style="width: 35%; display: inline-block; position: relative; float: right;">
                            <input style="width: 100%; height: 35px;" id="from_year" min="${min_year}" max="${max_year}"
                                   type="number">
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
                                <option>${stud.name}</option>
                            </c:forEach>
                        </select>
                        <button style="margin-left: 36.5%; background-color:  #8dacc2;" class="mybuton" type="submit">
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

            <form>
                <div style="width: 100%;">
                    <div style="width: 29%;display: inline-block; position: relative;">
                        <select style="width: 95%;">
                            <c:forEach var="rol" items="${roles}">
                                <option>${rol.role}</option>
                            </c:forEach>
                        </select>
                        <span>Роль</span>
                    </div>
                    <div style="width: 49%;display: inline-block; position: relative;">
                        <input type="text">
                        <span>Имя или фамилия  участника</span>
                    </div>
                    <div style="width: 18%;padding-left:1.3em; padding-bottom: 1em; vertical-align: bottom;  display: inline-block; position: relative;">
                        <button type="submit" class="mybuton">Найти</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
    <%@include file="/jsp/jspf/footer.jspf" %>
</div>
</body>
</html>
