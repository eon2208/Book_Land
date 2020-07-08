<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 02.07.2020
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order History</title>
</head>
<body>

<c:forEach items="${orderHistory}" var="orderHistory">

${orderHistory.date}
${orderHistory.value}
    <c:choose>
        <c:when test="${orderHistory.status == 1}">In progress</c:when>
        <c:when test="${orderHistory.status == 2}">Sent</c:when>
        <c:when test="${orderHistory.status == 3}">Completed</c:when>
    </c:choose>

<form:form action="${pageContext.request.contextPath}/user/historyDetail" method="get">
    <input type="hidden" value="${orderHistory.id}" name="orderId">
    <input type="submit" value="More Info" class="add-button">
</form:form>

</c:forEach>
</body>
</html>
