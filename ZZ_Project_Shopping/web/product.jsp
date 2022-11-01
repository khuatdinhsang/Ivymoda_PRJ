<%-- 
    Document   : product.jsp
    Created on : Oct 19, 2022, 7:17:28 PM
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
        <link rel="stylesheet" href="./css/product.css">
        <title>Product Page</title>
        <style>
            .cart{
                padding:10px;
                background: red;
                display: inline-block;
                cursor:pointer;
                outline: none;
                border: none;
                color:white;
                border-radius: 5px
            }

        </style>
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
                        <a  class="${requestScope.cid==c.cid?"red":""}" href="category?id=${c.cid}">${c.name}</a>
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
                    <a href="show" class="fa-solid fa-cart-plus"></a> <sup>${requestScope.size}</sup>
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

        <section class="product">
            <div class="container">
                <div class="product-content row">
                    <c:set value="${requestScope.product}" var="p"/>
                    <c:set value="${requestScope.f_image}" var="fi"/>
                    <c:set value="${requestScope.stt_image}" var="fstt"/>
                    <c:set value="${requestScope.l_image}" var="li"/>
                    <div class="product-content-left row">
                        <div class="product-content-left-big-img">
                            <img src="./images/product/allp/${fi}.${fstt}.${li}" alt="">
                        </div>
                        <div class="product-content-left-small-img">
                            <img src="./images/product/allp/${fi}.${fstt+1}.${li}" alt="">
                            <img src="./images/product/allp/${fi}.${fstt+2}.${li}" alt="">
                            <img src="./images/product/allp/${fi}.${fstt}.${li}" alt="">
                        </div>
                    </div>
                    <div class="product-content-right">
                        <form  action="buy" method="get">
                            <div class="product-content-right-product-name">
                                <h1>${p.name} </h1>
                                <h1>MSP: ${p.code}</h1>
                            </div>
                            <div class="product-content-right-product-price">
                                <p> <span style="color:red; text-decoration: line-through">${p.price}00<sup>đ</sup></span>${p.price/2}00 <sup>đ</sup></p>
                            </div>
                            <div class="product-content-right-product-color">
                                <h3>Màu sắc: ${p.color}  </h3>
                            </div>
                            <div class="quantity">
                                <p style="font-weight:bold">Số lượng: </p>
                                <input style="text-align: center" type="number" name="num" value="1"/>

                            </div>
                            <input type="hidden" name="id" value="${p.pid}"/>
                            <div class="product-content-right-product-button">
                                <input class="cart"type="submit" value="Mua hàng"/>

                                <button><p>
                                        <a href="category?id=${requestScope.cid}">Tìm tại cửa hàng</a>
                                    </p></button>
                            </div>
                        </form>
                        <div class="product-content-right-product-icon">
                            <div class="product-content-right-product-icon-item">
                                <i class="fas fa-phone-alt"></i>
                                <p>Hotline</p>
                            </div>
                            <div class="product-content-right-product-icon-item">
                                <i class="fas fa-comments"></i>
                                <p>Chat</p>
                            </div>
                            <div class="product-content-right-product-icon-item">
                                <i class="fas fa-envelope"></i>
                                <p>Mail</p>
                            </div>
                        </div>
                        <div class="product-content-right-product-QR">
                            <img src="../images/QR.jfif" alt="">
                        </div>
                        <div class="product-content-right-bottom">
                            <div class="product-content-right-bottom-top">
                                &#8744;
                            </div>
                            <div class="product-content-right-bottom-content-big active">
                                <div class="product-content-right-bottom-content-title row">
                                    <div class="product-content-right-bottom-content-title-item chitiet">
                                        <p>Chi tiết</p>
                                    </div>
                                    <div class="product-content-right-bottom-content-title-item baoquan">
                                        <p>Bảo quản</p>
                                    </div>
                                    <div class="product-content-right-bottom-content-title-item  size1">
                                        <p>
                                            Tham khảo size
                                        </p>
                                    </div>
                                </div>
                                <div class="product-content-right-bottom-content">
                                    <div class="product-content-right-bottom-content-detail">
                                        <p>${p.description}</p>
                                    </div>
                                    <div  style="display:none"class="product-content-right-bottom-content-baoquan">
                                        <p>Chi tiết bảo quản sản phẩm : * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.</p>
                                    </div>
                                    <div style="display:none"class="product-content-right-bottom-content-size">
                                        <p>M (40-47)Kg </p>
                                        <p>L (48-55)Kg </p>
                                        <p>XL (56-63)Kg </p>
                                        <p>2XL(64-70)Kg </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>


        <!--  section -->
        <div class="product-related container">
            <div class="product-related-title">
                <p>Sản phẩm liên quan</p>
            </div>
            <div class="product-content row">

                <c:forEach items="${requestScope.listLQ}" var="p">
                    <div class="product-related-item">
                        <a href="product?pid=${p.pid}">
                            <img src="./images/product/allp/${p.image}" alt="">
                            <h3>${p.name} </h3>
                            <p><span style="color:red"class="new_price">${p.price/2}00<sup>đ</sup></span>
                                <span class="old_price">${p.price}00<sup>đ</sup></span></p>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
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
        <script src="./js/home.js"></script>

    </body>

</html>
