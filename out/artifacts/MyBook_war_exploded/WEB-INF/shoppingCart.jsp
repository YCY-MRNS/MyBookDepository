<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<html>

<head>
    <title>购物车</title>
    <link rel="stylesheet" href="${path}/css/defaultSetting.css">
    <link rel="stylesheet" href="${path}/css/cart.css">
    <link rel="stylesheet" href="${path}/font/css/font-awesome.min.css">
    <script type="text/javascript" src="${path}/js/jquery-3.3.1.min.js"></script>
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

            $("#highlight-num").text(bookNumber);
            $("#perPrice_" + id).text("￥" + perPrice);
            $("#highlight-all-price").text("￥" + totalMoney);

        }, "JSON");
    };

    // var formatPrice= function(Str){
    //     if (/[.]/.test(Str)) {
    //         var dot = Str.indexOf(".");
    //         return Str.substr(0, dot) + Str.substr(dot, 3);
    //     }
    //     return Str + ".00";
    // };

    $(function () {
        $(":text").on("input change propertychange blur", function () {
            var tr = $(this).parent().parent();
            var title = $.trim(tr.find("td:nth-child(2)").find("a").text());
            var id = $.trim(this.name);
            var quantity = $.trim(this.value);
            post(id, quantity);
        })
    })

</script>

<body>


<div class="cart-info">
    <c:if test="${!empty sessionScope.shoppingCart}">
        <ul class="shopping_title">
            <li class="f1">选中</li>
            <li class="f2">商品信息</li>
            <li class="f3">单价（元）</li>
            <li class="f4">数量</li>
            <li class="f4">金额（元）</li>
            <li class="f5">操作</li>
        </ul>

        <table>
            <c:forEach items="${sessionScope.shoppingCart.items}" var="items">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <img src="${items.book.img}" alt="">
                        <a href="">${items.book.title}</a>
                    </td>
                    <td><span>￥${items.book.price}</span></td>
                    <td class="quantity">
                        <a id="item-reduce-${items.book.id}" class="item-reduce">-</a>
                        <input class="item-input" id="item-input-${items.book.id}" type="text" name="${items.book.id}"
                               value="${items.quantity}">
                        <a id="item-increase-${items.book.id}" class="item-increase">+</a>
                    </td>
                    <td><span id="perPrice_${items.book.id}">￥${items.bookMoney}</span></td>
                    <td>
                        <a href="${path}/bookServlet?method=deleteCart&currentPage=${param.currentPage}&id=${items.book.id}"
                           class="item-delete"><i class="fa fa-times" aria-hidden="true"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <script>
            $(function () {
                $(".item-delete").click(function () {
                    var tr = $(this).parent().parent();
                    var title = $.trim(tr.find("td:nth-child(2)").find("a").text());
                    return confirm("是否要删除《" + title + "》吗？");
                })
            });
        </script>

        <div class="cart-settlement">
            <span>&nbsp;&nbsp;&nbsp;&nbsp;
                <label><input type="checkbox"></label>全选
            </span>
            <a class="batch-delete" href="">批量删除</a>
            <span class="chosen">已选择
                <span id="highlight-num" class="highlight">${sessionScope.shoppingCart.bookNum}</span>件商品
            </span>
            <span class="totalPrice">总计(不含邮费)
                <span id="highlight-all-price" class="highlight">￥ ${sessionScope.shoppingCart.totalPrice}</span>
            </span>
            <a class="settlement" href="">结算</a>
        </div>
    </c:if>
</div>

</body>
</html>
