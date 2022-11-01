<%-- 
    Document   : user_profile
    Created on : Oct 19, 2022, 7:49:06 PM
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
        <link rel="stylesheet" href="./css/register.css">
        <title>UserInfo Page</title>
        <style>
            .btn {
                border: none;
                outline: none;
                padding: 10px 16px;
                background-color: #f1f1f1;
                cursor: pointer;
                font-size: 18px;
            }

            #myDIV a {
                text-decoration: none;
            }
            /* Style the active class, and buttons on mouse-over */

            .active{
                background-color: #666;
                color: white;
            }
            .btn:hover {
                background-color: #666;
                color: white;
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
        <c:set value="${requestScope.user}" var="u"></c:set>
            <section class="user">
                <div class="container" style="margin-top:20px">
                <c:if test="${sessionScope.account.role==1}">
                    <div id="myDIV" style="margin-top:100px" class="action">
                        <a class="btn active" href="userprofile">Profile</a>
                        <a class="btn" href="listOrder">Order</a>
                        <a class="btn" href="orderHistory">Order History</a>
                        <a class="btn" href="listAccount">Account</a>
                        <a class="btn" href="listUser">User</a>
                        <a class="btn" href="listProduct">Product</a>
                        <a class="btn" href="listCategory">Category</a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.account.role==0}">
                    <div id="myDIV"style="margin-top:100px" class="action">
                        <a class="btn active"  href="userprofile">Profile</a>
                        <a class="btn" href="listOrder">Order</a>
                        <a class="btn" href="orderHistory">Order History</a>
                    </div>
                </c:if>
                <form action="editUser" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="info_customer">
                                <h3>Thông tin khách hàng</h3>
                                <input type="hidden" name="id" value="${sessionScope.account.id}"/>
                                <div class="form_group">
                                    <div class="form_input">
                                        <label for="">Họ: <sup>*</sup></label>
                                        <input type="text" value="${u.firstName}" class="fisrt_name" name="first_name" placeholder="Họ...">
                                    </div>
                                    <div class="form_input">
                                        <label for="">Tên: <sup>*</sup></label>
                                        <input type="text"  value="${u.lastName}" class="last_name" name="last_name"placeholder="Tên...">
                                    </div>
                                </div>
                                <div class="form_group">
                                    <div class="form_input">
                                        <label for="">Ngày sinh: <sup>*</sup></label>
                                        <input type="date" value ="${u.dob}"class="birth" name="dob" placeholder="Ngày sinh...">
                                    </div>
                                    <div class="form_input">
                                        <label for="">Giới tính: <sup>*</sup></label>
                                        <select name="gender" id="" class="gender">
                                            <option ${u.gender=="true"?"selected":""} value="1">Nam</option>
                                            <option ${u.gender=="false"?"selected":""} value="0">Nữ</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form_group">
                                    <div class="form_input">
                                        <label for="">Email: <sup>*</sup></label>
                                        <input type="email" value="${u.email}" name="email"class="city" placeholder="Email">
                                    </div>
                                    <div class="form_input">
                                        <label for="">PhoneNumber<sup>*</sup></label>
                                        <input type="text"value="${u.phone}" name="phone"class="street" placeholder=" Phone...">
                                    </div>
                                </div>
                                <div class="form_input_100 form_input">
                                    <label for="">Địa chỉ:<sup>*</sup></label>
                                    <input  style="padding:10px" value="${u.address}"name="address" id="" class="local"></input>
                                </div>

                            </div>
                        </div>
                    </div>
                    <input style=" padding:10px; color:white; background: black; cursor: pointer" type="submit" value="Save"/>
                </form>

                <div class="col-md-6">
                    <div class="password_customer">
                        <h3>Thông tin tài khoản</h3>
                        <div class="form_input w100">
                            <label for="">Tên đăng nhâp: <sup>*</sup></label>
                            <input type="text" disabled class="password" value="${u.username}" name="username" placeholder="Tên Đăng Nhập...">
                        </div>
                        <div class="form_input w100">
                            <label for="">Mật khẩu: <sup>*</sup></label>
                            <input type="password" disabled value="${u.password}" class="password" name="password" placeholder="Mật khẩu...">
                        </div>
                        <a href="changepass" class="red">Thay đổi mật khẩu </a>
                    </div>
                </div>
            </div>
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
    <script type="text/javascript">
// Add active class to the current button (highlight it)
        var header = document.getElementById("myDIV");
        var btns = header.getElementsByClassName("btn");
        for (var i = 0; i < btns.length; i++) {
            btns[i].addEventListener("click", function () {
                var current = document.getElementsByClassName("active");
                current[0].className = current[0].className.replace(" active", "");
                this.className += " active";
            });
        }
    </script>
</body>
</html>
