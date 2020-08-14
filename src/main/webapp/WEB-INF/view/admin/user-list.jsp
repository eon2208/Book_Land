<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 03.07.2020
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Users List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="<c:url value="/resources/js/bookHandling.js"/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<header>
    <jsp:include page="../header/header.jsp"/>
</header>

<div class="container">
    <h3>Users :</h3>
    <hr>

    <!-- Add a button-->
    <a href="${pageContext.request.contextPath}/register/showRegistrationForm" class="btn btn-primary btn-sm mb-3">Add
        User</a>
    <hr>
    <a href="${pageContext.request.contextPath}/home/mainPage" class="btn btn-primary btn-sm mb-3">Go Back</a>
    <hr>

    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${userList}" var="user">

            <c:if test="${user.id != 1}">

                <c:url value="/admin/deleteUser" var="deleteLink">
                    <c:param name="userName" value="${user.userName}"/>
                </c:url>

                <c:url value="/admin/showInfo" var="detailLink">
                    <c:param name="userName" value="${user.userName}"/>
                </c:url>

                <tr>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}<br></td>
                    <td>${user.email}<br></td>
                    <td>
                        <a href="${detailLink}" class="btn btn-warning btn-sm">Info</a>
                        <a href="${deleteLink}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </c:if>

        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
