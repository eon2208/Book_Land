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
    <title>Book Land</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/site.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="<c:url value="/resources/js/bookHandling.js"/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
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

<br><br>

<%--Search Box--%>
<form:form action="search" method="get">
    <label for="Search">Search : </label>
    <input type="text" name="search" id="Search"/>
    <input type="submit" value="Search" class="add-button">
</form:form>

<hr>

<%--Listing books --%>
<div class="container">
    <table id="books" class="table table-striped table-bordered" style="width:100%">
        <thead>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Cover</th>
            <th>Publication Year</th>
            <th>Rating</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>

        <c:forEach var="tempBook" items="${books}">

        <c:url var="detailLink" value="/home/details">
            <c:param name="bookId" value="${tempBook.id}"/>
        </c:url>

            <%--construct an "delete" link with customer id--%>
        <c:url var="deleteLink" value="/admin/delete">
            <c:param name="bookId" value="${tempBook.id}"/>*
        </c:url>

        <tr>
            <td>${tempBook.title}</td>
            <td>${tempBook.authors}</td>
            <td><img src="${tempBook.smallImageUrl}" alt="cover"></td>
            <td>${tempBook.originalPublicationYear}</td>
            <td>${tempBook.avarageRating}</td>
            <td>${tempBook.price}</td>
            <td>
                <a href="${detailLink}" role="button" class="btn btn-info">INFO</a>
                <security:authorize access="hasRole('ADMIN')">
                    <a href="${deleteLink}" role="button" class="btn btn-danger">Delete</a>
                </security:authorize>
            </td>
        </tr>

        </tbody>

        </c:forEach>

        <tfoot>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Cover</th>
            <th>Publication Year</th>
            <th>Rating</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        </tfoot>
    </table>
</div>

<script>
    $(document).ready(function () {
        $('#books').DataTable();
    });
</script>
</body>
</html>