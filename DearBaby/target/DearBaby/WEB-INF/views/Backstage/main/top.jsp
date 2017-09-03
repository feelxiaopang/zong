<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/21
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<html>
<head>
    <title>Title</title>
    <style>
        button {
            background: #ffcbaa;
            line-height: 20px;
            font-size: 16px;
            float: right;
            margin: 13px 20px;
        }

        .welcome {
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="topDiv"
     style="width: 100%;height: 82%;background:#ffe0d0;border-bottom-left-radius:6px;border-bottom-right-radius: 6px;">
    <img src="<%=path%>/staticState/imgs/logo.png"
         style="width: 245px;float: left;margin-top: -37px;margin-left: -37px">
    <div style="width:150px;height:30px;margin-top: 20px;float: left">
        <span class="welcome">
            ${admin.a_name}，欢迎您！
        </span>
    </div>
    <button id="logout" style="color: #428bca;">退出登录</button>
    <a href="<%=path%>/admin/updatePwd.html" target="showContents" style="color: #428bca;">
        <button id="change">修改密码</button>
    </a>
</div>

<script>
    $("#logout").click(function () {
        window.parent.close();
        window.parent.open("<%=path%>/admin/logout");
    });
    <%--$("#change").click(function () {--%>
    <%--window.parent.location.href = "<%=path%>/admin/updatePwd.html";--%>
    <%--});--%>
</script>
</body>
</html>
