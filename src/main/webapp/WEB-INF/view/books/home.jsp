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
<%@ page contentType="text/html;charset=UTF-8"%>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
</head>
<body>

<header>
    <jsp:include page="../header/header.jsp"/>
</header>

<div class="container">

<%--Search Box--%>
    <div class="col-lg-4">
        <form:form action="search" method="get">
            <label for="Search">Search : </label>
            <input type="text" name="search" id="Search"/>
            <input type="submit" value="Search" class="add-button">
        </form:form>
    </div>
<hr>

    <ul id="pagination-demo" class="pagination-sm"></ul>

<%--Listing books --%>
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
        $('#books').DataTable({
            "searching": false,// false to disable search (or any other option)
            "paging": false, // false to disable pagination (or any other option)
            "ordering": false, // false to disable sorting (or any other option)
            "pageLength" : 50

        });
    });
</script>

<script>

    $(document).ready(function () {

        var $pagination = $('#pagination-demo');

        // get page number from URL
        const queryString = window.location.search;
        const urlSearchParams = new URLSearchParams(queryString);
        let page = urlSearchParams.get('page');

        if(page==null)
            page = "1";

        console.log(page);

        $pagination.twbsPagination({
            initiateStartPageClick: false,
                totalPages: 100,
                visiblePages: 8,
                startPage: parseInt(page),
        onPageClick: function (event, currentPage) {
            const url = "http://localhost:8080/Book_Land_war_exploded/home/mainPage";
            window.location.href = url + "?page=" + currentPage;

        }
    });
    })
</script>

</body>
</html>
