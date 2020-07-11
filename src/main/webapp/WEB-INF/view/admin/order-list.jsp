<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 08.07.2020
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
          crossorigin="anonymous">

</head>
<body>

<div class="container">

    <h3>Orders :</h3>
    <hr>

    <!-- Add a button-->
    <a href="${pageContext.request.contextPath}/home/mainPage" class="btn btn-primary btn-sm mb-3">Go Back</a>
    <hr>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>User Detail</th>
            <th>Order Date</th>
            <th>Value</th>
            <th>Status</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${orderList}" var="orderList">

            <c:url value="/admin/deleteUser" var="deleteLink">
                <c:param name="orderId" value="${orderList.id}"/>
            </c:url>

            <tr>
                <td>
                    <p> First Name : ${orderList.user.firstName}<br></p>
                    <p> Last Name : ${orderList.user.lastName}<br></p>
                    <p> Email :  ${orderList.user.email}<br></p>
                    <p> Phone Number :${orderList.user.address.phone}<br></p>
                </td>
                <td>${orderList.date}<br></td>
                <td>${orderList.value}<br></td>
                <td>
                    ${orderList.status}
                    <form:form action="${pageContext.request.contextPath}/admin/editStatus" method="get">
                        <input type="hidden" value="${orderList.id}" name="orderId">
                        <label for="orderStatus">Change Status :</label>
                        <select name="orderStatus" id="orderStatus">
                            <option value="1">In Progress</option>
                            <option value="2">In delivery</option>
                            <option value="3">Completed</option>
                        </select>
<%--                        <input type="number" id="orderStatus" min="1" max="3" name="orderStatus"/>--%>
                        <input type="submit"/>
                    </form:form>
                    <br>
                </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
