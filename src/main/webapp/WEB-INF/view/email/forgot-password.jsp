<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
</head>
<body>

<form:form action="${pageContext.request.contextPath}/email/resetPassword" method="post">
    <table>
        <tr>
            <td>Email : <input name="email" type="text"></td>
        </tr>
    </table>
    <button type="submit" name="Send" onclick="resetPass()"></button>
</form:form>

<script>
    var serverContext = [["${pageContext.request.contextPath}/"]];
        function resetPass(){
            var email = $("#email").val();
            $.post(serverContext + "user/resetPassword",{email: email} ,
                function(data){
                    window.location.href =
                        serverContext + "login?message=" + data.message;
                })
                .fail(function(data) {
                    if(data.responseJSON.error.indexOf("MailError") > -1)
                    {
                        window.location.href = serverContext + "emailError.html";
                    }
                    else{
                        window.location.href =
                            serverContext + "login?message=" + data.responseJSON.message;
                    }
                });
        }
</script>

</body>
</html>
