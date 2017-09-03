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
<link href="./css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="total1"><h1>登录管理</h1></div>
	<div class="middle">

		<s:form action="login.action">
		<s:textfield class="zhan" name="user.username" key="账号"/>
		<s:password class="mim" name="user.password" key="密码"/>
		<s:submit class="subm" value="登录" key="submit"/>
	</s:form>
	<s:a class="asa" href="views/index.jsp">返回主页>></s:a>
	</div>
</body>
</html>