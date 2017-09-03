<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<s:debug></s:debug>
	<table border="1">
		<thead>
			<tr>
			<td>idcard</td>
				<td>userName</td>
				<td>password</td>
			</tr>
		</thead>
		<tbody>
				<s:iterator value="#session.list" var="st">
			<tr>
				<td><s:property value="#st.username"/></td>
				<td><s:property value="#st.password"/></td>
				<td><s:property value="#st.nickname"/></td>
			</tr>
		</s:iterator>
		</tbody>
	</table>
			<s:a href="paged.action?currentPage=1">首页</s:a>
		<s:a href="paged.action?currentPage=%{#session.currentPage-1}">上一页</s:a>
		<s:a href="paged.action?currentPage=%{#session.currentPage+1}">下一页</s:a>
		<s:a href="paged.action?currentPage=%{#session.total}">尾页</s:a>
</body>
</html>