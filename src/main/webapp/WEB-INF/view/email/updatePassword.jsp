<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 09.07.2020
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reset Password</title>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        .error {
            color: red
        }
    </style>
</head>
<body>
<div>

    <div id="loginbox" style="margin-top: 50px;"
         class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">

        <div class="panel panel-primary">

            <div class="panel-heading">
                <div class="panel-title">Reset Passwordr</div>
            </div>

            <div style="padding-top: 30px" class="panel-body">

                <!-- Reset Password Form -->
                <form:form action="${pageContext.request.contextPath}/email/savePassword"
                           modelAttribute="passwordModel"
                           class="form-horizontal">

                    <%--token --%>
                    <input type="hidden" name="token" value="${token}">

                    <!-- Password -->
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <form:errors path="password" cssClass="error"/>
                        <form:password path="password" placeholder="password (*)" class="form-control"/>
                    </div>

                    <!-- Matching Password -->
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <form:errors path="matchingPassword" cssClass="error"/>
                        <form:password path="matchingPassword" placeholder="Matching Password (*)" class="form-control"/>
                    </div>

                    <!-- Reset Button -->
                    <div style="margin-top: 10px" class="form-group">
                        <div class="col-sm-6 controls">
                            <button type="submit" class="btn btn-primary">Reset</button>
                            <hr>
                        </div>
                    </div>

                </form:form>

            </div>

        </div>

    </div>
</div>
</body>
</html>
