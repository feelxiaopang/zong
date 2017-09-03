<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String path = request.getContextPath();//当前地址
 //获取项目的绝对地址
 String bashPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
  <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=bashPath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
</head>
	<link href="css/css.css" rel="stylesheet" type="text/css" />
<body>
	<div class="head">
		<% if(session.getAttribute("nickname")==null){%>
			<div class="div_logo">
				<a class="p1"><b><b><i>DED.Gard</i></b></b></a>
			</div>
			<div class="div_ul">
				<ul class="ul">
					<li id="login">登录</li>
					<li id="registered">注册</li>
				</ul>
			</div>
	<% }else{%>
			<div class="div_1">
				<div class="div_logo">
					<a href=""><b><b><i>DED-Gard</i></b></b></a>
				</div>
				<div class="div_d">
				<div class="div_1_p"><b>您好：<a href="home?method=user&nick=${ id }">${ nickname }</a></b></div>
				<div class="div_1_1">
					<a href="login?method=remove" style="color:red;">注销</a>
				</div>
			</div>
		</div>
	<% } %>
		<div id="hidden_div" class="hidden_div"></div>
		<div class="login_div" id="login_div" >
			<img src="img/1.jpg" style="margin-left:360px;" id="remove_login">	
			<form action="login.action" method="post"> 
				<s:textfield name="users.username" key="账号"/>
				<s:password name="users.password" key="密码"/>
				<s:submit value="登录" key="submit"/>	
			</form>
		</div>
		<div class="registered_div" id="registered_div" >
		<img src="img/1.jpg" style="margin-left:560px;" id="remove_registered">
			<form action="registered" method="post">
				<input type="hidden" name="method" value="registered">
				<span class="span">用户账号：</span><input type="text" class="box" name="username1" id="username1" placeholder="您的账户名和登录名"><span id="p2"></span>
				<br/>
				<span class="span">用户昵称：</span><input type="text" class="box" name="nickname1" id="nickname1" placeholder="您的昵称"><span id="p7"></span>
				<br/>
				<span class="span">设置密码：</span><input type="password" class="box" name="password1" id="password1" placeholder="请输入您的密码"><span id="p3"></span>
				<br/>
				<span class="span">确认密码：</span><input type="password" class="box" name="password2" id="password2" placeholder="请再次输入您的密码"><span id="p4"></span>
				<br/>
				<span class="span">手  机  号：</span><input type="text" class="box" name="phone" id="phone" placeholder="建议使用常用手机"><span id="p5"></span>
				<br/>
	
				<input type="submit" value="立即注册" class="registered_submit" id="registered_submit">
			</form>
		</div>
	</div>
</body>
	<script type="text/javascript" src="js/js.js"></script>
</html>