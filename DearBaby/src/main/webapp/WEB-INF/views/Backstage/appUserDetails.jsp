<%--
  Created by IntelliJ IDEA.
  User: wuxioayu
  Date: 2017/7/4
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../common/lib.jsp" %>
<html>
<head>
    <title>appUserDetails</title>

</head>
<body style="background:url('<%=path%>/staticState/imgs/home_image.png') no-repeat -200px -20px;background-attachment:fixed">
<div class="container">
    <div class="col-lg-3 col-md-3 col-sm-3">
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6">
        <a class="btn btn-info" href="userList.html">返回列表</a>
        <div class="page-header text-center"><h1>用户详细信息</h1></div>
        <div>
            <div class="col-lg-9 col-md-9 col-sm-9" >
                <p class="text-left text-primary" style="line-height: 75px">头像</p>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3" style="margin-bottom: 12px">
                <img  class="img-circle" style="display: inline-block;width:70px;height:70px;" src="<%=path%>/staticState/imgs/${appUser.u_photo}" >
            </div>
        </div>
        <div class="table-responsive">
            <table class="table">
                <tbody>
                <tr>
                    <td>用户状态</td>

                    <td class="text-right"><button type="button" class="btn-group-lg">
                       <c:if test="${appUser.u_status==1}">设置禁用</c:if>
                        <c:if test="${appUser.u_status==2}">设置启用</c:if>
                    </button></td></tr>
                <tr style="border-bottom: 3px solid grey">
                    <td>名字</td>

                    <td class="text-right">${appUser.u_name}</td></tr>
                <tr>

                    <td>性别</td>

                    <td class="text-right">${infor.infor_sex}</td></tr>
                <tr>
                    <td>生日</td>

                    <td class="text-right">${infor.infor_birth}</td></tr>
                <tr>
                    <td>地区</td>

                    <td class="text-right">${infor.infor_address}</td></tr>
                <tr>
                    <td>个性签名</td>

                    <td class="text-right">${infor.infor_signature}</td></tr>
                </tbody>
            </table>
        </div>

    </div>
    <div class="col-lg-3 col-md-3 col-sm-3"></div>
</div>
<script>
    $(document).ready(function () {
        $(".btn-group-lg").click(function () {
            if(${appUser.u_status==1}){
                $.confirm({
                    title: '确认!',
                    content: '是否禁用!',
                    confirm: function(){
                        $.ajax({
                            async:false,
                            type:'get',
                            url:'updateStatus.html?u_id=${appUser.u_id}&status=2',
                        });
                        window.location.reload();
                    },
                    cancel: function(){
                        $.alert('已取消!')
                    }
                });
            }
            if(${appUser.u_status==2}){
                $.confirm({
                    title: '确认!',
                    content: '是否启用!',
                    confirm: function(){
                        $.ajax({
                            async:false,
                            type:'get',
                            url:'updateStatus.html?u_id=${appUser.u_id}&status=1',
                        });
                        window.location.reload();
                    },
                    cancel: function(){
                        $.alert('已取消!')
                    }
                });
            }

        })
    })
</script>
</body>
</html>
