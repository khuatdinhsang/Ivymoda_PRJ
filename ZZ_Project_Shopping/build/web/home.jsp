<%-- 
    Document   : home.jsp
    Created on : Oct 18, 2022, 8:20:08 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link type="text/css" rel="stylesheet" href="./css/app.css">
        <link type="text/css" rel="stylesheet" href="./css/base.css">
        <title>IVY moda</title>
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

        <section id="slider">
            <div class="click_right click_slide">
                <i class="fa-solid fa-chevron-right "></i>
            </div>
            <div class="click_left click_slide">
                <i class="fa-solid fa-chevron-left"></i>
            </div>
            <div class="aspect-ratio-169">
                <img src="./images/slide_large/slide1_large.jpg" alt="">
                <img src="./images/slide_large/slide4_large.jpg" alt="">
                <img src="./images/slide_large/slide3_large.jpg" alt="">
                <img src="./images/slide_large/slide2_large.jpg" alt="">
            </div>
            <div class="dot-container">
                <div class="dot active " data-index="0"></div>
                <div class="dot" data-index="1"></div>
                <div class="dot" data-index="2"></div>
                <div class="dot" data-index="3"></div>
            </div>
        </section>
        <section class="top_seller">
            <div class="container-product">
                <div class="top_seller_title">
                    <h2>Best seller</h2>
                </div>
                <div class="top_seller_items">
                    <c:forEach items="${requestScope.listCategory}" var="c">
                        <div class="item item_moda ${requestScope.cid==c.cid?"active_item":""}">
                            <a href="home?cid=${c.cid}">${c.name}
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <div class="top_seller_content">
                    <div class="click_right click_slide item_click_right" style="top:45%">
                        <i class="fa-solid fa-chevron-right "></i>
                    </div>
                    <div class="click_left click_slide item_click_left" style="top:45%">
                        <i class="fa-solid fa-chevron-left"></i>
                    </div>

                    <div class="seller_list_product">
                        <c:forEach items="${requestScope.listProduct}" var="p">
                            <div class="item_product">
                                <a href="product?pid=${p.pid}">
                                    <div class="sales">-50<sup>%</sup></div>
                                    <img src="./images/product/allp/${p.image}" alt="">
                                    <div class="row">
                                        <div class="color_product_seller">
                                            <div class="color color1"></div>
                                            <div class="color color2"></div>
                                            <div class="color color3"></div>
                                        </div>
                                        <div class="heart_product_seller">
                                            <i class="fa-solid fa-heart"></i>
                                        </div>
                                    </div>
                                    <div style="text-align: center;margin-bottom: 10px"class="price_product_seller">
                                        <span style="color:red"class="new_price">${p.price/2}00<sup>đ</sup></span>
                                        <span class="old_price">${p.price}00<sup>đ</sup></span>
                                    </div>
                                    <div style="text-align: center">
                                        ${p.name}
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
        </section>
        <div class="watch_all">
            <a href="category?id=0"> Xem tất cả</a></div>

        <div class="big_img-sale">
            <img src="./images/slide_large/slide3_large.jpg" alt="">
        </div>
        <section class="gallery">
            <div class="gallery_title">
                <h3>Gallery</h3>
            </div>
            <div class="gallery_list_items">
                <a href="#"><img src="./images/galery/galery1.jpg" alt=""></a>
                <a href="#"><img src="./images/galery/galery2.jpg" alt=""></a>
                <a href="#"><img src="./images/galery/galery3.jpg" alt=""></a>
                <a href="#"><img src="./images/galery/galery4.jpg" alt=""></a>
                <a href="#"><img src="./images/galery/galery5.jpg" alt=""></a>
            </div>
        </section>
        <div>
            <section class="app-container">
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
