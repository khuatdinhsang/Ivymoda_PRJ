<%-- 
    Document   : alert.jsp
    Created on : Nov 1, 2022, 8:43:55 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alert Page</title>
        <style>
            .alert {
                width: 400px;
                height: 250px;
                background: linear-gradient(to bottom right, #B0DB7D 40%, #99DBB4 100%);
                margin: 200px auto;
                border-radius: 20px;
                padding: 20px;
                color: white;
            }

            .noti {
                Text-align: center;
            }

            .action {
                display: flex;
                align-items: center;
                justify-content: space-around;
                margin-top: 50px;
            }

            .action a {
                text-decoration: none;
                color: #4ec07d;
                padding: 10px 20px;
                background: white;
                border-radius: 10px
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.check==1}">
            <div class="alert">
                <h1 class="noti">Thêm vào giỏ hàng thành công</h1>
                <div class="action">
                    <a href="category">Mua tiếp</a>
                    <a href="show">Xem giỏ hàng</a>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.check==2}">
            <div class="alert">
                <h1 class="noti">Bạn đã thêm sản phẩm thành công</h1>
                <div class="action">
                    <a href="listProduct">Xem sản phẩm</a>
                    <a href="addNewProduct">Thêm tiếp sản phẩm</a>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.check==3}">
            <div class="alert">
                <h1 class="noti">Bạn đã mua hàng thành công</h1>
                <div class="action">
                    <a href="category">Mua tiếp</a>
                    <a href="orderHistory">Xem đơn hàng</a>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.check==4}">
            <div class="alert">
                <h1 class="noti">Bạn đã đăng kí thành công</h1>
                <div class="action">
                    <a href="login">Login</a>
                </div>
            </div>
        </c:if>
    </body>
</html>
