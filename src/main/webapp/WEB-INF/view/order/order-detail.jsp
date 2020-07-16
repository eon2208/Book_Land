<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 29.06.2020
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Order Detail</title>
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

<c:if test="${user.address.id == 1}">
    <c:redirect url="/user/showUserInfoForm"/>
</c:if>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">Check your order before Confirmation</div>
    </div>

    <div class="panel-body">
        <div style="margin-bottom: 25px" class="input-group">

            First Name : ${user.firstName}
        </div>

        <div style="margin-bottom: 25px" class="input-group">

            Last Name : ${user.lastName}
        </div>

        <div style="margin-bottom: 25px" class="input-group">

            Email : ${user.email}
        </div>

        <br>

        <div style="margin-bottom: 25px" class="input-group">

            Country: ${user.address.country}
        </div>

        <div style="margin-bottom: 25px" class="input-group">

            City : ${user.address.city}
        </div>

        <div style="margin-bottom: 25px" class="input-group">

            Street : ${user.address.street}
        </div>

        <div style="margin-bottom: 25px" class="input-group">

            Postal Code : ${user.address.postalCode}
        </div>

        <div style="margin-bottom: 25px" class="input-group">

            Phone Number : ${user.address.phone}
        </div>
    </div>


    <div class="panel panel-default">
        <div class="panel-heading">Cart :</div>
    </div>

    <c:forEach var="totalBasket" items="${totalBasket}">

        <div class="panel-body">
            <div style="margin-bottom: 25px" class="input-group">

                Title : ${totalBasket.books.title}<br>
                Author : ${totalBasket.books.authors}<br>
                Quantity : ${totalBasket.quantity}<br>
                Price : ${totalBasket.quantity * totalBasket.books.price}<br>
                <br>
            </div>
        </div>

    </c:forEach>

    <div class="panel-footer">
        <h4>TOTAL PRICE : ${basket.totalPrice}</h4>
    </div>
    <hr>

    <div class="row">
        <a href="${pageContext.request.contextPath}/cart/" class="btn btn-primary" role="button" aria-pressed="true">Back
            to
            Cart</a>

        <a href="${pageContext.request.contextPath}/user/showUserInfoForm" class="btn btn-primary" role="button"
           aria-pressed="true">Edit User Info</a>

        <a href="${pageContext.request.contextPath}/order/confirm" class="btn btn-primary" role="button"
           aria-pressed="true" onclick="orderSuccess()">Confirm Order</a>
    </div>
    <br>

</div>
</body>

</html>
