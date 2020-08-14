<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 26.05.2020
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
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
    <jsp:include page="../header/header.jsp"/>
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
