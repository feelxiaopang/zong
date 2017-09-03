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
<base href="<%=bashPath%>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:form method="post" action="login.action">
		<s:textfield name="users.username" key="账号"/>
		<s:password name="users.password" key="密码"/>
		<s:submit key="submit"/>
	</s:form>
	<a href="register.jsp">注册</a>
	<a href="paged.action?currentPage=1">分页</a>
</body>
</html>