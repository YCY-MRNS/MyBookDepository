<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set value="pageContext.request.contextPath" var="path"/>
<html>
<head>
    <title>空车</title>
    <link rel="stylesheet" href="css/defaultSetting.css">
    <link rel="stylesheet" href="css/empty-page.css">
    <link rel="stylesheet" href="font/css/font-awesome.min.css">

</head>
<body>

<div class="page-slide">
    <div class="user-nav-warp">

        <ul class="left-nav">
            <li><a href="#" class="fa fa-home" style="font-size: 2.5rem"></a></li>
            <li><a href="#"><i class="fa fa-envelope-o"></i>&nbsp;&nbsp;联系我们</a></li>
            <li><a href="#"><i class="fa fa-info-circle"></i>&nbsp;&nbsp;帮助</a></li>
        </ul>

        <ul class="right-nav">
            <li><a href="#"><i class="fa fa-th-list"></i>&nbsp;&nbsp;我的订单</a></li>
            <li><a href="#"><i class="fa fa-heart"></i>&nbsp;&nbsp;收藏</a></li>
            <li><a href="#"><i class="fa fa-user-circle"></i>&nbsp;&nbsp;登录/注册</a></li>
        </ul>

    </div>

    <div class="header-wrap">

        <div class="logo">
            <div>Book</div>
            <div>Depository</div>
        </div>

        <div class="search-wrap">
            <form action="">
                <input type="text" placeholder="搜索书名关键字/标题/作者/出版社">
                <button type="submit" value="搜索">搜索</button>
            </form>
        </div>

    </div>
    <div class="secondary-header-wrap">
        <ul class="page-links">
            <li>
                <a href="">目录</a>&nbsp;&nbsp;
                <i class="fa fa-chevron-down"></i>
                <span class="nav-line"></span>
            </li>
            <li>
                <a href="">最畅销书</a>
                <span class="nav-line"></span>
            </li>
            <li>
                <a href="">最近上架</a>
                <span class="nav-line"></span>
            </li>
            <li>
                <a href="">打折货</a>
                <span class="nav-line"></span>
            </li>
        </ul>

        <div class="shopping-cart">
            <span>RMB ￥ 12.4</span>
            <span class="total-num">1本<i class="fa fa-shopping-basket"></i></span>
        </div>
    </div>

    <div class="content-wrap">
        <h1>你的购物车</h1>
        <div class="content-block">
            <div class="book-warp">
                <div class="book-item">
                    <div class="book-img">
                        <img src="http://img60.ddimg.cn/digital/product/94/22/1901109422_ii_cover.jpg?version=256fcf6c-d4d0-4e1c-92be-0065a63457b4"
                             alt="">
                    </div>
                    <div class="book-info">
                        <h3 class="title">Java Persistence with Hibernate</h3>
                        <p class="author">Christian Bauer</p>
                        <p class="published">08 Nov 2015</p>
                        <p class="press">Paperback</p>
                        <p class="price">US047.80</p>
                    </div>
                    <div class="book-activity">
                        <a href="">添加到购物车</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-size-nav"></div>
    </div>

    <div class="footer-social-warp">
        <h4>联系我</h4>
        <ul>
            <li><a href="" class="fa fa-github"></a></li>
            <li><a href="" class="fa fa-google"></a></li>
            <li><a href="" class="fa fa-qq"></a></li>
            <li><a href="" class="fa fa-weixin"></a></li>
            <li><a href="" class="fa fa-weibo"></a></li>
        </ul>
    </div>

    <div class="footer-warp">
        <section class="footer-link">
            <h4>关于</h4>
            <ul>
                <li><a href="">关于我们</a></li>
                <li><a href="">网站地图</a></li>
                <li><a href="">书签</a></li>
                <li><a href="">登录/注册</a></li>
            </ul>
        </section>
        <section class="footer-link">
            <h4>关于</h4>
            <ul>
                <li><a href="">关于我们</a></li>
                <li><a href="">网站地图</a></li>
                <li><a href="">书签</a></li>
                <li><a href="">登录/注册</a></li>
            </ul>
        </section>
        <section class="footer-link">
            <h4>关于</h4>
            <ul>
                <li><a href="">关于我们</a></li>
                <li><a href="">网站地图</a></li>
                <li><a href="">书签</a></li>
                <li><a href="">登录/注册</a></li>
            </ul>
        </section>
        <section class="footer-link">
            <h4>关于</h4>
            <ul>
                <li><a href="">关于我们</a></li>
                <li><a href="">网站地图</a></li>
                <li><a href="">书签</a></li>
                <li><a href="">登录/注册</a></li>
            </ul>
        </section>
        <section class="footer-link">
            <h4>关于</h4>
            <ul>
                <li><a href="">关于我们</a></li>
                <li><a href="">网站地图</a></li>
                <li><a href="">书签</a></li>
                <li><a href="">登录/注册</a></li>
            </ul>
        </section>
    </div>

    <%--<a href="${pageContext.request.contextPath}/book.jsp">继续购物</a>--%>
</body>
</html>
