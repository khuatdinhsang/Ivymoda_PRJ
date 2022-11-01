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
        
        <title>Verification Code Page</title>
        <style>
            .login_part_form2 {
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
       <section class="login_part_form2">
            <h3>Enter Verification Code</h3>
            <c:choose>
                <c:when test="${mess!=null}">
                    <p style="color:red">${mess}</p> 
                </c:when>
                <c:otherwise>
                    <p style="margin-top:10px"class="text-primary">Nhap Code xac thuc</p> 
                </c:otherwise>
            </c:choose>
            <form class=" contact_form" action="check-verifi" method="get" novalidate="novalidate"style="margin-left: 1px;">                
                <div class="payment_item" style="margin:20px 0">
                    <input type="text" placeholder="Verification Code" name = "verifiCode" style="padding: 15px;margin-right: 15px;"/>
                </div>
                <div  class="btn_3">
                <button type="submit" value="submit">
                    Enter Code
                </button>    
                    </div>
            </form>
        </section>
    </body>
</html>
