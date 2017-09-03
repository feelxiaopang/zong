<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%
 String path = request.getContextPath();//当前地址
 //获取项目的绝对地址
 String bashPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=bashPath%>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="head">
		<a href="views/index.jsp">返回</a>
		<a href="">登录</a>
	</div>
	<form action="login" method="post">
	<div class="login">
		<div">
			<p>账号:<input type="text" name="username" maxlength="12" placeholder="请输入账号"></p>
			
		</div>
		<div>
			<p>密码:<input type="password" name="password" maxlength="12" placeholder="请输入密码"></p>
			
		</div>
		<%if(request.getAttribute("name")!=null){
 	 				%><%=request.getAttribute("name") %>
 	 			<%} %>
		<div>
			<input type="submit" value="登录">
		</div>
	</div>
	</form>
</body>
</html>