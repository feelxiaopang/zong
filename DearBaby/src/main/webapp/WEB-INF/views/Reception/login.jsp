<%--
  Created by IntelliJ IDEA.
  User: wujie
  Date: 2017/7/5
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../common/lib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title></title>
</head>

<body style="background-color: white">

<div  style="background-color: white;border-bottom:0px">
</div>
<div style="height: 50px">

</div>

<div >
    <div style="height: 100px ;position: relative" >
<br/>
        <br/>
        <br/>

<span style="right: 45%;position: absolute;font-size: 20px">登录</span>
    </div>
    <span class="ketishi">
        <c:if test="${u_status==2}">
            您的账号已被禁用！
        </c:if>
         <c:if test="${u_status==3}">
             您的账号已被删除！
         </c:if>
    </span>
    <form  style="border: 0px solid white" action="toLogin" method="post">
        <div class="mui-input-row" style="width: 80%">
            <input type="text" name="u_pNumber" id="u_pNumber" class="mui-input-clear"placeholder="输入你的11手机号" style="border-top-color: white;border-right-color: white;border-left-color: white;">
        </div>
        <div class="mui-input-row" style="width: 80%">
            <input type="password" name="u_password" class="mui-input-password" id="u_password"  placeholder="输入密码*只能是数字或字母" style="border-top-color: white;border-right-color: white;border-left-color: white;">
        </div>

        <input id='reg'  type="submit" class="mui-btn mui-btn-blue" style="background-color: #ffcf67;border:0px solid white ; color:white;border-radius: 50px 50px; width: 248px;margin: 15px 50px;font-size: 17px" value="登录"></input>
    </form>

    <div style="display: inline-block;width: 120px"></div><span><a href="registerUser">注册账号</a></span>|<span>遇到问题？</span>


</div>
<div style="height: 90px ;">

</div >
<div style="display: inline-block;width: 133px"></div>--<span><a href="index">第三方登录</a></span>--

</body>
</html>
