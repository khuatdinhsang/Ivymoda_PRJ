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
        
        <title>Forget Password</title>
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
        
       <div class="login_part_form2">
        <h3>Enter your email</h3>
        <c:choose>
            <c:when test="${mess!=null}">
                <p style="color:red">${mess}</p>
            </c:when>
            <c:otherwise>
                <p class="text-primary">Nhap Email de gui code xac thuc</p>
            </c:otherwise>
        </c:choose>

        <form class="contact_form" action="send-code" method="post" novalidate="novalidate" style="margin-left: 1px;">
            <div class="payment_item" style="margin:20px 0">
                <input type="text" placeholder="Email" name="email" style="padding: 10px; width:200px" />
            </div>
            <div class=" btn_3 ">
                <button type="submit " value="submit ">
                Send Code
            </button>
            </div>
        </form>
    </div>
        <div>
            <section style="margin-top:50px"class="app-container">
                <p>T???i ???ng d???ng IVYmoda</p>
                <div class="app-google">
                    <a href="#"><img src="./images/logo/appstore.png" alt=""></a>
                    <a href="#"><img src="./images/logo/googleplay.png" alt=""></a>
                </div>
                <p>Nh???n b???n tin IVY moda</p>
                <input type="text" placeholder="Nh???p email c???a b???n...">

            </section>
            <footer class="footer-top">
                <li>
                    <a href="http://online.gov.vn/Home/WebDetails/36596?AspxAutoDetectCookieSupport=1">
                        <img src="./images/logo/img-congthuong.png" alt="">
                    </a>
                </li>
                <li>
                    <a href="#">Li??n h???</a>
                </li>
                <li>
                    <a href="https://tuyendung.ivy.com.vn/">Tuy???n d???ng</a>
                </li>
                <li>
                    <a href="#">Gi???i thi???u</a>
                </li>
                <li>
                    <a href="https://www.facebook.com/thoitrangivymoda/"><i class="fa-brands fa-facebook"></i></a>
                    <a href="https://www.youtube.com/user/thoitrangivymoda"><i class="fa-brands fa-youtube"></i></a>
                    <a href="https://www.instagram.com/ivy_moda/"><i class="fa-brands fa-instagram"></i></a>
                </li>
            </footer>
            <div class="about">
                <p>Khu???t ????nh S??ng xin g???i l???i ch??o ?????n ng?????i anh em</p>
                <p>?????a ch???: Gi???ng L??ng- Y??n L???- C???m Y??n- Th???ch Th???t- H?? N???i</p>
                <p>SDT :<span>0981008250</span></p>
            </div>
            <footer class="footer-bottom">
                Made by Khu???t ????nh S??ng
            </footer>
    </body>
</html>
