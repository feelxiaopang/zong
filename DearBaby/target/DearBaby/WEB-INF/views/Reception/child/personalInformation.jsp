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
    <a class="mui-icon mui-icon-left-nav mui-pull-left" href="generalSettings.html"></a>
    <h1 class="mui-title" style="color:white">账号信息</h1>
</header>
<%--作为标题空白处--%>
<div style="height: 60px;background-color: #F9F6F9"></div>

<%--下载--%>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; "
       href="#"></a>
    &nbsp;&nbsp;
    <div style="display: inline-block">手机号码</div>
    <span style="float:right;color: #8d8888">${phoneNumber}</span>
</div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; "
       href="#"></a>
    &nbsp;&nbsp;
    <div style="display: inline-block">登录密码</div>
    <div style="width: 190px;display: inline-block;color: #8d8888"></div>
</div>
<div style="height: 30px;background-color: #F9F6F9;font-size: 10px">
    设置以后，可以是要手机号+密码登录亲宝宝
</div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right"
       style="clear:right;float:right;line-height: 40px ;color:#8d8888; "
       href="#"></a>
    &nbsp;&nbsp;
    <div style="display: inline-block">QQ帐号</div>
    <span style="float:right;color: #8d8888">未绑定</span>
</div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right"
       style="clear:right;float:right;line-height: 40px ;color:#8d8888; "
       href="#"></a>
    &nbsp;&nbsp;
    <div style="display: inline-block">微信账号</div>
    <span style="float:right;color: #8d8888">未绑定</span>
</div>
<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
    <a class="mui-icon mui-icon-arrowright mui-pull-right"
       style="clear:right;float:right;line-height: 40px ;color:#8d8888; "
       href="#"></a>
    &nbsp;&nbsp;
    <div style="display: inline-block">新浪微博账号</div>
    <span style="float:right;color: #8d8888">未绑定</span>
</div>

</body>
</html>
