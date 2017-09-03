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
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <script src="<%=path%>/staticState/js/APP/register.js"></script>

</head>
<body>
<header class="mui-bar mui-bar-nav" style="background-color: #FFC028">
    <a class="mui-icon mui-icon-left-nav mui-pull-left" href="more.html"></a>
    <h1 class="mui-title" style="color:white">设置</h1>
</header>
<%--作为标题空白处--%>
<div style="height: 60px;background-color: #F9F6F9"></div>

<%--下载--%>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; " href="#"></a>
    &nbsp;&nbsp; <a href="personalInformation.html"><span style="color: #000">账号信息</span></a></div>
<div style="height: 30px;background-color: #F9F6F9"></div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; " href="#"></a>
    &nbsp;&nbsp; <span>消息通知</span></div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; " href="#"></a>
    &nbsp;&nbsp; <span>隐私安全</span></div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; " href="#"></a>
    &nbsp;&nbsp; <span>大字体</span></div>


<div style="height: 30px;background-color: #F9F6F9"></div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; " href="#"></a>
    &nbsp;&nbsp; <span>推荐给好友</span></div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; " href="#"></a>
    &nbsp;&nbsp; <span>关于亲宝宝</span></div>


<div style="height: 30px;background-color: #F9F6F9"></div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; " href="#"></a>
    &nbsp;&nbsp; <span>清除缓存</span></div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; " href="#"></a>
    &nbsp;&nbsp; <span>视频设置</span></div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; " href="#"></a>
    &nbsp;&nbsp; <span>只使用WIFI上传大文件</span></div>
<div style="height: 30px;background-color: #F9F6F9;font-size: 10px">
    打开后，聊天语音始终是要听筒播放

</div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9;text-align: center">
    &nbsp;&nbsp; <span style="text-align: center" onclick="queding()">退出登录</span>
</div>
</body>
</html>
