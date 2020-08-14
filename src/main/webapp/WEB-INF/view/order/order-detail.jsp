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
    <jsp:include page="../header/header.jsp"/>
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
            to Cart</a>

        <a href="${pageContext.request.contextPath}/user/showUserInfoForm" class="btn btn-primary" role="button"
           aria-pressed="true">Edit User Info</a>

        <a href="${pageContext.request.contextPath}/order/confirm" class="btn btn-primary" role="button"
           aria-pressed="true" onclick="orderSuccess()">Confirm Order</a>
    </div>
    <br>

</div>
</body>

</html>
