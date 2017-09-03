<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/24
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../common/lib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="<%=path%>/staticState/css/login.css"/>
    <script src="<%=path%>/staticState/js/login.js"></script>
</head>
<nav>
    <div class=""></div>
</nav>
<body style="overflow: hidden;background:url('<%=path%>/staticState/imgs/home_image.png') no-repeat 0px 30px;background-attachment:fixed">
<div class="container-fluid">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <div class="row" style="height: 200px;"></div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading" style="width: 100%">
                        <div class="panel-title">用户登录<label style="margin-left: 150px; font-weight: 100; font-family: '宋体';color:red;">${mess}</label></div>
                        <span style="display: none;" id="flag">${flag}</span>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" action="<%=path%>/admin/login" method="post" >
                            <div class="form-group">
                                <label for="name" class="col-md-3  control-label">账&nbsp;&nbsp;&nbsp;号:</label>
                                <div class="col-md-9">
                                    <input type="text" name="a_name" class="form-control" id="name" placeholder="请输入账号"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pwd" class="col-md-3  control-label">密&nbsp;&nbsp;&nbsp;码:</label>
                                <div class="col-md-9">
                                    <input type="password" name="a_password" class="form-control" id="pwd"
                                           placeholder="请输入密码"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="vali" class="col-md-3  control-label">验证码:</label>
                                <div class="col-md-5">
                                    <input type="text" name="validate" class="form-control" id="vali"
                                           placeholder="请输入验证码" onkeyup="checkCode(this)"/>
                                </div>

                                <input type = "button" id="code" onclick="createCode()" style="width:80px;height:40px;background-color: #428046;color:#2c36ff"/>

                                <span class="span1" style="line-height: 40px;"></span>
                            </div>
                            <div class="form-group">
                                <div class="col-md-2 col-md-offset-3">
                                    <button type="submit" class="btn btn-default" id="submit">登录</button>
                                </div>
                                <div class="col-md-2 col-md-offset-1">
                                    <button type="reset" class="btn btn-default">重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4"></div>
</div>
</body>
</html>
