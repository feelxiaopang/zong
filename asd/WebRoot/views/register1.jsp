<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:form method="post" action="register!regesters.action">
		<s:textfield name="users.nickname" key="昵称"/>
		<s:textfield name="users.username" key="账号"/>
		<s:password name="users.password" key="密码"/>
		<s:password name="passwords" key="que密码"/>
		<s:submit key="submit"/>
	</s:form>
	<a href="views/login.jsp">登录</a>
</body>
</html>