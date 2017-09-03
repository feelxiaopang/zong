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
<link href="./css/inde.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="total"><h1>SOS人员管理</h1></div>
	<div class="nexx">
		<h1><s:a href="views/login.jsp">======登录======</s:a></h1>
		<h1><s:a href="views/register.jsp">======注册======</s:a></h1>
	</div>
</body>
</html>