<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
    <title>User Details</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/site.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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
    <div class="panel panel-default">
        <div class="panel-heading"><h4>User Profile</h4></div>
        <div class="panel-body">

            <div class="col-sm-5 col-xs-6 tital ">User Name :</div>
            <div class="col-sm-7">${user.userName}</div>
            <div class="clearfix"></div>
            <div class="bot-border"></div>

            <div class="col-sm-5 col-xs-6 tital ">First Name:</div>
            <div class="col-sm-7 col-xs-6 ">${user.firstName}</div>
            <div class="clearfix"></div>
            <div class="bot-border"></div>

            <div class="col-sm-5 col-xs-6 tital ">Last Name:</div>
            <div class="col-sm-7">${user.lastName}</div>
            <div class="clearfix"></div>
            <div class="bot-border"></div>

            <div class="col-sm-5 col-xs-6 tital ">Email :</div>
            <div class="col-sm-7">${user.email}</div>
            <div class="clearfix"></div>
            <div class="bot-border"></div>


            <c:if test="${user.address.id != 1}">

                <div class="col-sm-5 col-xs-6 tital ">Country :</div>
                <div class="col-sm-7">${user.address.country}</div>
                <div class="clearfix"></div>
                <div class="bot-border"></div>

                <div class="col-sm-5 col-xs-6 tital ">City :</div>
                <div class="col-sm-7">${user.address.city}</div>
                <div class="clearfix"></div>
                <div class="bot-border"></div>

                <div class="col-sm-5 col-xs-6 tital ">Street:</div>
                <div class="col-sm-7">${user.address.street}</div>
                <div class="clearfix"></div>
                <div class="bot-border"></div>

                <div class="col-sm-5 col-xs-6 tital ">Postal Code:</div>
                <div class="col-sm-7">${user.address.postalCode}</div>
                <div class="clearfix"></div>
                <div class="bot-border"></div>

                <div class="col-sm-5 col-xs-6 tital ">Phone No:</div>
                <div class="col-sm-7">${user.address.phone}</div>
                <br>

            </c:if>
            <hr>

            <a href="${pageContext.request.contextPath}/user/showUserInfoForm" role="button"
                   class="btn btn-info col-lg-2">Edit Info</a><br>
            <hr>
            <a href="${pageContext.request.contextPath}/user/showHistory" role="button" class="btn btn-info col-lg-2">Order
                history</a><br>
            <hr>
            <a href="${pageContext.request.contextPath}/home/mainPage" role="button"
            class="btn btn-info col-lg-2">Back</a><br>

        </div>
    </div>
</div>

</body>
</html>
