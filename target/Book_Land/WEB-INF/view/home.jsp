<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 12.05.2020
  Time: 00:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bookstore</title>
</head>
<body>

<%--TODO EXCEPTION HANDLER !!! dla book id = ? --%>

<script src="<c:url value="/resources/js/bookHandling.js"/>"></script>

<h2>Welcome to BOOK LAND </h2>

<security:authorize access="hasRole('USER')">
    <%-- Add a link to point to leaders ... this is for menagers --%>
    <p>
        Hello : <security:authentication property="principal.username"/> !
            ${userCart.totalPrice}
    </p>

    <p>
        <a href="${pageContext.request.contextPath}/User/userDetail">User Details</a>
    </p>

    <p>
        <a href="${pageContext.request.contextPath}/cart/">Cart</a>
    </p>

    <form:form action="${pageContext.request.contextPath}/logout" method="post">
        <br><br>
        <input type="submit" value="Logout"/>

    </form:form>

</security:authorize>

<security:authorize access="!hasAnyRole('USER', 'MANAGER')">
    <a href="${pageContext.request.contextPath}/login/showMyLoginPage">Login</a>

</security:authorize>

<hr>

BOOKSTORE

<br><br>

<c:forEach var="i" begin="1" end="100">
    <c:url var="pageNumber" value="/home/mainPage">
        <c:param name="page" value="${i}"/>
    </c:url>
    <a href="${pageNumber}">${i}</a>
</c:forEach>

<br><br>


<%--Search Box--%>
<form:form action="search" method="get">
    Search : <input type="text" name="search"/>

    <input type="submit" value="Search" class="add-button">
</form:form>

<hr>

<%-- add out html table here --%>
<table>

    <th>Title :</th>
    <th>Authors :</th>
    <th>Image :</th>
    <th>Options :</th>


    <%-- loop over and print our customers --%>
    <c:forEach var="tempBook" items="${books}">

        <c:url var="detailLink" value="/home/details">
            <c:param name="bookId" value="${tempBook.id}"/>
        </c:url>

        <%--construct an "delete" link with customer id--%>
        <c:url var="deleteLink" value="/home/delete">
            <c:param name="bookId" value="${tempBook.id}"/>*
        </c:url>


        <tr>
            <td>${tempBook.title}</td>
            <td>${tempBook.authors}</td>
            <td><img src="${tempBook.smallImageUrl}" alt="cover"></td>

            <td>
                <a href="${deleteLink} "<%--
               onclick="if (!(confirm('Are you sure you want to delete this book ?'))) return false --%>>Delete</a>
                |
                <a href="${detailLink}">INFO</a>
            </td>
        </tr>

    </c:forEach>

</table>


<hr>


</body>
</html>
