<%--
  Created by IntelliJ IDEA.
  User: wujie
  Date: 2017/7/5
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>
    </title>
    <script src="<%=path%>/staticState/js/APP/register.js"></script>
    <script src="<%=path%>/staticState/js/APP/iconfont.js"></script>

    <style type="text/css">
        body {
            background-color: #000000;
        }
    </style>
</head>

<body>
<!-- 侧滑导航根容器 -->

<!-- 菜单容器 -->

<!-- 主页面容器 -->
<div class="mui-inner-wrap">
    <!-- 主页面标题 -->
    <header class="mui-bar mui-bar-nav" style="background-color: #FFC028">
            <a class="mui-icon mui-icon-left-nav mui-pull-left" href="homePage.html"></a>
        <h1 class="mui-title" style="color:white">宝宝</h1>
    </header>
    <div id="offCanvasContentScroll" class="mui-content mui-scroll-wrapper">
        <div class="mui-scroll">
            <div style="height: 15px"></div>
            <div style="height: 95px">
                <%--作为标题空白处--%>
                <a href="addBaby.html" style="color: #4f4f4f">
                    <div style="width: 50%;border-top: 1px solid #D1D1D1;border-bottom: 1px solid #D1D1D1;height: 80px;float: left ">
                        <div style="width: 52px;height: 50px;padding-top: 5px">
                            <svg class="icon" aria-hidden="true" style=" width: 40px; height: 40px;
                vertical-align: -0.15em;
                fill: currentColor;
                overflow: hidden;
                  color: #8d8888">
                                <use xlink:href="#icon-baobao"></use>
                            </svg>
                        </div>
                        <div style="width:100%;height: 28px;text-align: center;">
                            <span style="">添加我的宝宝</span>
                        </div>
                    </div>
                </a>
                <a href="#" style="color: #4f4f4f">
                    <div style="width: 50%;border-top: 1px solid #D1D1D1;border-bottom: 1px solid #D1D1D1;border-left:1px solid #D1D1D1 ;height: 80px;float: left">
                        <div style="width: 52px;height: 50px;padding-top: 5px">
                            <svg class="icon" aria-hidden="true" style=" width: 40px; height: 40px;
                vertical-align: -0.15em;
                fill: currentColor;
                overflow: hidden;
                  color: #8d8888">
                                <use xlink:href="#icon-jianpan"></use>
                            </svg>
                        </div>
                        <div style="width: 100%;height: 28px;text-align: center;">
                            <span>输入邀请码</span>
                        </div>
                    </div>
                </a>
            </div>
            <c:forEach items="${baby}" var="listbaby">
                <%--通过遍历来显示宝宝--%>
            <a href="homePage.html?baby_id=${listbaby.baby_id}">
                <div style="height: 80px;line-height: 55px;border-top: 1px solid #D1D1D1;border-bottom: 1px solid #D1D1D1;width: 100%;">
                    <div style="width:53px;height:78px;display: inline-block;float:left;padding: 10px;margin-right: 10px">
                        <img src="<%=path%>/staticState/imgs/${listbaby.baby_photo}" style="height: 50px;width: 50px;border-radius: 360px;"/>
                        <c:if test="${listbaby.r_level=='1'}">
                            <svg class="icon" aria-hidden="true"
                                 style=" width: 15px; height: 15px; fill: currentColor; overflow: hidden;display: inline-block;line-height: 40px;margin-top:-15px;margin-left: 30px">
                                <use xlink:href="#icon-yaoqiu"></use>
                            </svg>
                        </c:if>
                    </div>
                    <div style="display: inline-block;height: 15px;float:left;vertical-align: middle;width: 70%">${listbaby.baby_name}</div>
                    <div style="display: inline-block;height: 40px;float:left;vertical-align: middle;">15个月零3天，共3条记录
                    </div>
                    <span class="mui-icon mui-icon-arrowright mui-pull-right"
                          style="line-height: 45px ;color:#8d8888; "></span>
                </div>
                </c:forEach>
            </a>

        </div>
    </div>
</div>


<script type="text/javascript" charset="utf-8">
    window.onload = function () {
        mui('#offCanvasContentScroll').scroll({
            bounce: false,//滚动条是否有弹力默认是true
            indicators: false, //是否显示滚动条,默认是true
        });
    }
</script>
</body>

</html>