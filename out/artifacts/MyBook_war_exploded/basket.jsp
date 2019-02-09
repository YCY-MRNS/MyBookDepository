<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/defaultSetting.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header-warp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/basket-page.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer-warp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
</head>

<script type="text/javascript">

    $(function () {
        $(".item-increase").click(function () {
            var id = this.id.substr(14);
            var $input = $("#item-input-" + id);
            var num = $input.val();
            var quantity = parseInt(num) + 1;
            $input.val(quantity);
            post(id, quantity);
        })
    });

    $(function () {
        $(".item-reduce").click(function () {
            var id = this.id.substr(12);
            var $input = $("#item-input-" + id);
            var num = $input.val();
            var quantity = parseInt(num) - 1;
            if (quantity === 0) {
                var flag = confirm("是否要删除该本书！");
                if (flag) {
                    window.location.href = "/MyBook_war_exploded/bookServlet?method=deleteCart&id=" + id;
                }
            } else {
                $input.val(quantity);
                post(id, quantity);
            }
        });
    });

    var post = function (id, quantity) {
        var url = "bookServlet";
        var args = {
            "method": "updateItemQuantity",
            "id": id,
            "quantity": quantity,
            "time": new Date()
        };

        $.post(url, args, function (data) {
            var bookNumber = data.bookNumber;
            var totalMoney = data.totalMoney;
            var perPrice = data.perPrice;

            $(".nav-total-num").text(bookNumber);
            $("#perPrice_" + id).text("￥" + perPrice);
            $(".nav-total-price").text("人民币 ￥" + totalMoney);

        }, "JSON");
    };

    $(function () {
        $(":text").on("input change propertychange blur", function () {
            var id = $.trim(this.name);
            var quantity = $.trim(this.value);
            post(id, quantity);
        })
    })

</script>
<body>

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
        <form action="bookServlet" method="get" id="book-search-form">
            <input type="hidden" name="method" value="getBooks">
            <input type="text" name="title" placeholder="搜索书名关键字/标题" value="${param.title}">
            <input class="btn btn-search" type="submit" value="搜索">
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
        <span class="nav-total-price">人民币 ￥ ${sessionScope.shoppingCart.totalPrice}</span>
        <span>已有<a class="nav-total-num" href="">${sessionScope.shoppingCart.bookNum}</a>本&nbsp;<i
                class="fa fa-shopping-basket"></i></span>
    </div>

</div>

<div class="content-wrap">
    <h1>购物车</h1>

    <div class="checkout-head-warp">
        <div class="check-head">
            <div class="basket-msg">
                <i class="fa fa-shopping-basket" style="font-size: 1.8rem;margin: 0 .5rem 0 0"></i>
                <div>在你的购物车中有<a style="font-weight: bold" class="nav-total-num"
                                href="">${sessionScope.shoppingCart.bookNum}</a>本书,总价为<span
                        class="nav-total-price"
                        style="font-weight: bold">人民币 ￥ ${sessionScope.shoppingCart.totalPrice}</span></div>
            </div>
            <div class="checkout-pay">
                <a class="btn btn-checkout" href="bookServlet?method=checkout">支付</a>
            </div>
        </div>
        <div class="checkout-before"><p>在下订单时，您确认已阅读并同意我们的条款和条件.详细请阅读
            <span style="text-decoration: underline">隐私政策</span>和<span style="text-decoration: underline">购物保障</span>.
        </p></div>
    </div>

    <div class="basket-page">
        <div class="basket-head"><h2>购物车细节</h2></div>
        <c:forEach items="${sessionScope.shoppingCart.items}" var="items">
            <div class="basket-item">
                <div class="item-info-warp">
                    <div class="item-img"><img src="${items.book.img}" alt=""></div>
                    <div class="item-info">
                        <h2><a href="#" class="title">${items.book.title}</a></h2>
                        <span class="press">${items.book.press}</span>
                        <span class="author">${items.book.author}</span>
                        <span class="price">￥${items.book.price}</span>
                        <p class="availablity-text">Available - dispatched from the UK in 1 business day</p>
                    </div>
                </div>
                <div class="item-operation">
                    <div class="item-quantity">
                        <a id="item-reduce-${items.book.id}" class="item-reduce">-</a>
                        <input class="item-input" id="item-input-${items.book.id}" type="text" name="${items.book.id}"
                               value="${items.quantity}">
                        <a id="item-increase-${items.book.id}" class="item-increase">+</a>
                    </div>
                    <p class="item-total-price" id="perPrice_${items.book.id}">￥${items.bookMoney}</p>
                    <a href="bookServlet?method=deleteCart&currentPage=${param.currentPage}&id=${items.book.id}"
                       class="btn btn-remove">删除</a>
                </div>
            </div>
        </c:forEach>
    </div>

    <script>
        $(function () {
            $(".btn-remove").click(function () {
                var title = $(".title").text();
                return confirm("是否要删除《" + title + "》吗？");
            })
        });
    </script>

    <div class="basket-checkout">

    </div>

    <div class="btn-continue-warp">
        <a href="bookServlet?method=getBooks&currentPage=${param.currentPage}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}&title=${param.title}&mode=${param.mode}"
           class="btn btn-continue">继续购物</a>
    </div>

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
        <h4>支持帮助</h4>
        <ul>
            <li><a href="">帮助</a></li>
            <li><a href="">联系我们</a></li>
        </ul>
    </section>
    <section class="footer-link">
        <h4>加入我们</h4>
        <ul>
            <li><a href="">附属公司</a></li>
            <li><a href="">工作</a></li>
        </ul>
    </section>
    <section class="footer-link">
        <h4>重要</h4>
        <ul>
            <li><a href="">隐私政策</a></li>
            <li><a href="">条款</a></li>
            <li><a href="">购物保障</a></li>
            <li><a href="">可访问性</a></li>
        </ul>
    </section>
</div>

</body>
</html>
