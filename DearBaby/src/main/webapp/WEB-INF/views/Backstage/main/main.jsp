<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/21
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
    <title>后台首页</title>
</head>
<frameset rows="73px,*" frameborder="no">
    <frame src="<%=path%>/admin/top.html" scrolling="no"/>
    <frameset cols="200px,*">
        <frame src="<%=path%>/admin/left.html" scrolling="no"/>
        <frame src="<%=path%>/admin/right.html" name="showContents" scrolling="auto" noresize/>
    </frameset>
</frameset>
</html>
