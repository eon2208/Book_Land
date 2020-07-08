<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart </title>
</head>
<body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bookHandling.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>

<div class="table-responsive ">

    <c:url value="/cart/editCart" var="edit"/>
    <c:url value="/cart/delete" var="delete"/>

    <c:forEach var="totalBasket" items="${totalBasket}">

        <table>
            <tr>
                <th>Title :</th>
                <th></th>
                <th>Quantity :</th>
                <th></th>
                <th></th>
            </tr>

            <tr>
                <td>${totalBasket.books.title}</td>
                <td></td>
                <td>
                    <form:form action="${edit}" method="get">
                    Quantity :
                    <input type="number" value="${totalBasket.quantity}" min="1" name="quantity"/>
                    <input type="hidden" name="bookId" value="${totalBasket.books.id}"/>
                </td>
                <td><input type="submit" value="Save" class="save"></td>
                </form:form>
                <td>
                    <form:form action="${delete}" method="get">
                        <input type="hidden" name="basketId" value="${totalBasket.basket.id}"/>
                        <input type="hidden" name="totalBasketId" value="${totalBasket.id}"/>
                        <input type="submit" value="Delete" class="save"
                               onclick="if (!(confirm('Delete this book from the cart ?'))) return false "/>
                    </form:form>
                        <%--<a href="${deleteLink} "
                           onclick="if (!(confirm('Are you sure you want to delete this Book ?'))) return false ">Delete</a>--%>
                </td>
            </tr>
        </table>
    </c:forEach>

    <br><br>

    <div>
        <a href="${pageContext.request.contextPath}/home/mainPage" class="btn btn-primary" role="button"
           aria-pressed="true">Back to Home Site</a>
    </div>

    <div>
        <a href="${pageContext.request.contextPath}/admin/list" class="btn btn-primary" role="button"
           aria-pressed="true">Admin lol</a>
    </div>


    <div>
        <h2> Total : ${basket.totalPrice}</h2>
    </div>

    <c:if test="${basket.totalPrice != 0}">
        <div>
            <a href="${pageContext.request.contextPath}/order/summary" class="btn btn-primary" role="button"
               aria-pressed="true">Complete Order</a>
        </div>
    </c:if>


</div>

</body>
</html>
