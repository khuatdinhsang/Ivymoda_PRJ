<%-- 
    Document   : listUser.jsp
    Created on : Oct 24, 2022, 10:21:17 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="b" class="dal.ProductDAO" scope="request"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link type="text/css" rel="stylesheet" href="./css/app.css">
        <link type="text/css" rel="stylesheet" href="./css/base.css">
        <title>List Account Page</title>
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
            .active,
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

            </div>
            <h3 style="text-align: center">Số hàng trong kho: ${requestScope.sum}</h3>
            <table border="1px"style=" width:80%; margin:auto; text-align: center">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.listCategory}" var="a" varStatus="loop">
                        <tr>
                            <td>${loop.index +1}</td>   
                            <td>${a.cid}</td>
                            <td>${a.name}</td>
                            <td>${b.getQuantityBycId(a.cid)}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
            <script type="text/javascript">
        // Add active class to the current button (highlight it)
        var header = document.getElementById("myDIV");
        var btns = header.getElementsByClassName("btn");
        for (var i = 0; i < btns.length; i++) {
            btns[i].addEventListener("click", function() {
                var current = document.getElementsByClassName("active");
                current[0].className = current[0].className.replace("active", "");
                this.className += " active";
            });
        }
    </script>
    </body>
</html>
