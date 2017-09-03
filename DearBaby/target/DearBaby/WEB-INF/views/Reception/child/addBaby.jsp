<%--
  Created by IntelliJ IDEA.
  User: chenfumei
  Date: 2017/7/12
  Time: 15:23
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

    <style type="text/css">
        body {
            background-color: #000000;
        }
    </style>
    <script>
        /*点击a标签跳转*/
        mui('body').on('tap', 'a', function () {
            document.location.href = this.href;
        });
    </script>
</head>

<body id="addBaby">

<div id="small" class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 主页面标题 -->
        <header class="mui-bar mui-bar-nav" style="background-color: #f7b928">
            <c:if test="${babyCount>0}">
                <a class="mui-icon mui-icon-left-nav mui-pull-left" href="homePage.html"></a>
            </c:if>
            <h1 class="mui-title" style="color:white">添加宝宝</h1>
            <c:if test="${babyCount==0}">
                <a href="homePage.html"
                   style="font-size:15px;float:right;padding:2px;margin-top:8px;color:white;">
                    跳过
                </a>
            </c:if>
        </header>

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll"
                 style="width:100%;height: 100%;padding:0px;vertical-align:middle;">
                <div class="typeChoose" style="width: 90%;height: 23%;margin:40% auto 50%;">
                    <a href="addBabyInformation.html?sex=1">
                        <div class="choose"
                             style="width: 33.33%;height: 100%;float:left;text-align:center;">
                            <div class="choose-inner"
                                 style="width: 70%;height: 0px;border-radius:50%;margin-bottom:15px;vertical-align:middle;border: 1px solid #c9c9c9">
                                <img class="girl" src="<%=path%>/staticState/imgs/girl.png"
                                     style="width: 40%;height: 40%;margin: 30% auto;">
                            </div>
                            <span>女孩</span>
                        </div>
                    </a>
                    <a href="addBabyInformation.html?sex=2">
                        <div class="choose"
                             style="width: 33.33%;height: 100%;float:left;text-align:center;">
                            <div class="choose-inner"
                                 style="width: 70%;height: 0px;border-radius:50%;margin-bottom:15px;border: 1px solid #c9c9c9">
                                <img class="boy" src="<%=path%>/staticState/imgs/boy.png"
                                     style="width: 45%;height: 40%;margin: 30% auto;">
                            </div>
                            <span>男孩</span>
                        </div>
                    </a>
                    <a href="#">
                        <div class="choose"
                             style="width: 33.33%;height: 100%;float:left;text-align:center;">
                            <div class="choose-inner"
                                 style="width: 70%;height: 0px;border-radius:50%;margin-bottom:15px;border: 1px solid #c9c9c9">
                                <img class="gestation" src="<%=path%>/staticState/imgs/gestation.png"
                                     style="width: 40%;height: 40%;margin: 30% auto;">
                            </div>
                            <span>孕期</span>
                        </div>
                    </a>
                </div>
                <div style="width: 100%;height: 50px;margin-top:20px;text-align:center;clear:left;">
                    <a href="" style="font-size:15px;color: #00ab00">输入邀请码关注宝宝></a>
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
    $(function () {
        document.addEventListener('plusReady', function () {
            var all=plus.webview.all();
            var ws =plus.webview.currentWebview().id;
            var len=all.length;
            for (var i = 0 ;i<len;i++){
                if (all[i].id!=ws){
                    all[i].close();
                }
            }
            plus.webview.open("http://10.0.8.12:8081/DearBaby/member/baby.html");
        },false);
    });

    $(function () {
        $(".choose-inner").css("height", $(".choose-inner").width() + 2);
    });

</script>

</body>

</html>