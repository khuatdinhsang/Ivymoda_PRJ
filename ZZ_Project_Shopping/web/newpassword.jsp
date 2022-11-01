<%-- 
    Document   : login.jsp
    Created on : Oct 19, 2022, 11:02:31 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer">
       <link rel="stylesheet" href="./css/app.css">
        <link rel="stylesheet" href="./css/base.css">
        <link rel="stylesheet" href="./css/login.css">
        <title>New Password Page</title>
        <style>
            .login_part {
            width: 300px;
            padding: 20px;
            border: 1px solid #ccc;
            margin: 150px auto;
            background-color: rgb(221, 166, 213);
            border-radius: 10px;
        }
        
        .btn_3 {
            text-align: center;
            margin-top: 10px;
            display: inline-block;
        }
        
        .btn_3 button {
            background-color: red;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 5px 10px;
            text-align: center;
            color: white;
        }
        </style>
    </head>
    <body>
       
       <section class="login_part ">
        <h3 style="margin-bottom: 10px">Enter new password</h3>
        <div class="alert alert-danger" role="alert">
            ${mess}
        </div>
        <form class=" contact_form" action="new-pass" method="post" novalidate="novalidate">
            <div>
                <input style="padding:10px; margin-bottom: 10px;width:200px;" type="password" class="new-pass" id="password" name="password" placeholder="Password">
            </div>
            <div>
                <input style="padding:10px; margin-bottom: 10px;width:200px;" type="password" class="form-control" id="password" name="repassword" placeholder="Confim Password">
            </div>
            <div class="btn_3">
                <button type="submit" value="submit">
                    LOG IN
                </button>
            </div>
        </form>
    </section>
    </body>
</html>
