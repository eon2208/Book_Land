<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 09.07.2020
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring MVC Email Example</title>
    <style type="text/css">
        #errorMessage {
            text-align: center;
            font-size: 25px;
            padding-top: 17px;
        }

        #errorMessage span {
            color: red;
        }
    </style>
</head>

<body>

    <h2>Spring MVC Email Example</h2>

<br /> <br />
<div id="errorMessage">
    <strong>Sorry, The Email Was Not Sent Because Of The Following Error!</strong>
    <span id="exceptionTrace">${exception}</span>
    <a href="${pageContext.request.contextPath}/login/showMyLoginPage" role="button">Go Back</a>
</div>
</body>
</html>
