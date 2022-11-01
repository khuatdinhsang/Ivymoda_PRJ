<%-- 
    Document   : category.jsp
    Created on : Oct 19, 2022, 6:47:30 PM
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
        <link rel="stylesheet" href="./css/category.css">
        <title>Category Page</title>
        <style>
            .content{
                margin:auto;
                width: 80%;
                float:left;
                margin-left:30px;
                height:auto;
            }
            .pagination {
                display: inline-block;
            }
            .pagination a {
                color: black;
                font-size: 22px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagination a.active {
                background-color: #4CAF50;
                color: white;
            }
            .pagination a:hover:not(.active) {
                background-color: chocolate;
            }
            .red{
                color:red;
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
        <section class="category">
            <div class="container">
                <div class="row">
                    <div class="category-left">
                        <h1 style="text-align:center; color:red">Bộ Lọc</h1>
                        <form action="search" method="get">
                            <input style="display: none" type="text" name="cid" value="${requestScope.cid}" />
                            <table>
                                <tr>
                                    <th>Color:</th>
                                    <th><input class="i_filter" type="text" name="color" value="${requestScope.color}" /></th>
                                </tr>
                                <tr>
                                    <th>From price:</th>
                                    <th><input class="i_filter" type="number" name="from_price" value="${requestScope.from_price}" /></th>
                                </tr>
                                <tr>
                                    <th>To price:</th>
                                    <th><input class="i_filter" type="number" name="to_price" value="${requestScope.to_price}" /></th>
                                </tr>
                            </table>
                            <input style="text-align: center;
                                   margin-top: 10px;
                                   padding: 5px 10px;
                                   background: red;
                                   cursor: pointer;
                                   border: none;
                                   outline: none;
                                   position: relative;
                                   left: 50%;
                                   transform: translate(-50%, 0);
                                   color: white;"class="s_filter" type="submit" value="Filter" />
                        </form>
                    </div>
                    <div class="category-right ">
                        <div style="width:300px; text-align: right; float:left" class="category-right-top-item">
                            <form id="f1" action="sort">
                                <input style="display: none" type="text" name="cid" value="${requestScope.cid}"/>
                                <select name="sort_price"  onchange="change()">
                                    <option ${requestScope.sortPrice=="0"?"selected":""} value="0">Sắp xếp</option>
                                    <option ${requestScope.sortPrice=="-1"?"selected":""} value="-1">Giá cao đến thấp</option>
                                    <option ${requestScope.sortPrice=="1"?"selected":""}value="1">Giá thấp đến cao</option>
                                </select>
                            </form>
                        </div>

                        <div class="category-right-top-item">
                            <form action="filter" >
                                <input style="display: none" type="text" name="cid" value="${requestScope.cid}"/>
                                Tìm kiếm sản phẩm :<input style="padding:8px"type="text" value="${requestScope.search}" name="search" placeholder="code,ten,mota..."/>
                                <input style="padding:8px 10px; cursor: pointer; background: violet"type="submit" value="Search"/>
                            </form>
                        </div>
                        <div class="category-right-content row">
                            <c:if test="${requestScope.cid==0}">
                                <!--allProduct-->
                                <c:forEach items="${requestScope.data}" var="p">
                                    <div class="category-right-content-item">
                                        <a href="product?pid=${p.pid}">
                                            <img src="./images/product/allp/${p.image}" alt="">
                                            <h1>
                                                ${p.name}
                                            </h1>
                                            <p><span style="color:red"class="new_price">${p.price/2}00<sup>đ</sup></span>
                                                <span class="old_price">${p.price}00<sup>đ</sup></span></p>
                                        </a>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${requestScope.cid!=0}">
                                <!--/*listProductById */-->
                                <c:forEach items="${requestScope.listCate}" var="p">
                                    <div class="category-right-content-item">
                                        <a href="product?pid=${p.pid}">
                                            <img src="./images/product/allp/${p.image}" alt="">
                                            <h1>
                                                ${p.name}
                                            </h1>
                                            <p><span style="color:red"class="new_price">${p.price/2}00<sup>đ</sup></span>
                                                <span class="old_price">${p.price}00<sup>đ</sup></span></p>
                                        </a>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${requestScope.color!=null || requestScope.from_price!=0 || requestScope.to_price!=0}">
                                <c:forEach items="${requestScope.list}" var="p">
                                    <div class="category-right-content-item">
                                        <a href="product?pid=${p.pid}">
                                            <img src="./images/product/allp/${p.image}" alt="">
                                            <h1>
                                                ${p.name}
                                            </h1>
                                            <p><span style="color:red"class="new_price">${p.price/2}00<sup>đ</sup></span>
                                                <span class="old_price">${p.price}00<sup>đ</sup></span></p>
                                        </a>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${requestScope.sortPrice!=null}">
                                <c:forEach items="${requestScope.listSort}" var="p">
                                    <div class="category-right-content-item">
                                        <a href="product?pid=${p.pid}">
                                            <img src="./images/product/allp/${p.image}" alt="">
                                            <h1>
                                                ${p.name}
                                            </h1>
                                            <p><span style="color:red"class="new_price">${p.price/2}00<sup>đ</sup></span>
                                                <span class="old_price">${p.price}00<sup>đ</sup></span></p>
                                        </a>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${requestScope.search!=null}">
                                <c:forEach items="${requestScope.listSearch}" var="p">
                                    <div class="category-right-content-item">
                                        <a href="product?pid=${p.pid}">
                                            <img src="./images/product/allp/${p.image}" alt="">
                                            <h1>
                                                ${p.name}
                                            </h1>
                                            <p><span style="color:red"class="new_price">${p.price/2}00<sup>đ</sup></span>
                                                <span class="old_price">${p.price}00<sup>đ</sup></span></p>
                                        </a>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${requestScope.listSearch.size()==0}">
                                NO PRODUCT
                            </c:if>
                        </div>
                        <c:set value="${requestScope.list}" var="c"/>
                        <c:set var="page" value="${requestScope.page}"/>
                        <div style ="display: flex; justify-content: center; margin-top:20px ;margin-bottom: 20px" class="pagination">
                            <c:if test="${requestScope.cid==0}">
                                <c:forEach begin="${1}" end="${requestScope.num}" var="i" >
                                    <a class="${i==page ?"active":""}"href="category?id=${requestScope.cid}&page=${i}">${i}</a>
                                </c:forEach>
                            </c:if>
                            <c:if test="${requestScope.cid!=0}">
                                <c:forEach begin="${1}" end="${requestScope.numCate}" var="i" >
                                    <a class="${i==page ?"active":""}"href="category?id=${requestScope.cid}&page=${i}">${i}</a>
                                </c:forEach>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </section>
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
    </body>
    <script src="./js/home.js"></script>
    <script>
                                    function change() {
                                        document.getElementById("f1").submit();

                                    }
    </script>
</html>
