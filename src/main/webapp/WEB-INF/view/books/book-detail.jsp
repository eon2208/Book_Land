<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 02.06.2020
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Land</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="<c:url value="/resources/js/bookHandling.js"/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/bookHandling.js"></script>

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

<div class="col-lg-9">

    <div class="panel panel-heading"><h2>Book Details :</h2></div>
    <div class="panel panel-body">
        <img class="card-img-top img-fluid" src="${book.imageUrl}" alt="bookCover">
        <div class="card-body">
            <h3 class="card-title">${book.title}</h3>
            <b>${book.authors}</b>
            <h4>$${book.price}</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente dicta fugit fugiat
                hic aliquam itaque facere, soluta. Totam id dolores, sint aperiam sequi pariatur praesentium animi
                perspiciatis molestias iure, ducimus!</p>
            <b>Rating :</b> ${book.avarageRating}
        </div>
    </div>


    <security:authorize access="hasAnyRole('ADMIN','USER')">
        <form:form action="${pageContext.request.contextPath}/cart/addToCart" method="get">
            <label for="quantity">Quantity :</label>
            <input type="number" id="quantity" name="quantity" min="1" value="1"/>
            <input type="hidden" value="${book.id}" name="bookId">
            <input type="submit" value="Add To Cart" class="add-button">
        </form:form>
    </security:authorize>
    <br>
    <a href="${pageContext.request.contextPath}/home/mainPage" role="button" class="btn btn-info">Back</a>

</div>

</body>
</html>
