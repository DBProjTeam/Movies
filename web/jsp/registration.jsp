<%--
  Created by Vyacheslav
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../lib/css/styl_login.css">
    <title>Регистрация</title>
</head>

<body>

<div class="wepper_main">
    <div class="wepper_body">
        <div class="form_in">
            <form method="post" action="/do?action=registration">

                <table>
                    <tr>
                        <td colspan="2"><strong><big>Регистрация</big></strong></td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Логин:</strong>
                        </td>
                        <td>
                            <input type="email" name="login"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Имя:</strong>
                        </td>
                        <td>
                            <input type="text" name="name"></input>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Фамилия:</strong>
                        </td>
                        <td>
                            <input type="text" name="surname"></input>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Пароль:</strong>
                        </td>
                        <td>
                            <input type="password" name="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Изображения:</strong>
                        </td>
                        <td>
                            <input type="file" name="imgFile" accept="image/jpeg,image/png,image/gif"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <button class="button_reg" type="submit" name="register">Зарегистрироваться</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>

<%
    if (request.getAttribute("error") != null) {
%>
<%=request.getAttribute("error") %>
<%

    }
%>
</body>
</html>
