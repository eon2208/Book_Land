<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 03.07.2020
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
          crossorigin="anonymous">
</head>
<body>

<div class="container">
    <h3>Users :</h3>
    <hr>

    <!-- Add a button-->
    <a href="${pageContext.request.contextPath}/register/showRegistrationForm" class="btn btn-primary btn-sm mb-3">Add User</a><hr>
    <a href="${pageContext.request.contextPath}/home/mainPage" class="btn btn-primary btn-sm mb-3">Go Back</a><hr>

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
        <c:forEach items="${userList}" var="orderList">

            <c:url value="/admin/deleteUser" var="deleteLink">
                <c:param name="userName" value="${orderList.userName}"/>
            </c:url>

            <c:url value="/admin/listOrders" var="ordersLink">
                <c:param name="userName" value="${orderList.userName}"/>
            </c:url>

            <c:url value="/admin/showInfo" var="detailLink">
                <c:param name="userName" value="${orderList.userName}"/>
            </c:url>

        <tr>
            <td>${orderList.firstName}</td>
            <td>${orderList.lastName}<br></td>
            <td>${orderList.email}<br></td>
            <td>
                <a href="${ordersLink}" class="btn btn-info btn-sm">Orders</a>
                <a href="${detailLink}" class="btn btn-warning btn-sm">Info</a>
                <a href="${deleteLink}" class="btn btn-danger btn-sm">Delete</a>
            </td>
        </tr>

        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
