<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 09.07.2020
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forgot Password</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div>

    <div id="loginbox" style="margin-top: 50px;"
         class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">

        <div class="panel panel-primary">

            <div class="panel-heading">
                <div class="panel-title">Reset Password</div>
            </div>

            <div style="padding-top: 30px" class="panel-body">

                <form:form action="${pageContext.request.contextPath}/email/resetPassword" method="post"
                           class="form-horizontal">

                    <!-- Place for messages: error, alert etc ... -->
                    <div class="form-group">
                        <div class="col-xs-15">
                            <div>
                                <!-- Check for registration error -->
                                <c:if test="${infoError != null}">
                                    <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                                            ${infoError}
                                    </div>
                                </c:if>

                                <c:if test="${info != null}">
                                    <div class="alert alert-primary col-xs-offset-1 col-xs-10">
                                            ${info}
                                    </div>
                                </c:if>

                            </div>
                        </div>
                    </div>

                    <!-- User name -->
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user">Email :</i></span>
                        <input placeholder="email" class="form-control" type="email" name="email"/>
                    </div>

                    <button type="submit" name="Send" class="btn btn-primary">Send</button>
                    <hr>
                    <a href="${pageContext.request.contextPath}/login/showMyLoginPage">
                        <button type="button" class="btn btn-primary">Go Back</button>
                    </a>
                </form:form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
