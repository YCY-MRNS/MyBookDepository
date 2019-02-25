<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>支付</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/defaultSetting.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer-warp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout-page.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>

</head>

<body>

<div class="head-wrap">

    <h2 class="head-text">Book Depository</h2>

</div>


<div class="content-wrap">

    <div class="content-left">

        <div class="head-process">

            <span class="process-step-1">1.填写信息</span>
            <span class="process-step-2">2.订单支付</span>

        </div>

        <div class="checkout-info">

            <div class="user-form">

                <form action="bookServlet?method=payment" method="post" name="">

                    <h2>1.配送地址</h2>

                    <div class="form-wrap delivery-address-form">

                        <label for="username"> 名字<span> *</span></label><br>
                        <input type="text" name="username" id="username"><br>
                        <p>举例：张三/李四</p>

                        <label for="city">镇/市<span> *</span></label><br>
                        <input type="text" name="city" id="city"><br>
                        <p>举例：XX市</p>

                        <label for="county">区县</label><br>
                        <input type="text" name="county" id="county"><br>
                        <p>举例：XX区/XX县</p>

                        <label for="street">街道<span> *</span></label><br>
                        <input type="text" name="street" id="street"><br>
                        <p>举例：XX路xxx号xx栋xx单元xx楼xx号</p>

                        <label for="ZIP">邮编<span> *</span></label><br>
                        <input type="number" name="ZIP" id="ZIP"><br>
                        <p>举例：40004. 若没有,请忽略.</p>

                    </div>

                    <h2>2.支付</h2>

                    <div class="form-wrap pay-form">
                        <label for="card-type">卡种</label><br>
                        <select name="card-type" id="card-type">
                            <option value="0">请选择</option>
                            <option value="1">中国银行</option>
                            <option value="2">农业银行</option>
                            <option value="3">建设银行</option>
                        </select><br>

                        <label for="card-number">卡号<span> *</span></label><br>
                        <input type="number" name="card-number" id="card-number"><br>
                        <c:if test="${!empty requestScope.error}">
                            <p class="error">${requestScope.error}</p>
                        </c:if>

                        <input type="submit" value="现在购买" class="btn btn-now-pay">

                    </div>

                </form>

            </div>

        </div>

    </div>

    <div class="content-right">

        <div class="basket-card">

            <div class="card-head">
                <h3>我的购物车</h3>
                <div class="card-total">
                    <i class="fa fa-shopping-basket"><span> ${sessionScope.shoppingCart.bookNum}件</span></i>
                    <span>￥${sessionScope.shoppingCart.totalPrice}</span>
                </div>
            </div>

            <div class="card-info">
                <c:forEach items="${sessionScope.shoppingCart.items}" var="items">
                    <dl>
                        <dt>
                            <h3>${items.book.title}</h3>
                            <p>${items.book.author}</p>
                            <p>${items.book.press}</p>
                            <p>x ${items.quantity}</p>
                        </dt>
                        <dd>￥${items.bookMoney}</dd>
                    </dl>
                </c:forEach>
                <dl>
                    <dt>小计</dt>
                    <dd>￥${sessionScope.shoppingCart.totalPrice}</dd>
                </dl>
                <dl>
                    <dt>邮费</dt>
                    <dd>￥0.00</dd>
                </dl>
                <dl>
                    <dt>总价</dt>
                    <dd style="font-size: 1.8rem;color: #ff0072;font-weight: bold">
                        ￥${sessionScope.shoppingCart.totalPrice}</dd>
                </dl>

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

</body>
</html>
