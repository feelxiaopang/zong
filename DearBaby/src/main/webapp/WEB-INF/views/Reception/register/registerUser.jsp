<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/21
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title></title>
    <script src="<%=path%>/staticState/js/APP/register.js"></script>

</head>

<body style="background-color: white">

<div  style="background-color: white;border-bottom:0px">
    <a href="index" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"style="color:#FFD297;background-color: white "><span  style="font-size: 20px">返回</span></a>
</div>
<div style="height: 50px">

</div>

<div >
<div style="height: 150px ;position: relative" >

    <a href="#" style="position: absolute;top: 70px ;left: 138px"  data-toggle="modal" data-target="#updateMyModal" >点击上传图片</a>
    <c:if test="${empty infor_photo}">
<img src="<%=path%>/staticState/imgs/back.png" style="border-radius: 50px;width:100px;height: 100px;margin: 30px 130px" >
    </c:if>
    <c:if test="${not empty infor_photo}">
        <img src="<%=path%>/staticState/imgs/${infor_photo}" style="border-radius: 50px;width:100px;height: 100px;margin: 30px 130px" >
    </c:if>
</div>
    <span class="ketishi"></span>
<form  style="border: 0px solid white" action="toRegisterUser" method="post" id="userti">
    <input type="hidden" name="u_photo" value="${infor_photo}">
    <input type="hidden" name="yanzhen" id="yanzhen">
    <div class="mui-input-row" style="width: 80%">
        <input type="text" name="u_pNumber" id="u_pNumber" class="mui-input-clear"  placeholder="输入你的11手机号" style="border-top-color: white;border-right-color: white;border-left-color: white;">
    </div>
    <div class="mui-input-row" style="width: 80%">
        <input type="password" name="u_password" class="mui-input-password" id="u_password" onchange="yanzhenpassword()" placeholder="输入密码*只能是数字或字母" style="border-top-color: white;border-right-color: white;border-left-color: white;">
    </div>
    <div class="mui-input-row" style="width: 80%">
        <input type="text" name="u_name" class="mui-input-clear" placeholder="请输入你的名字和昵称" style="border-top-color: white;border-right-color: white;border-left-color: white;">
    </div>
    <input id='reg' type="submit" class="mui-btn mui-btn-blue" style="background-color: #ffcf67;border:0px solid white ; color:white;border-radius: 50px 50px; width: 248px;margin: 20px 53px;font-size: 17px" value="完成注册" onclick="diaregi()"></input>
</form>

    <c:if test="${tishi>0}" >
        <a href="index" class="mui-backdrop">注册成功点击返回</a>
    </c:if>


</div>

<div class="modal fade" id="updateMyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    修改头像
                </h4>
            </div>
            <div class="modal-body">

                <%--修改管理员表单--%>
                    <form name="serForm" action="upLoadPictures" method="post"  enctype="multipart/form-data" class="form-horizontal" id="reUpda">
                    <div class="form-group">

                            选择照片：
                        <input type="file" name="file" id="firstname1" >
                        <input type="hidden" name="fileurl" style="display:none" value="registerUser" id="fileurl">

                    </div>

                </form>
                    <input type="button"  value="提交" onclick="phototiji()"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>

            </div>
        </div><%-- /.modal-content --%>
    </div><%-- /.modal --%>
</div>
</body>

</html>
