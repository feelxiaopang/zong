<%--
  Created by IntelliJ IDEA.
  User: wuxiaoyu
  Date: 2017/6/30
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../common/lib.jsp" %>
<html>
<head>
    <title>Title</title>
    <script src="<%=path%>/staticState/js/password.js"></script>
</head>
<body style="background:url('<%=path%>/staticState/imgs/home_image.png') no-repeat -200px -20px;background-attachment:fixed">
<div style="width: 85%;min-width: 700px;height: 500px;margin: 0px auto;vertical-align: middle;">
    <div style="width: 95%;height: 100%;margin: 50px auto;padding: 0px">
        <div class="container">
            <div class="col-lg-6" style="width: 550px;border-radius: 10px;border: 1px solid #8b675a;">
                <div class="page-header text-center"><h1>修改密码</h1></div>
                <form class="form-horizontal" role="form" action="<%=path%>/admin/updatePassword">
                    <div class="form-group">
                        <label for="oldPwd" class="col-sm-2 control-label">原密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="oldPwd" name="oldPwd"
                                   placeholder="请输入原密码"><span>${mess}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="newPwd" class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="newPwd" name="newPwd" placeholder="请输入新密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="comPwd" class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="comPwd" placeholder="请确认新密码"><span
                                id="notice"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" id="subButton" class="btn btn-info" disabled/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3"></div>
        </div>
    </div>
</div>


</body>
</html>
