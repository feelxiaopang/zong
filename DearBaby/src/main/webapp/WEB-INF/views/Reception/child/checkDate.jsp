<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
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
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String date = sdf.format(new Date());
     request.setAttribute("Sdate",date);
%>

<header class="mui-bar mui-bar-nav" style="background-color: #FFC028">
    <a href="#" class="mui-icon mui-icon-left-nav mui-pull-left" style="font-size: 15px;align-content: center;line-height: 30px;color: white;" onclick="setSdate()">返回</a>
    <h1 class="mui-title" style="color:white">选择记录时间</h1>
</header>
<%--作为标题空白处--%>
<div style="height: 40px;background-color: #F9F6F9"></div>
<div style="display: inline-block;width: 100%;border-bottom: 0.5px solid #d1cccc; height: 50px;line-height: 50px">
    <span  style="line-height: 50px ;color:#8d8888; "></span>
    <span style="color: #000;">&nbsp;&nbsp;&nbsp;当前时间</span>
    <div style="width: 45%;display: inline-block"></div>
    <span style="color: #8d8888;" class="dangqian">${Sdate}</span>
    <input type="radio" class="dangdate" onclick="dangdate()"/>
</div>
<div style="display: inline-block;width: 100%;border-bottom: 0.5px solid #d1cccc; height: 50px;line-height: 50px" onclick="Sdate()">
    <span  style="line-height: 50px ;color:#8d8888; "></span>
    <span style="color: #000;" >&nbsp;&nbsp;&nbsp;自定义时间</span>
    <div style="width: 40%;display: inline-block"></div>
    <span style="color: #8d8888;" id="zidingdate"></span>
    <input type="radio" class="zidingdate"/>
</div>
<form style="display: none" action="toCheckDate.html" method="post" id="Sdatefrom">
    <input type="text" name="Sdate" id="Sdate"/>
    <input type="hidden" name="checkText" value="${checkText}"/>
    <input type="hidden" name="SCheckRoot" value="${SCheckRoot}"/>
</form>

<div class="modal fade" id="SdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%--修改管理员表单--%>

                    <input type="date" name="infor_birth" id="infor_birth" placeholder="请输入时间" />
                    <input type="hidden" name="baby_id" style="display:none" value="${Baby.baby_id}" >
                <input type="button" value="提交"  onclick="Sdategai()"/>
            </div>

        </div><%-- /.modal-content --%>
    </div><%-- /.modal --%>
</div>


</body>
</html>
