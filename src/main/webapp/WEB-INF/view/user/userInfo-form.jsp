<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: EoN
  Date: 30.06.2020
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Form</title>

    <style>
        .error {
            color: red
        }
    </style>

</head>
<body>

<div id="loginbox" style="margin-top: 50px;"
     class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <div class="panel-title">User Info :</div>
        </div>

        <div style="padding-top: 30px" class="panel-body">

            <!-- Order Form -->
        <form:form action="${pageContext.request.contextPath}/user/saveUserInfoForm" modelAttribute="userInfoForm" method="post">

            <table>
                <tbody>

                <tr>
                    <td><label>First Name :</label></td>
                    <td><form:input path="firstName" /></td>
                    <td><form:errors path="firstName" cssClass="error"/></td>
                </tr>

                <tr>
                    <td><label>Last Name :</label></td>
                    <td><form:input path="lastName"/></td>
                    <td><form:errors path="lastName" cssClass="error"/></td>
                </tr>

                <tr>
                    <td><label>email :</label></td>
                    <td><form:input path="email"/></td>
                    <td><form:errors path="email" cssClass="error"/></td>
                </tr>

                <tr></tr>

                <tr>
                    <td><label>Country :</label></td>
                    <td><form:input path="country"/></td>
                    <td><form:errors path="country" cssClass="error"/></td>
                </tr>

                <tr>
                    <td><label>City :</label></td>
                    <td><form:input path="city"/></td>
                    <td><form:errors path="city" cssClass="error"/></td>
                </tr>

                <tr>
                    <td><label>Street :</label></td>
                    <td><form:input path="street"/></td>
                    <td><form:errors path="street" cssClass="error"/></td>
                </tr>

                <tr>
                    <td><label>Postal Code :</label></td>
                    <td><form:input path="postalCode"/></td>
                    <td><form:errors path="postalCode" cssClass="error"/></td>
                </tr>

                <tr>
                    <td><label>Phone :</label></td>
                    <td><form:input path="phone"/></td>
                    <td><form:errors path="phone" cssClass="error"/></td>
                </tr>

                <tr>
                    <td><label></label></td>
                    <td><input type="submit" value="Save" class="save"></td>
                </tr>

                <tr>
                    <td><label></label></td>
                    <td><a href="${pageContext.request.contextPath}/cart/">Back to Cart</a></td>
                </tr>

                </tbody>
            </table>

        </form:form>

        </div>

    </div>

</div>

</body>
</html>
