<%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 27.03.2016
  Time: 3:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="lib/css/styl_login.css">
    <title></title>
</head>
<body>

<div class="wepper_main">
    <div class="wepper_body">
        <div class="form_in">
            <form method="post" action="">
                <table>
                    <tr>
                        <td colspan="2"><strong><big>Вход</big></strong></td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Логин:</strong>
                        </td>
                        <td>
                            <input type="email"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Пароль:</strong>
                        </td>
                        <td>
                            <input type="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <button class="button" type="submit" name="login">Войти</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<form id="login" method="post">
    <input type="submit" value="go">
    <input type="text" name="login">
    <input type="password" name="password">
</form>
</body>
</html>
