<%-- 
    Document   : cart.jsp
    Created on : Oct 19, 2022, 1:44:36 PM
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
        <link rel="stylesheet" href="./css/cart.css">
        <title>Cart Page</title>
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
                    <li >
                        <a class="${requestScope.cid==c.cid?"red":""}" href="category?id=${c.cid}">${c.name}</a>
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
                    <a href="show" class="fa-solid fa-cart-plus">
                        <sup>${requestScope.size}</sup>
                    </a>
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
        <section class="cart">
            <div class="container">
                <div class="cart-top">
                    <div class="cart-top-cart">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                    <div class="cart-top-cart">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="cart-top-cart">
                        <i class="fas fa-money-check-alt"></i>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="cart-content">
                    <div class="cart-content-left">
                        <table>
                            <tr>
                                <th>STT</th>
                                <th>Sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Màu</th>
                                <th>SL</th>
                                <th>Giá</th>
                                <th>Thành tiền</th>
                                <th>Action</th>
                            </tr>
                            <c:set var="o" value="${requestScope.cart}"/>
                            <c:set var="tt" value="0"/>
                            <c:forEach items="${o.items}" var="i">
                                <c:set var="tt" value="${tt+1}"/>
                                <tr>
                                    <td>${tt}</td>
                                    <td>
                                        <img width="40px" heigth="40px" src="./images/product/allp/${i.product.image}" alt="">
                                    </td>
                                    <td>
                                        <p>${i.product.name}</p>
                                    </td>
                                    <td>
                                        <div>${i.product.color}</div>
                                    </td>
                                    <td style="text-align: center">
                                        <button><a href="process?num=-1&id=${i.product.pid}">-</a></button>
                                        ${i.quantity}
                                        <button><a href="process?num=1&id=${i.product.pid}">+</a></button>
                                    </td>
                                    <td>
                                        <p>${i.price}00 <sup>đ</sup></p>
                                    </td>
                                    <td>
                                        <p>${i.price*i.quantity}00 <sup>đ</sup></p>
                                    </td>
                                    <td style="text-align: center">
                                        <form action="process" method="post">
                                            <input type="hidden" name="id" value="${i.product.pid}"/>
                                            <input style="cursor: pointer" type="submit"  value="Delete"/>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="cart-content-right">
                        <table>
                            <tr>
                                <th colspan="2">Tổng tiền giỏ hàng</th>
                            </tr>
                            <tr>
                                <td>
                                    Tổng sản phẩm
                                </td>
                                <td>${tt}</td>
                            </tr>
                            <tr>
                                <td>Tổng tiền hàng</td>
                                <td>
                                    ${o.totalMoney}00 <sup>đ</sup>
                                </td>
                            </tr>
                            <tr>
                                <td>Tạm tính</td>
                                <td>
                                    <p style="color:black; font-weight: bold;"> ${o.totalMoney}00<sup>đ</sup></p>
                                </td>
                            </tr>
                        </table>
                        <div class="cart-content-right-text">
                            <p>Bạn sẽ được miễn phí ship khi đơn hàng của bạn có tổng giá trị trên 2.000.000 <sup>đ</sup></p>
                            <p style="color:red; font-weight: bold;">Mua thêm <span style="font-size:18px">${2000-o.totalMoney}00</span> để được miễn phí Ship</p>
                        </div>
                        <div class="cart-content-right-button">
                            <button>
                                <a href="category">Tiếp tục mua sắm</a>
                            </button>
                            <button style="background: white">
                                <form  action="checkout" method="post">
                                    <input type="submit" style="padding: 7px 32px; cursor: pointer" value="Thanh Toán"/>
                                </form>
                            </button>
                        </div>
                        <c:if test="${sessionScope.account==null}">
                            <div class="cart-content-right-dangnhap">
                                <p>Tài khoản IVY</p>
                                <p>Hãy <a href="login">đăng nhập</a> tài khoản để tích điểm thành viên</p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>
        </br>
        <div>
            <section style="margin-top:50px" class="app-container">
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
        <script src="./js/home.js"></script>
    </body>
</html>
