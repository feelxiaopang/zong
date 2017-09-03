<%--
  Created by IntelliJ IDEA.
  User: wuxiaoyu
  Date: 2017/7/4
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../common/lib.jsp" %>
<html>
<head>
    <title>updateAppUsers</title>
    <script src="<%=path%>/staticState/js/password.js"></script>
</head>
<body style="background:url('<%=path%>/staticState/imgs/home_image.png') no-repeat -200px -20px;background-attachment:fixed">
<div class="container">
    <div class="col-lg-3 col-md-3 col-sm-3"></div>
    <div class="col-lg-6 col-md-6 col-sm-6">
        <div class="page-header text-center"><h1>修改会员信息</h1></div>
        <form class="form-horizontal" role="form" action="updateAppUserPassword">
            <div class="form-group">
                <label class="col-sm-2 control-label">账号</label>
                <div class="col-sm-10">
                    <input type="hidden" name="u_id" value="${appUser.u_id}"/>
                    <input class="form-control" name="u_pNumber" type="text" value="${appUser.u_pNumber}"readonly>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">昵称</label>
                <div class="col-sm-10">
                    <input class="form-control" name="u_name" type="text"  value="${appUser.u_name}" readonly>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input class="form-control" name="u_password" type="password" id="newPwd">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">确认密码</label>
                <div class="col-sm-10">
                    <input class="form-control" name="u_password" type="password" id="comPwd">
                    <span id="notice"></span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" id="subButton" class="btn btn-default" disabled>提交</button>
                    <span>${msg}</span>
                </div>
            </div>
        </form>

    </div>
    <div class="col-lg-3 col-md-3 col-sm-3"></div>
</div>

</body>
</html>
