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
<link href="./css/boss.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

</head>
<body>
	<div class="total2">
		<h1>联邦调查局人力资源管理</h1>
		<element>
			<p>尊敬的<s:property value="#session.name"/>你好</p>
		</element>
	</div>
	<div class="middle1">
		<div class="middle2">
			<div id="sa1" class="title">查询员工信息</div>
			<div id="sa2" class="title">新增员工信息</div>
			<div id="sa3" class="title">删除员工信息</div>
			<div id="sa4" class="title">修改员工信息</div>
		</div>
		
		<div style="background-color: gray;" id="woup1" class="middle3">
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
			<td><s:property value="#st.idcard"/></td>
				<td><s:property value="#st.username"/></td>
				<td><s:property value="#st.password"/></td>
				
			</tr>
		</s:iterator>
		</tbody>
	</table>
			<s:a href="paged.action?currentPage=1">首页</s:a>
		<s:a href="paged.action?currentPage=%{#session.currentPage-1}">上一页</s:a>
		<s:a href="paged.action?currentPage=%{#session.currentPage+1}">下一页</s:a>
		<s:a href="paged.action?currentPage=%{#session.total}">尾页</s:a>
		</div>
		<div style="background-color: pink;" id="woup2" class="middle3">
			<p style="color:green;">功能暂未开！！！</p>
		</div>
		<div style="background-color: orange;" id="woup3" class="middle3">
			<p style="color:skyblue;">敬请期待！！！</p>
		</div>
		<div style="background-color: green;" id="woup4" class="middle3">
			<p style="color:pink;">功能暂未开放！！！</p>
		</div>

	</div>
</body>
<script type="text/javascript" src="js/boss.js"></script>
</html>