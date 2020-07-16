<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 02.07.2020
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Info</title>
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
                        <li><a href="#">
                            <form:form action="${pageContext.request.contextPath}/logout" method="post">
                                <input type="submit" value="Logout"/>
                            </form:form>
                        </a></li>
                    </security:authorize>

                </ul>
            </div>
        </div>
    </nav>
</header>

<div class="container">
    <div class="row justify-content-md-center">

        <div class="col col-lg-4">

                <h3>User Info</h3>
                <hr>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        Order Address
                    </div>
                    <div class="panel-body">

                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">First Name : ${orderedBooks.get(0).order.user.firstName}</li>
                            <li class="list-group-item">Last Name : ${orderedBooks.get(0).order.user.lastName}</li>
                            <li class="list-group-item">Email : ${orderedBooks.get(0).order.user.email}</li>
                            <li class="list-group-item">Phone : ${orderedBooks.get(0).order.user.address.phone}</li>
                            <li class="list-group-item">Country : ${orderedBooks.get(0).order.user.address.country}</li>
                            <li class="list-group-item">City : ${orderedBooks.get(0).order.user.address.city}</li>
                            <li class="list-group-item">Street : ${orderedBooks.get(0).order.user.address.street}</li>
                            <li class="list-group-item">Postal Code : ${orderedBooks.get(0).order.user.address.postalCode}</li>
                        </ul>

                    </div>
                </div>
            </div>

            <div class="col col-lg-8">
                <h3>Order Details</h3>
                <hr>

                <table class="table table-bordered table-striped">
                    <thead class="thead-dark">
                    <tr>
                        <th>Title</th>
                        <th>Quantity</th>
                        <th>Cost</th>
                        <th>Cover</th>
                    </tr>
                    </thead>

                    <tbody>

                    <c:forEach var="order" items="${orderedBooks}">

                        <c:url var="detailLink" value="/home/details">
                            <c:param name="bookId" value="${order.books.id}"/>
                        </c:url>

                            <tr>
                                <td><a href="${detailLink}">${order.books.title}</a></td>
                                <td>${order.quantity}<br></td>
                                <td>${order.books.price * order.quantity}<br></td>
                                <td><img src="${order.books.imageUrl}" alt="book cover"><br></td>
                            </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>
