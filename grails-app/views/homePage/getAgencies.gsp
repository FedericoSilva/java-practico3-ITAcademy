<%--
  Created by IntelliJ IDEA.
  User: fedsilva
  Date: 2019-04-26
  Time: 13:33
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Agencias recomendadas</title>
</head>

<body>
    <g:each in="${agencies}" var="r">
         <th>
        <td class="list-group-item"  id="${r.id}">${r.name}</td>
        </th>
    </g:each>
</body>
</html>