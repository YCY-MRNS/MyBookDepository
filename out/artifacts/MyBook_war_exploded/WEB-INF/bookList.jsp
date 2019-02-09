<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<html>
<head>
    <title>书本列表</title>
    <link rel="stylesheet" href="${path}/css/book_show_list.css">
    <link rel="stylesheet" href="${path}/font/css/font-awesome.css">
    <script type="text/javascript" src="${path}/js/jquery-3.3.1.min.js"></script>
</head>

<script type="text/javascript">
    $(function () {
        $("a").click(function () {
            var serializeVal = $(":hidden").serialize();
            window.location.href = this.href + "&" + serializeVal;
            return false;
        })
    });

    $(function () {

        $("ul.book-condition-list li:eq(3)").focusin(function () {
            $("#hint-price").css("opacity", "1");
        });

        $(".price_inp").blur(function () {
            $("#hint-price").css("opacity", "0");
        });
    });

    $(function () {
        $("#btn-toSomePage").click(function () {
            var pages = parseInt($("#toSomePage").val());
            window.location.href = "${path}/bookServlet?method=getBooks&currentPage=" + pages;
        })
    })

</script>

<body>

<div class="all">

    <div class="topNav">
        <div class="top-nav-left"></div>
        <div class="top-nav-right">
            <ul class="top-list">
                <li><a href="">登录</a></li>
                <li>
                    <a href="${path}/bookServlet?method=toCart&currentPage=${requestScope.books.pageNo}&id=${param.id}">
                        <i class="fa fa-shopping-cart"></i>&nbsp;购物车
                        <span>(${sessionScope.shoppingCart.bookNum})</span>
                    </a>
                </li>
                <li><a href="">我的订单</a></li>
                <li><a href="">个人中心</a></li>
                <li><a href="">服务</a></li>
            </ul>
        </div>
    </div>

    <div class="searchBox">
        <div class="logo"></div>
        <div class="search"></div>
    </div>

    <div class="book-condition">
        <input type="hidden" name="minPrice" value="${param.minPrice}">
        <input type="hidden" name="maxPrice" value="${param.maxPrice}">
        <ul class="book-condition-list">
            <li><a href="">综合排序&nbsp;<i class="fa fa-sort-amount-desc "></i></a></li>
            <li><a href="">出版时间&nbsp;<i class="fa fa-sort-amount-desc "></i></a></li>
            <li><a href="">价格&nbsp;<i class="fa fa-sort-amount-desc "></i></a></li>
            <li>
                <form action="${path}/bookServlet?method=getBooks" method="post">
                    ￥<input id="minPrice" class="price_inp" type="text" size="2" name="minPrice"> -
                    ￥<input id="maxPrice" class="price_inp" type="text" size="2" name="maxPrice">
                    <div class="hint-price" id="hint-price">
                        <input type="submit" class="button button-sure" id="btn-yes" value="确定"/>
                        <input type="button" class="button button-clare" id="btn-cal" value="清除"/>
                    </div>
                </form>
            </li>
        </ul>
    </div>

    <div class="book-show-list">
        <c:forEach items="${requestScope.books.list}" var="book">
            <div class="book-info">
                <div class="img">
                    <img src="${book.img}" alt="">
                </div>
                <div class="content">
                    <div class="title">
                        <a href="${path}/bookServlet?method=getSingleBook&currentPage=${requestScope.books.pageNo}&id=${book.id}">${book.title}
                    </a>
                        <span>电子书</span>
                    </div>
                    <div class="price">￥${book.price}</div>
                    <div class="info">
                        <c:if test="${!empty book.author}">
                            <a href="">${book.author}</a>
                        </c:if>
                        <c:if test="${!empty book.published}">
                            /&nbsp;<a href="">${book.published}</a>
                        </c:if>
                        <c:if test="${!empty book.press}">
                            /&nbsp;<a href="">${book.press}</a>
                        </c:if>
                    </div>
                    <p class="desc">${book.content}</p>
                    <div class="btn">
                            <%--${path}/bookServlet?method=addToCart&currentPage=${requestScope.books.pageNo}&id=${book.id}--%>
                        <a href="#" class="toShoppingCart item_${book.id}" name="${book.title}">加入到购物车</a>
                        <a href="#" class="toCollection">收藏</a>
                    </div>
                </div>
            </div>

        </c:forEach>

        <script type="text/javascript">
            $(function () {
                $(".btn").find("a:first").click(function () {
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
                            console.log(shoppingItemNumber);
                            $("ul.top-list li:eq(1)").find("span").text("(" + shoppingItemNumber + ")");
                        }, "JSON")
                    }
                })
            })

        </script>


        <script>
            $(function () {
                $("p.desc").each(function (i) {
                    $(this).text($(this).text().substr(0, 85) + "...");
                });
            })
        </script>

        <div class="page-footer">

            <c:if test="${requestScope.books.hasPrev}">
                <a href="${path}/bookServlet?method=getBooks&currentPage=1">首页</a>
                <a href="${path}/bookServlet?method=getBooks&currentPage=${requestScope.books.prevPage}">${requestScope.books.prevPage}</a>
            </c:if>

            <a class="current-page"
               href="${path}/bookServlet?method=getBooks&currentPage=${requestScope.books.pageNo}">${requestScope.books.pageNo}</a>

            <c:if test="${requestScope.books.hasNext}">
                <a href="${path}/bookServlet?method=getBooks&currentPage=${requestScope.books.nextPage}">${requestScope.books.nextPage}</a>

                <c:if test="${requestScope.books.hasEllipsis}">
                    <span>...</span>
                </c:if>

                <a href="${path}/bookServlet?method=getBooks&currentPage=${requestScope.books.totalPagesNumber}">${requestScope.books.totalPagesNumber}</a>
            </c:if>

            <div class="toSomePage">
                到第${param.toSomePage}<label><input type="text" size="2" id="toSomePage"></label>页
                <input type="submit" class="button" id="btn-toSomePage" value="确定">
            </div>
        </div>
    </div>

</div>
</body>
</html>
