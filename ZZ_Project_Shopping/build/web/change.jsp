<%-- 
    Document   : login.jsp
    Created on : Oct 11, 2022, 8:49:52 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ChangePassWord Page</title>
         <link type="text/css" rel="stylesheet" href="./css/changepass.css">
    </head>
    <body>
        <body>
    <body>
        <div class="login-page">
            <div class="form">
                <div class="login">
                    <div class="login-header">
                        <h3>Change Password</h3>
                    </div>
                </div>
                <form action="changepass" class="login-form" method="post">
                    <input type="password" placeholder="Old password" name="opass" /><br/>
                    <input type="hidden" name="id" value="${sessionScope.account.id}" />
                    <p style="color:red">${requestScope.mess}</p>
                    <input type="password" placeholder="New password" name="npass" /><br/>
                    <input placeholder="Confirm password" type="password" name="rpass" /><br/>
                    <input style="cursor: pointer; background-color:rgb(51, 207, 179) " type="submit" value="Change" />
                </form>
            </div>
        </div>
    </body>
</body>
    </body>
</html>
