<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="register" method="post">
	<div class="register">
		<div class="users">
			<p>账号:<input type="text" name="username" maxlength="12" placeholder="请输入账号"></p>
			
		</div>
		<div class="pass">
			<p>密码:<input type="password" name="password" maxlength="12" placeholder="请输入密码"></p>
			<p>密码:<input type="password" name="passwords" maxlength="12" placeholder="请确认密码"></p>
		</div>
		<%if(request.getAttribute("name")!=null){
 	 				%><%=request.getAttribute("name") %>
 	 			<%} %>
		<div class="real">
			<p>姓名:<input type="text" name="nickname" placeholder="请输入姓名"></p>
			
		</div>
		<div class="save">
			<input type="submit" value="注册">
		</div>
		
	</div>
	</form>
	<a href="views/index.jsp">返回</a>
</body>
</html>