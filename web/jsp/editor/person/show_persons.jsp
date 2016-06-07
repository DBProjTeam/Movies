<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15.05.2016
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div>
    <div class="table">
        <table>
            <c:forEach var="p" items="${persons}">
                <tr>
                    <td>${p.name}</td>
                    <td>${p.surname} </td>
                    <td>
                        <div id='datepicker${p.id}'/>
                            ${p.birth_date}</td>
                    <script type="text/javascript">
                        var pid = new Date(${p.birth_date});
                        $("#datepicker${p.id}").datepicker({dateFormat: 'yy-mm-dd', defaultDate: pid});

                    </script>
                    <td>${p.death_date}</td>
                    <td> ${p.country}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
