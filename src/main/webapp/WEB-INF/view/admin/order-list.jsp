<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 08.07.2020
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Orders List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="<c:url value="/resources/js/bookHandling.js"/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>

<header>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/home/mainPage">BookLand</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">

                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/home/mainPage">Home</a></li>
                    <security:authorize access="hasRole('ADMIN')">
                        <li><a href="${pageContext.request.contextPath}/admin/orders">Orders</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/list">Users</a></li>
                    </security:authorize>
                </ul>

                <ul class="nav navbar-nav navbar-right">

                    <security:authorize access="hasRole('USER')">
                        <li><a href="${pageContext.request.contextPath}/user/userDetail"><span
                                class="glyphicon glyphicon-user"></span> Your Account</a></li>
                        <li><a href="${pageContext.request.contextPath}/cart/"><span
                                class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
                    </security:authorize>

                    <security:authorize access="!hasAnyRole('USER', 'ADMIN')">
                        <li><a href="${pageContext.request.contextPath}/login/showMyLoginPage"><span
                                class="glyphicon glyphicon-user"></span> Login</a></li>
                    </security:authorize>

                    <security:authorize access="hasAnyRole('USER', 'ADMIN')">
                        <li>
                            <form:form action="${pageContext.request.contextPath}/logout" method="post">
                                <input type="submit" value="Logout"/>
                            </form:form>
                        </li>
                    </security:authorize>

                </ul>
            </div>
        </div>
    </nav>
</header>

<div class="container">

    <h3>Orders :</h3>
    <hr>

    <!-- Add a button-->
    <a href="${pageContext.request.contextPath}/home/mainPage" class="btn btn-primary btn-sm mb-3">Go Back</a>
    <hr>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>User Detail</th>
            <th>Order Date</th>
            <th>Value</th>
            <th>Status</th>
            <th>More</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${orderList}" var="orderDetail">

            <c:url value="/user/historyDetail" var="detailLink">
                <c:param name="orderId" value="${orderDetail.id}"/>
            </c:url>

            <tr>
                <td>
                    <p> First Name : ${orderDetail.user.firstName}<br></p>
                    <p> Last Name : ${orderDetail.user.lastName}<br></p>
                    <p> Email : ${orderDetail.user.email}<br></p>
                    <p> Phone Number :${orderDetail.user.address.phone}<br></p>
                </td>
                <td>${orderDetail.date}<br></td>
                <td>${orderDetail.value}<br></td>
                <td>
                        ${orderDetail.status}
                    <form:form action="${pageContext.request.contextPath}/admin/editStatus" method="get">
                        <input type="hidden" value="${orderDetail.id}" name="orderId">
                        <label for="orderStatus">Change Status :</label>
                        <select name="orderStatus" id="orderStatus">
                            <option value="1">In Progress</option>
                            <option value="2">In delivery</option>
                            <option value="3">Completed</option>
                        </select>
                        <input type="submit"/>
                    </form:form>
                    <br>
                </td>
                <td><a href="${detailLink}" role="button" class="btn btn-info">Order Details</a></td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
