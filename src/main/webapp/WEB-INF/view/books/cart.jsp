<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart </title>
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

<div class="container">
    <div class="row">
        <div class="col-xs-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-title">
                        <div class="row">
                            <div class="col-xs-6">
                                <h5><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</h5>
                            </div>
                            <div class="col-xs-6">
                                <a href="${pageContext.request.contextPath}/home/mainPage" role="button"
                                   class="btn btn-default btn-sm btn-block">
                                    <span class="glyphicon glyphicon-share-alt"></span> Continue shopping
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-body">
                    <c:url value="/cart/editCart" var="edit"/>
                    <c:url value="/cart/delete" var="delete"/>

                    <c:forEach var="totalBasket" items="${totalBasket}">

                    <div class="row">
                        <div class="col-xs-2">
                            <img class="img-responsive" src="${totalBasket.books.smallImageUrl}" alt="cover">
                        </div>
                        <div class="col-xs-4">
                            <h4 class="product-name"><strong>${totalBasket.books.title}</strong></h4><h4>
                            <small>${totalBasket.books.authors}</small></h4>
                        </div>
                        <div class="col-xs-6">
                            <div class="col-xs-6 text-right">
                                <h6><strong>${totalBasket.books.price}<span class="text-muted">x</span></strong></h6>
                            </div>
                            <div class="col-xs-4">
                                <form:form action="${edit}" method="get">
                                    <input type="number" class="form-control input-sm" value="${totalBasket.quantity}" min="1" name="quantity"/>
                                    <input type="hidden" name="bookId" value="${totalBasket.books.id}"/>
                                    <input type="submit" value="Save" class="save"/>
                                </form:form>
                            </div>
                            <div class="col-xs-2">
                                <button type="button" class="btn btn-link btn-xs">
                                    <span class="glyphicon glyphicon-trash">
                                        <form:form action="${delete}" method="get">
                                        <input type="hidden" name="basketId" value="${totalBasket.basket.id}"/>
                                        <input type="hidden" name="totalBasketId" value="${totalBasket.id}"/>
                                        <input type="submit" value="Delete" class="save"
                                               onclick="if (!(confirm('Delete this book from the cart ?'))) return false "/>
                                         </form:form>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <hr>
                    </c:forEach>
                </div>


                <div class="row">
                    <div class="text-center">
                        <div class="col-xs-9">
                            <h6 class="text-right">Not Sure ? </h6>
                        </div>

                        <div class="col-xs-3">
                            <a href="${pageContext.request.contextPath}/cart/deleteAll" class="btn btn-default btn-sm btn-block"
                               role="button"
                               aria-pressed="true">Delete All</a>
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="row text-center">
                        <div class="col-xs-9">
                            <h4 class="text-right">Total :  <strong>${basket.totalPrice}</strong></h4>
                        </div>
                        <c:if test="${basket.totalPrice != 0}">
                            <div class="col-xs-3">
                                <a role="button" class="btn btn-success btn-block"
                                   href="${pageContext.request.contextPath}/order/summary">Complete Order</a>
                            </div>
                        </c:if>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
