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
        
        <title>Login Page</title>
    </head>
    <body>
        <header class="container">
            <div class="logo">
                <a href="home">
                    <img src="./images/logo/logo.png" alt="">
                </a>
            </div>
            <div class="menu">
                <c:forEach items="${requestScope.listCategory}" var="c">
                     <li>
                    <a class="${requestScope.cid==c.cid?"red":""}"  href="category?id=${c.cid}">${c.name}</a>
                </li>
                </c:forEach>
                <li>
                   <a class="red" href="listProductSold">Sp đã bán</a>
                </li>
            </div>
            <div class="others">
                <li>
                    <a href="userprofile" class="fa-solid fa-user"></a>
                </li>
                <li>
                    <a href="#" class="fa-solid fa-cart-plus"></a>
                </li>
                 <c:if test="${sessionScope.account==null}" >
                    <li>
                        <a href="login" >Login</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.account!=null}" >
                    <li>
                        <a href="logout">Log out</a>
                    </li>
                </c:if>
            </div>
        </header>
        <section class="login">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <h2>Bạn đã có tài khoản IVY</h2>
                        <p>Nếu bạn đã có tài khoản, hãy đăng nhập để tích lũy điểm thành viên và nhận được những ưu đãi tốt hơn! </p>
                        <form action="login" method="post">
                            <input type="text" name="username"class="email" value="${sessionScope.account.username}" placeholder="Tên Đăng Nhập">
                            <input type="password" name="password" class="password" value="${sessionScope.account.password}" placeholder="Mật khẩu">
                            <p style="color:red">${requestScope.error}</p>
                            <div class="handle_password">
<!--                                <div class="remember_password">
                                    <input type="checkbox" name="rem" value="on"/> Ghi nhớ đăng nhập
                                </div>-->
                                <div style="text-align: right" class="forget_password">
                                    <a href="emailForgetPass.jsp">Quên mật khẩu</a>
                                </div>
                            </div>
                            <input type="submit" class="btn_login" value="Đăng nhập"/>
                        </form>


                    </div>
                    <div class="col-md-6 col-sm-12">
                        <h2>Khách hàng mới của IVY moda</h2>
                        <p>Nếu bạn chưa có tài khoản trên ivymoda.com, hãy sử dụng tùy chọn này để truy cập biểu mẫu đăng ký. Bằng cách cung cấp cho IVY moda thông tin chi tiết của bạn, quá trình mua hàng trên ivymoda.com sẽ là một trải nghiệm thú vị và nhanh chóng
                            hơn!
                        </p>
                        <div class="btn_register btn_login">
                            <a href="register" style="color:white" >Đăng Kí</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div>
            <section style="margin-top:50px"class="app-container">
                <p>Tải ứng dụng IVYmoda</p>
                <div class="app-google">
                    <a href="#"><img src="./images/logo/appstore.png" alt=""></a>
                    <a href="#"><img src="./images/logo/googleplay.png" alt=""></a>
                </div>
                <p>Nhận bản tin IVY moda</p>
                <input type="text" placeholder="Nhập email của bạn...">

            </section>
            <footer class="footer-top">
                <li>
                    <a href="http://online.gov.vn/Home/WebDetails/36596?AspxAutoDetectCookieSupport=1">
                        <img src="./images/logo/img-congthuong.png" alt="">
                    </a>
                </li>
                <li>
                    <a href="#">Liên hệ</a>
                </li>
                <li>
                    <a href="https://tuyendung.ivy.com.vn/">Tuyển dụng</a>
                </li>
                <li>
                    <a href="#">Giới thiệu</a>
                </li>
                <li>
                    <a href="https://www.facebook.com/thoitrangivymoda/"><i class="fa-brands fa-facebook"></i></a>
                    <a href="https://www.youtube.com/user/thoitrangivymoda"><i class="fa-brands fa-youtube"></i></a>
                    <a href="https://www.instagram.com/ivy_moda/"><i class="fa-brands fa-instagram"></i></a>
                </li>
            </footer>
            <div class="about">
                <p>Khuất Đình Sáng xin gửi lời chào đến người anh em</p>
                <p>Địa chỉ: Giếng Làng- Yên Lỗ- Cẩm Yên- Thạch Thất- Hà Nội</p>
                <p>SDT :<span>0981008250</span></p>
            </div>
            <footer class="footer-bottom">
                Made by Khuất Đình Sáng
            </footer>
        </div>

        <script src="./js/login.js"></script>
    </body>
</html>
