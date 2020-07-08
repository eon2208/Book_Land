<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 02.07.2020
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Info</title>
</head>
<body>
<c:forEach var="info" items="${orderedBooks}">

    ${info.books.title}<br>
    ${info.quantity}<br>
    ${info.books.price*info.quantity}<br><br><br>

</c:forEach>

</body>
</html>
