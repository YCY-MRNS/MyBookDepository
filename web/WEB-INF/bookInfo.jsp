<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<html>
<head>
    <title>书本信息</title>
    <link rel="stylesheet" href="${path}/css/defaultSetting.css">
    <link rel="stylesheet" href="${path}/css/book_show_info.css">
    <link rel="stylesheet" href="${path}/font/css/font-awesome.min.css">
</head>
<body>

<div class="all">

    <div class="book-details">
        <div class="photo">
            <img src="${requestScope.singleBookInfo.img}" alt="">
        </div>
        <div class="text">
            <div class="title">${requestScope.singleBookInfo.title}<span>电子书</span></div>
            <div class="price">
                <div>售价:￥<a href="">${requestScope.singleBookInfo.price}</a></div>
                <div>促销: <span>满额减</span></div>
            </div>
            <div class="info">
                <div><p>作者</p>:<a href="">${requestScope.singleBookInfo.author}</a></div>
                <div><p>出版社</p>:<a href="">${requestScope.singleBookInfo.press}</a></div>
                <div><p>出版时间</p>:<a>${requestScope.singleBookInfo.published}</a></div>
                <div><p>字数</p>:<a>${requestScope.singleBookInfo.words}万</a></div>
                <div><p>所属分类</p>:<a href="">${requestScope.singleBookInfo.type}</a></div>
            </div>
            <div class="btn">
                <a href="" class="nowToPlay">立即购买</a>
                <a href="" class="toCart"><i class="fa fa-shopping-cart"></i>加入购物车</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
