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
            <form method="post" id='login'>
                <table>
                    <tr>
                        <td colspan="2"><strong><big>Вход</big></strong></td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Логин:</strong>
                        </td>
                        <td>
                            <input type="text" name="login"/>
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
                        <td colspan="2" style="text-align: center;">
                            <button class="button" type="submit">Войти</button>
                        </td>
                    </tr>
                </table>

            </form>
        </div>
    </div>
</div>

</body>
</html>
