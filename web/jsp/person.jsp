<%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 22.03.2016
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Person</title>
    <link href="lib/css/bootstrap.min.css" rel="stylesheet">
    <script src="lib/js/jquery-2.2.3.min.js"></script>
    <link href="lib/css/MyStyle.css" rel="stylesheet">
    <link href="lib/css/jquery.bxslider.css" rel="stylesheet"/>
    <script src="lib/js/jquery.bxslider.min.js"></script>
    <meta charset="utf-8">
    <link href="lib/css/bootstrap.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="lib/css/styl_detal_actor.css">

</head>
<body>
<%@ include file="/jsp/jspf/head/logo.jspf" %>


<div class="wepper_main">

    <div class="wepper_body">
        <div class="desc_person">
            <div class="name_person"><h3>${person.name}</h3></div>
            <table width="100%">
                <tr>
                    <td style=" width:  28%;">
                        <div class="desc_person_img">
                            <img src="img/person_img/Person_03.jpg">
                        </div>
                    </td>
                    <td style=" width: 60%; display: block;">
                        <div class="desc_person_inf">
                            <ul>
                                <li>${person.surname}</li>
                                <li>${person.birth_date}</li>
                                <c:if test="val.death_date!=null">
                                    <li>${person.death_date}</li>
                                </c:if>
                                <li>${person.country}</li>
                                <li>Всего фильмов: <c:out value="${countMovie}" default="0"/></li>
                            </ul>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="seperator"><h3>Фото:</h3></div>
        </div>
        <div class="desc_img_person">
            <table>
                <tr>
                    <td>
                        <div class="img_person"><img src="img/person_img/Person_07.jpg"></div>
                    </td>
                    <td>
                        <div class="img_person"><img src="img/person_img/Person_09.jpg"></div>
                    </td>
                    <td>
                        <div class="img_person"><img src="img/person_img/Person_12.jpg"></div>
                    </td>
                    <td>
                        <div class="img_person"><img src="img/person_img/Person_14.jpg"></div>
                    </td>
                    <td>
                        <div class="img_person"><img src="img/person_img/Person_17.jpg"></div>
                    </td>
                </tr>
            </table>
            <div class="seperator"><h3>Лучшие фильмы:</h3></div>
        </div>
        <div class="best_fiml">
            <ol>
                <li><a href="">Name Film</a></li>
                <li><a href="">Name Film</a></li>
                <li><a href="">Name Film</a></li>
                <li><a href="">Name Film</a></li>
                <li><a href="">Name Film</a></li>
            </ol>
        </div>
    </div>
    <%@ include file="/jsp/jspf/footer.jspf" %>

</div>
person:
<article>
    <table border="solid 1px #000">
        <thead>
        <td>Id</td>
        <td>name</td>
        <td>surname</td>
        <td>birth_date</td>
        <c:if test="val.death_date!=null">
            <td>birth_death</td>
        </c:if>
        <td>country</td>
        <td>image_ID</td>
        </thead>
        <tr>
            <td>${person.id}</td>
            <td>${person.name}</td>
            <td>${person.surname}</td>
            <td>${person.birth_date}</td>
            <c:if test="val.death_date!=null">
                <td>${person.death_date}</td>
            </c:if>
            <td>${person.country}</td>
            <td>${person.imageId}</td>
        </tr>

    </table>
</article>
<p>
    сыграл в :<c:out value="${countMovie}" default="0"/> фильмах
</p>


</body>
</html>
