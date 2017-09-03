<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: wujie
  Date: 2017/7/7
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
    <script src="<%=path%>/staticState/js/APP/information.js"></script>

</head>
<body style="background-color: #F9F6F9;">


<header class="mui-bar mui-bar-nav" style="background-color: #FFC028">
    <a href="babyChang.html?baby_id=${baby_id}&Shuo${Shuo}" class="mui-icon mui-icon-left-nav mui-pull-left" style="font-size: 15px;align-content: center;line-height: 30px;color: white;">返回</a>
    <h1 class="mui-title" style="color:white">选择记录时间</h1>
    <a class="mui-icon mui-pull-right" style="font-size: 15px;background-color: #FFC028;line-height: 23px;color: white" id="butt" onclick="checkRoot()">确定</a>
</header>
<%--作为标题空白处--%>
<div style="height: 40px;background-color: #F9F6F9"></div>
<div style="display: inline-block;width: 100%;border-bottom: 0.5px solid #d1cccc; height: 50px;line-height: 50px">
    <input type="radio" value="2" class="rootRadio1" onclick="rad1()"/>
    <span style="color: #000;">&nbsp;&nbsp;&nbsp;所有亲</span>
    <div style="width: 45%;display: inline-block"></div>

</div>
<div style="display: inline-block;width: 100%;border-bottom: 0.5px solid #d1cccc; height: 50px;line-height: 50px">
    <input type="radio" value="1" class="rootRadio2" onclick="rad2()"/>
    <span style="color: #000;" >&nbsp;&nbsp;&nbsp;仅自己</span>
    <div style="width: 45%;display: inline-block"></div>
    <span style="color: #8d8888" id="zidingdate"></span>
</div>
<form style="display: none" action="toCheckRoot.html" method="post" id="SCheckRootfrom">
    <input type="hidden" name="baby_id" style="display:none" value="${baby_id}" >
    <input type="hidden" name="Shuo" style="display:none" value="${Shuo}" >
    <input type="text" name="SCheckRoot" id="SCheckRoot" />
    <input type="hidden" name="checkText" value="${checkText}"/>
    <input type="hidden" name="Sdate" value="${Sdate}"/>
</form>


</body>
</html>
