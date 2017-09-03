<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/21
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="background:url('<%=path%>/staticState/imgs/home_image.png') no-repeat 0px -20px">

<div class="left">

    <ul class="nav nav-pills nav-stacked"
        style="text-align: center;font-family: 'Microsoft YaHei';font-size: 16px;line-height: 18px;margin-top: 5px">
        <li class="menuLi">
            <a href="<%=path%>/admin/right.html" target="showContents" class="mainMenu">首&nbsp;页</a>
        </li>
        <c:forEach items="${power}" var="power">
        <c:if test="${not empty power.p_path}">
        <li class="menuLi">
            <a href="<%=path%>/admin/${power.p_path}" target="showContents">${power.p_name}</a>
        </li>
        </c:if>
        </c:forEach>

</div>

</body>
</html>
