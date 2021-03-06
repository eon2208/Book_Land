<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 02.07.2020
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order History</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="<c:url value="/resources/js/bookHandling.js"/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<header>
    <jsp:include page="../header/header.jsp"/>
</header>>

<div class="container">
    <h3>Order History</h3>
    <hr>

    <a href="${pageContext.request.contextPath}/user/userDetail" class="btn btn-primary btn-sm mb-3">Back</a><hr>

    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>Order Number</th>
            <th>Order Date</th>
            <th>Order Status</th>
            <th>Value</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${orderHistory}" var="orderHistory">

            <c:url value="/user/historyDetail" var="detailLink">
                <c:param name="orderId" value="${orderHistory.id}"/>
            </c:url>

            <tr>
                <td>${orderHistory.id}</td>
                <td>${orderHistory.date}<br></td>
                <td>
                    <c:choose>
                        <c:when test="${orderHistory.status == 1}">In progress</c:when>
                        <c:when test="${orderHistory.status == 2}">Sent</c:when>
                        <c:when test="${orderHistory.status == 3}">Completed</c:when>
                    </c:choose>
                </td>
                <td>${orderHistory.value}<br></td>
                <td>
                    <a href="${detailLink}" class="btn btn-info btn-sm">Info</a>
                </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
