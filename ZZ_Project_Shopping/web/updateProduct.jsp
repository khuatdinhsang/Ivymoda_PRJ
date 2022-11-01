<%-- 
    Document   : register.jsp
    Created on : Oct 19, 2022, 7:30:49 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link rel="stylesheet" href="./css/base.css">
        <link rel="stylesheet" href="./css/register.css">
        <link rel="stylesheet" href="./css/app.css">
        <title>UpdateProduct Page</title>
        <style>
            
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


        <section class="register">
            <div class="container">
                <h2 style="text-align:center; font-size: 30px;margin-bottom: 30px;">Update  Product    </h2>
                <form action="updateProduct" method="post">
                    <c:set value="${requestScope.product}" var="p"/>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="info_customer">
                                <input type="text" style="display: none" name="id" value="${p.pid}"/>
                                <div class="form_group">
                                    <div class="form_input">
                                        <label for="">Name:  <sup>*</sup></label>
                                        <input type="text" class="fisrt_name" value="${p.name}"name="name" placeholder="Name">
                                    </div>
                                    <div class="form_input">
                                        <label for="">Code:  <sup>*</sup></label>
                                        <input type="text" class="last_name" value="${p.code}"name="code"placeholder="Code...">
                                    </div>
                                </div>
                                <div class="form_group">
                                    <div class="form_input">
                                      
                                        <label for="">Color: <sup>*</sup></label>
                                        <input type="text" class="birth" name="color" value="${p.color}" placeholder="Color...">
                                    </div>
                                    <div class="form_input">
                                        <label for="">Image <sup>*</sup></label>
                                        <input type="text" class="birth" name="image" value="${p.image}" placeholder="Image...">
                                    </div>
                                </div>
                                <div class="form_group">
                                    <div class="form_input">
                                        <label for="">Price: <sup>*</sup></label>
                                        <input type="number" name="price"class="city" value="${p.price}" placeholder="Price...">
                                    </div>
                                    <div class="form_input">
                                        <label for="">Description<sup>*</sup></label>
                                        <input type="text" name="description"class="description"  value="${p.description}" placeholder=" Description...">
                                    </div>
                                </div>
                                <div class="form_group">
                                    <div class=" form_input">
                                        <label for="">Quantity<sup>*</sup></label>
                                        <input type="text" name="quantity" class="local"  value="${p.quantity}" placeholder="Quantity..."></input>
                                    </div>
                                    <div class=" form_input" >
                                        <label for="">CateID<sup>*</sup></label>
<!--                                        <select name="cateID" value="${p.cateID}">
                                            <option ${p.cateID==1?"selected":""}value="1">1</option>
                                            <option ${p.cateID==2?"selected":""}value="2">2</option>
                                            <option ${p.cateID==3?"selected":""}value="3">3</option>
                                            <option ${p.cateID==4?"selected":""}value="4">4</option>
                                            <option ${p.cateID==5?"selected":""}value="5">5</option>
                                        </select>-->
                                        <input type="number" readonly value="${p.cateID}" name="cateID"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input style=" padding:10px; color:white; background: black; cursor: pointer" type="submit" value="Save"/>
                    <a style=" padding:10px; color:white; background: blue; cursor: pointer" href="listProduct">Back</a>
                </form>
            </div>
        </section>

        <script src="./js/home.js"></script>
    </body>
</html>
