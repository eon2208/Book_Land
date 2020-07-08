<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 29.06.2020
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Detail</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bookHandling.js"></script>
    <script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src = "http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

</head>
<body>

<h2>Check your order before Confirmation</h2>

<c:if test="${user.address.id == 1}">
    <c:redirect url="/user/showUserInfoForm"/>
</c:if>

<div style="margin-bottom: 25px" class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    First Name : ${user.firstName}
</div>

<div style="margin-bottom: 25px" class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    Last Name : ${user.lastName}
</div>

<div style="margin-bottom: 25px" class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    Email : ${user.email}
</div>

<br>

<div style="margin-bottom: 25px" class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    Country: ${user.address.country}
</div>

<div style="margin-bottom: 25px" class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    City : ${user.address.city}
</div>

<div style="margin-bottom: 25px" class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    Street : ${user.address.street}
</div>

<div style="margin-bottom: 25px" class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    Postal Code : ${user.address.postalCode}
</div>

<div style="margin-bottom: 25px" class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    Phone Number : ${user.address.phone}
</div>

<div style="margin-bottom: 25px" class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    <h3>Cart : </h3>
</div>

<c:forEach var="totalBasket" items="${totalBasket}">

    <div style="margin-bottom: 25px" class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        Title : ${totalBasket.books.title}<br>
        Author : ${totalBasket.books.authors}<br>
        Quantity : ${totalBasket.quantity}<br>
        Price : ${totalBasket.quantity * totalBasket.books.price}<br>
        <br>
    </div>

</c:forEach>

<div style="margin-bottom: 25px" class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    <h4>TOTAL PRICE : ${basket.totalPrice}</h4>
</div>


<div>
    <a href="${pageContext.request.contextPath}/cart/" class="btn btn-primary" role="button" aria-pressed="true">Back to Cart</a>
</div>

<div>
    <a href="${pageContext.request.contextPath}/user/showUserInfoForm" class="btn btn-primary" role="button" aria-pressed="true">Edit User Info</a>
</div>
<div>
    <a href="${pageContext.request.contextPath}/order/confirm" class="btn btn-primary" role="button" aria-pressed="true">Confirm Order</a>
</div>

</body>

</html>
