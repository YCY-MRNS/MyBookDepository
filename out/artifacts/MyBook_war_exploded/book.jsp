<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set value="pageContext.request.contextPath" var="path"/>
<c:set value="bookServlet?method=getBooks&" var="getBook"/>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/defaultSetting.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index-page.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header-warp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer-warp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
</head>

<script type="text/javascript">
    $(function () {
        var serializeVal = $(":hidden.jumpPage").serialize();
        $("a").click(function () {
            window.location.href = this.href + "&" + serializeVal;
            return false;
        })
    });


    $(function () {
        $("#btn-toSomePage").click(function () {
            var serializeVal = $(":hidden").serialize();
            var $toPage = $(".toSomePage").find("input:first");
            var pages = parseInt($toPage.val());
            window.location.href = "bookServlet?method=getBooks&currentPage=" + pages + "&" + serializeVal;
        })
    });

    $(function () {
        var serializeVal = $(":hidden").serialize();
        $(".btn-search").click(function () {
            window.location.href = this.href + "&" + serializeVal;
        })
    });


</script>

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
            <form action="bookServlet" method="get" id="book-search-form">
                <input type="hidden" name="method" value="getBooks">
                <input type="text" name="title" placeholder="搜索书名关键字/标题" value="${param.title}">
                <input class="btn-search" type="submit" value="搜索">
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
            <span>已有<a class="nav-total-num"
                       href="bookServlet?method=toCart&currentPage=${requestScope.books.pageNo}&id=${param.id}">${sessionScope.shoppingCart.bookNum}</a>本&nbsp;<i
                    class="fa fa-shopping-basket"></i></span>
        </div>

    </div>

    <div class="content-wrap">

        <h1>书籍</h1>
        <div class="content-nav">
            <div class="page-size-block">

                <c:if test="${!empty param.title}">
                    <div class="show-info">
                        <h4>搜索到 ${param.title} 的书籍 , 共有 ${requestScope.books.totalNumber} 条数据</h4>
                    </div>
                </c:if>

                <div class="book-condition">
                    <form action="bookServlet?method=getBooks" method="get" id="condition-form">
                        <input type="hidden" name="method" value="getBooks">
                        <input type="hidden" name="title" value="${requestScope.title}">

                        <label>
                            <select id="condition-mode" name="mode" class="${requestScope.mode}"
                                    onchange="this.form.submit()">
                                <option value="default" selected="selected">默认</option>
                                <option value="orderByPriceDesc">价格 由高到低</option>
                                <option value="orderByPriceAsc">价格 由低到高</option>
                                <option value="orderByPublishedDesc">出版时间 由高到底</option>
                                <option value="orderByPublishedAsc">出版时间 由低到高</option>
                            </select>
                        </label>
                    </form>
                </div>

                <script>
                    $(function () {
                        var mode = $("#condition-mode").attr("class");
                        $("#condition-mode").val(mode);
                    })
                </script>

                <div class="page-size">
                    <c:if test="${requestScope.books.hasPrev}">
                        <a href="${getBook}currentPage=1">首页</a>
                        <a href="${getBook}currentPage=${requestScope.books.prevPage}">${requestScope.books.prevPage}</a>
                    </c:if>

                    <a class="current-page"
                       href="${getBook}currentPage=${requestScope.books.pageNo}">${requestScope.books.pageNo}</a>

                    <c:if test="${requestScope.books.hasNext}">

                        <a href="${getBook}currentPage=${requestScope.books.nextPage}">${requestScope.books.nextPage}</a>
                        <c:if test="${requestScope.books.hasEllipsis}">
                            <span>...</span>
                        </c:if>

                        <c:if test="${!requestScope.books.hasLastPage}">
                            <a href="${getBook}currentPage=${requestScope.books.totalPagesNumber}">${requestScope.books.totalPagesNumber}</a>
                        </c:if>

                    </c:if>

                </div>
            </div>
        </div>

        <input class="jumpPage" type="hidden" name="minPrice" value="${param.minPrice}">
        <input class="jumpPage" type="hidden" name="maxPrice" value="${param.maxPrice}">
        <input class="jumpPage" type="hidden" name="title" value="${requestScope.title}">
        <input class="jumpPage" type="hidden" name="mode" value="${requestScope.mode}">

        <div class="content-block">
            <div class="book-warp">
                <c:forEach items="${requestScope.books.list}" var="book">
                    <div class="book-item">
                        <div class="book-img">
                            <img src="${book.img}" alt="${book.title}">
                        </div>
                        <div class="book-info">
                            <h3 class="title">
                                <a href="bookServlet?method=getSingleBook&currentPage=${requestScope.books.pageNo}&id=${book.id}">${book.title}</a>
                            </h3>
                            <p class="author">${book.author}</p>
                            <p class="published">${book.published}</p>
                            <p class="press">${book.press}</p>
                            <p class="price">￥${book.price}</p>
                        </div>
                        <div class="book-activity">
                            <a class="toShoppingCart item_${book.id}" name="${book.title}" href="#">添加到购物车</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <script type="text/javascript">
            $(function () {
                $(".toShoppingCart").click(function () {
                    var className = $(this).attr("class");
                    var title = $(this).attr("name");
                    console.log(className + "加入购物车");
                    var url = "bookServlet";
                    var method = "addToCart";
                    var id = className.substr(20);
                    console.log(className.substr(20));

                    var args = {
                        "method": method,
                        "id": id,
                        "time": new Date()
                    };

                    var flag = confirm("确定将 " + title + " 放入购物车中吗？");
                    if (flag) {
                        $.post(url, args, function (data) {
                            var shoppingItemNumber = data.shoppingItemNumber;
                            var totalPrice = data.totalPrice;
                            $(".nav-total-price").text("人民币 ￥ " + totalPrice);
                            $(".nav-total-num").text(shoppingItemNumber);
                        }, "JSON")
                    }
                })
            })

        </script>

        <div class="page-size-block">
            <div class="page-size">
                <c:if test="${requestScope.books.hasPrev}">
                    <a href="bookServlet?method=getBooks&currentPage=1">首页</a>
                    <a href="bookServlet?method=getBooks&currentPage=${requestScope.books.prevPage}">${requestScope.books.prevPage}</a>
                </c:if>

                <a class="current-page"
                   href="bookServlet?method=getBooks&currentPage=${requestScope.books.pageNo}">${requestScope.books.pageNo}</a>

                <c:if test="${requestScope.books.hasNext}">

                    <a href="bookServlet?method=getBooks&currentPage=${requestScope.books.nextPage}">${requestScope.books.nextPage}</a>
                    <c:if test="${requestScope.books.hasEllipsis}">
                        <span>...</span>
                    </c:if>

                    <c:if test="${!requestScope.books.hasLastPage}">
                        <a href="bookServlet?method=getBooks&currentPage=${requestScope.books.totalPagesNumber}">${requestScope.books.totalPagesNumber}</a>
                    </c:if>

                </c:if>

                <div class="toSomePage">
                    第&nbsp;${param.toSomePage}<label><input type="text" size="1" id="toSomePage" name="${param.title}"></label>&nbsp;页
                    <input type="submit" class="button" id="btn-toSomePage" value="确定">
                </div>
            </div>
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

</div>

</body>
</html>
