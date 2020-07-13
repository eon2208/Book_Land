<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 30.06.2020
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Form</title>

    <style>
        .error {
            color: red
        }
    </style>

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


    <div class="panel panel-default">

        <c:url value="/user/saveUserInfoForm" var="saveLink"/>

        <security:authorize access="hasRole('ADMIN')">
            <c:url value="/admin/saveUser" var="saveLink"/>
        </security:authorize>

        <div class="panel-heading">
            <div class="panel-title">User Info :</div>
        </div>

        <div style="padding-top: 30px" class="panel-body">

            <!-- Order Form -->
            <form:form action="${saveLink}" modelAttribute="userInfoForm" method="post">

                <%-- Needed to get object from admin controller --%>
                <input type="hidden" name="userName" value="${user.userName}">

                <!-- Grid row -->
                <div class="form-row">

                    <!-- First Name -->
                    <div class="form-group col-md-6">
                        <label for="firstName">First Name</label>
                        <form:input path="firstName" type="text" class="form-control" id="firstName"
                                    placeholder="First Name(*)"/>
                        <form:errors path="firstName" cssClass="error"/>
                    </div>

                    <!-- Last Name -->
                    <div class="form-group col-md-6">
                        <label for="lastName">Last Name</label>
                        <form:input path="lastName" type="text" class="form-control" id="lastName"
                                    placeholder="Last Name(*)"/>
                        <form:errors path="lastName" cssClass="error"/>
                    </div>
                </div>

                <div class="form-row">
                    <!-- Email -->
                    <div class="form-group col-md-6">
                        <label for="email">Email</label>
                        <form:input path="email" type="email" class="form-control" id="email" placeholder="Email(*)"/>
                        <form:errors path="email" cssClass="error"/>
                    </div>

                    <!-- Phone -->
                    <div class="form-group col-md-6">
                        <label for="phone">Phone</label>
                        <form:input path="phone" type="tel" class="form-control" id="phone"
                                    placeholder="Phone Number(*)"/>
                        <form:errors path="phone" cssClass="error"/>
                    </div>
                </div>
                <!-- Grid row -->

                <!-- Default input -->
                <div class="form-group">
                    <label for="country">Country</label>
                    <form:input path="country" type="text" class="form-control" id="country" placeholder="Poland(*)"/>
                    <form:errors path="country" cssClass="error"/>
                </div>
                <!-- Default input -->
                <div class="form-group">
                    <label for="city">City</label>
                    <form:input path="city" type="text" class="form-control" id="city" placeholder="City(*)"/>
                    <form:errors path="city" cssClass="error"/>
                </div>
                <!-- Grid row -->
                <div class="form-row">
                    <!-- Default input -->
                    <div class="form-group col-md-6">
                        <label for="street">Street</label>
                        <form:input path="street" type="text" class="form-control" id="street"
                                    placeholder="New York City"/>
                        <form:errors path="street" cssClass="error"/>
                    </div>
                    <!-- Default input -->
                    <div class="form-group col-md-6">
                        <label for="inputZip">Zip</label>
                        <form:input path="postalCode" type="text" class="form-control" id="inputZip"
                                    placeholder="11206-1117"/>
                        <form:errors path="postalCode" cssClass="error"/>
                    </div>
                </div>
                <!-- Grid row -->
                <button type="submit" class="btn btn-primary btn-md">save</button>

                <hr>

                <security:authorize access="hasRole('USER')">
                    <a href="${pageContext.request.contextPath}/home/mainPage" role="button"
                       class="btn btn-warning btn-md">Back</a>

                    <a href="${pageContext.request.contextPath}/cart/" role="button"
                       class="btn btn-primary btn-md">Cart</a>
                </security:authorize>

                <security:authorize access="hasRole('ADMIN')">
                    <a href="${pageContext.request.contextPath}/admin/list" role="button"
                       class="btn btn-primary btn-md">Back</a>
                </security:authorize>


            </form:form>

        </div>

    </div>

</div>

</body>
</html>
