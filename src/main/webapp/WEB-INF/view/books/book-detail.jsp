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
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/bookHandling.js"></script>
<div>

    ${book.authors}
    ${book.title}
    ${book.price}

    <img src="${book.imageUrl}" alt="bookPage"/>
</div>
<br>
<div>
    <security:authorize access="hasAnyRole('ADMIN','USER')">
        <form:form action="${pageContext.request.contextPath}/cart/addToCart" method="get">
            Quantity : <input type="number" name="quantity" min="1" value="1"/>
            <input type="hidden" value="${book.id}" name="bookId">
            <input type="submit" value="Add To Cart" class="add-button">
        </form:form>
    </security:authorize>
    <br>
    <a href="${pageContext.request.contextPath}/home/mainPage">Back</a>
</div>
</body>
</html>
