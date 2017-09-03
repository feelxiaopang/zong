<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/18
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <style type="text/css">
        body {
            background-color: #000000;
        }
    </style>
</head>
<body>

<div id="small" class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 主页面标题 -->
        <header class="mui-bar mui-bar-nav" style="background-color: #f7b928;">
            <a href="<%=path%>/member/babyAlbum.html?baby_id=${baby_id}"
               class="mui-icon mui-icon-left-nav mui-pull-left"
               style="color: white;padding:0px;margin-top:2%;">
                <span style="font-size: 18px;margin-left:-11px;">
                    返回
                </span>
            </a>
            <h1 class="mui-title" style="color:white;">
                <c:if test="${timeType==0}">最近上传</c:if>
                <c:if test="${timeType==1}">所有照片</c:if>
            </h1>
        </header>

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll"
                 style="width:100%;height: 100%;padding:0px;vertical-align:middle;background: #f3f3f3;">
                <div class="image"
                     style="width: 23%;height: 100px;margin:1.5% 0px 0px 1.5%;overflow:hidden;float:left;">
                    <c:if test="${timeType==0}">
                        <c:forEach items="${nearPhoto}" var="nearPhoto">
                            <img src="<%=path%>/staticState/imgs/${nearPhoto.photo_url}" style="height: 100%;">
                        </c:forEach>
                    </c:if>
                    <c:if test="${timeType==1}">
                        <c:forEach items="${allPhoto}" var="allPhoto">
                            <img src="<%=path%>/staticState/imgs/${allPhoto.photo_url}" style="height: 100%;">
                        </c:forEach>
                    </c:if>
                    <c:forEach items="${growthEvents}" var="growthEvents">
                        <img src="<%=path%>/staticState/imgs/${growthEvents.event_photo}" style="height: 100%;">
                    </c:forEach>
                </div>

            </div>
        </div>

    </div>
</div>
<script>
    /*点击a标签跳转*/
    mui('body').on('tap', 'a', function () {
        document.location.href = this.href;
    });

    $(".image").css("height", $(".image").width());
</script>
</body>
</html>
