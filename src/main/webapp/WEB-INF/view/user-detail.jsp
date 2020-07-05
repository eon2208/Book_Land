<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 26.05.2020
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:if test="${user.address.id != 1}">
<table>
    <th>Name : </th>
    <th>Last Name : </th>
    <th>Phone Number : </th>
    <th>Email : </th>
    <th>Country : </th>

    <tr>
    <td>${user.firstName}</td>
    <td>${user.lastName}</td>
    <td>${user.address.phone}</td>
    <td>${user.email}</td>
    <td>${user.address.country}</td>
    </tr>

</table>
</c:if>


<a href="${pageContext.request.contextPath}/User/showUserInfoForm">User Info</a>
<br>
<a href="${pageContext.request.contextPath}/home/mainPage">Back</a>
<br>
<a href="${pageContext.request.contextPath}/User/showHistory">Order history</a>


</body>
</html>
