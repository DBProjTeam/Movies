<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15.05.2016
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

    $("#but").button({icons: {primary: "ui-icon-plusthick"}, text: true});
    $("#but").click(function () {
        $("#new-counrty").submit();
    })

</script>
<div class="table">
    <c:forEach var="c" varStatus="s" items="${countries}">
        <div class="table-row-cell">
            <div>${c.country}
            </div>
        </div>
    </c:forEach>
    <form method="post" id="new-counrty" action="do?action=add_country"></form>
    <input type="text" form="new-counrty" name="country"/>
    <button form="new-counrty" id="but">Добавить новую</button>
</div>