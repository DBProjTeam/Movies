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
    <script src="/lib/js/jquery-2.2.3.min.js"></script>
    <script src="/lib/js/jquery-ui.js"></script>
    <link href="/lib/css/jquery-ui.css" type="text/css" rel="stylesheet">
    <link href="/lib/css/admin_styl.css" rel="stylesheet">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#tabs").tabs({
                show: function (e, ui) {
                    if (ui.index != 0) {
                        $(ui.panel).html("<img id='load' src='tab-load1.gif' />")
                    }
                }
            });
        });
    </script>
</head>
<body>

<div class="wepper_main">
    <%@include file="/jsp/jspf/head.jspf" %>
    <div class="wepper_body">
        <div class="seperator"><h3></h3></div>
        <div class="content_main">
            <div id="tabs">
                <ul class="menu">
                    <li><a href="do?action=show_persons">Persons</a></li>
                    <li><a href="do?action=show_countries">Countries</a></li>
                    <li><a href="#tabs-3">Коментарии</a></li>
                </ul>
                <div id="tabs-3">Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna,
                    interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.
                </div>
            </div>
        </div>

        <%@include file="/jsp/jspf/footer.jspf" %>
    </div>
</div>


</body>
</html>
