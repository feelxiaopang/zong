<%--
  Created by IntelliJ IDEA.
  User: wujie
  Date: 2017/7/7
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <script src="<%=path%>/staticState/js/APP/information.js"></script>

</head>
<body style="background-color: #F9F6F9;">


<header class="mui-bar mui-bar-nav" style="background-color: #FFC028">
    <a class="mui-icon mui-icon-left-nav mui-pull-left" href="information.html"></a>
    <h1 class="mui-title" style="color:white">${name}</h1>
    <button class="mui-icon mui-pull-right" style="font-size: 20px;background-color: #FFC028" id="butt" onclick="ti()"><span style="color: white">保存</span></button>
</header>
<%--作为标题空白处--%>
<div style="height: 60px;background-color: #F9F6F9"></div>
<div class="modal-content">
    <div class="modal-body">
        <%--修改管理员表单--%>
        <form id="Form1" action="setInformation.html" method="post"  enctype="multipart/form-data" class="form-horizontal">
           <c:if test="${not empty infor_s}">

            <textarea name="infor_signature" style="height: 100px" onchange="shuru()" id="infor_signature" placeholder="请不要超过60字
               (${infor_signature})"></textarea>
        </c:if>
            <c:if test="${empty infor_s}">
                <input type="text" name="u_name" id="u_name" />
                <div style="height: 30px;font-size: 10px">
                    请不要超过20个字符，支持中英文.数字
                </div>
            </c:if>

        </form>
    </div>

</div><%-- /.modal-content --%>


</body>
</html>
