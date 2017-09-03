<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../common/lib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>首页</title>
    <script src="<%=path%>/staticState/js/APP/register.js"></script>
    <script type="text/javascript" charset="utf-8">
        mui.init();
    </script>
    <script src="<%=path%>/staticState/js/APP/beforeIndex.js"></script>
</head>

<body>
<input type="hidden" value="0" id="babyName">
<div  class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <nav class="mui-bar mui-bar-tab">
            <a id="defaultTab" class="mui-tab-item mui-active" href="http://10.0.8.18:8080/DearBaby/member/homePage.html">
                <span class="mui-icon mui-icon-home"></span>
                <span class="mui-tab-label">宝贝家</span>
            </a>
            <a class="mui-tab-item" href="http://10.0.8.18:8080/DearBaby/member/parenting.html">
                <span class="mui-icon mui-icon-phone"></span>
                <span class="mui-tab-label">育儿</span>
            </a>
            <a class="mui-tab-item" href="http://10.0.8.18:8080/DearBaby/member/shoppingMall.html">
                <span class="mui-icon mui-icon-email"></span>
                <span class="mui-tab-label">商城</span>
            </a>
            <a class="mui-tab-item" href="http://10.0.8.18:8080/DearBaby/member/news.html">
                <span class="mui-icon mui-icon-chatbubble"></span>
                <span class="mui-tab-label">消息</span>
            </a>
            <a class="mui-tab-item" href="http://10.0.8.18:8080/DearBaby/member/more.html">
                <span class="mui-icon mui-icon-more"></span>
                <span class="mui-tab-label">更多</span>
            </a>
        </nav>

        <div class="mui-off-canvas-backdrop"></div>
    </div>
</div>

</body>
<script>


</script>
</html>
