<%--
  Created by IntelliJ IDEA.
  User: wujie
  Date: 2017/6/29
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="<%=path%>/staticState/js/backgroundUser.js"></script>
</head>
<body style="background:url('<%=path%>/staticState/imgs/home_image.png') no-repeat -200px -20px;background-attachment:fixed">
<div class="bigDiv" style="height: 1050px">
    <div class="smallDiv">
        <c:forEach items="${power}" var="po">
<c:if test="${po.p_id==7}">
        <%-- 使用按钮触发模态框 --%>
        <button class="btn btn-info" data-toggle="modal" data-target="#myModal">
            新增
        </button>
</c:if>
            <c:if test="${po.p_id==8}">
        <%--为第二个修改模态框--%>
        <button class="btn btn-info" onclick="obtain_id()">
            修改
        </button>
            </c:if>
            <c:if test="${po.p_id==9}">
        <%-- 删除按钮触发事件 --%>
        <button type="button" class="btn btn-danger" onclick="pinr_id()">删除</button>
            </c:if>
        </c:forEach>  <%--多条件搜索框--%>

        <form action="queryAdmin.html" method="post" style="display: inline-block">

            <input type="text" name="querya_name" placeholder="请输入用户名" style="width: 150px">
            <input type="text" name="queryr_name" placeholder="请输入角色名" style="width: 150px">
            <input type="text" name="queryp_name" placeholder="权限" style="width: 150px">
            <input type="submit" value="搜索">
        </form>

        <%--遍历用户信息列表--%>
        <div  style="background-color: #ffe0d0">
        <table class="table-bordered"  id="data_table" ng-model="data_table" style="border: 1px solid white;width: 100%;line-height: 50px">
            <%-- 标题第一行--%>
            <tr class="active">
                <th class="active">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"  onclick="zong_id()" />
                            </label>
                        </div>
                    </div>
                </th>
                <th class="active">用户名</th>
                <th class="active">角色</th>
                <th class="active">权限</th>

            </tr>
            <c:set var="sum" value="${fn:length(shyujList)}"></c:set>
            <c:set var="pagenum" value="${sum /15 < 1? 1:sum}"></c:set>


            <%-- 通过遍历传的参数id建立数据--%>
            <c:forEach items="${shyujList}" var="a_id" begin="${begin}" end="${size}" varStatus="shuju">

                <tr class="hangxuan" >
                    <td class="active">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                        <%--至根据遍历添加--%>
                                    <input type="checkbox" class="ob_id" name="select_id" value="${a_id.a_id}"/>
                                </label>
                            </div>
                        </div>
                    </td>

                    <td class="active">${a_id.a_name}</td>

                    <td class="active">${a_id.r_name}</td>

                    <td class="active">
                            <%--权限的数量--%>
                            <%-- 通过遍历传的参数建立数据--%>

                        <c:set var="qunxianNum" value="${fn:length(a_id.p_name)}"></c:set>
                            <%--g根据判断选择显示的方式--%>
                            <%--权限菜单超过10个显示的方式--%>

                        <c:if test="${qunxianNum>=5}">
                        <div class="dropdown">
                            <c:forEach items="${a_id.p_name}" begin="0" end="5" var="p_name">
                                <a role="menuitem" tabindex="-1" href="#">${p_name}</a>
                            </c:forEach>
                            <button type="button" class="btn dropdown-toggle" id="dropdownMenu1"
                                    data-toggle="dropdown" style="background-color: #ffe0d0;font-size:30px">
                              ...
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"  style="height: 220px; overflow: scroll;">
                                <li role="presentation" class="dropdown-header">权限名称</li>
                                    <%--遍历权限名称--%>
                                <c:forEach items="${a_id.p_name}" begin="6" var="p_name">

                                    <li role="presentation">
                                        <a role="menuitem" tabindex="-1" href="#">${p_name}</a>
                                    </li>

                                    <li role="presentation" class="divider"></li>

                                </c:forEach>

                            </ul>
                        </div>
                        </c:if>
                        <c:if test="${qunxianNum<5 }">
                            <c:forEach items="${a_id.p_name}" begin="0" end="10" var="p_name">
                                <a role="menuitem" tabindex="-1" href="#">${p_name}</a>
                            </c:forEach>
                        </c:if>
                            <%--权限菜单超过10个显示的方式--%>
                            <%--权限菜单不超过10个显示的方式--%>

                            <%--权限菜单不超过10个显示的方式--%>
                            <%--g根据判断选择显示的方式--%>


                    </td>

                </tr>


            </c:forEach>
        </table>
        </div>
        <fmt:formatNumber var="account" type="number" value="${account/15 +0.49}" maxFractionDigits="0"/>
        <ul class="pagination">
            <%--描述数据的一些信息--%>


            <li>
                <a href="rightBackgroundUser.html?pageSize=1&method=${method}" class="active">首页</a>
            </li>

                <c:if test="${pageSize>1}">
            <li>
                <a href="rightBackgroundUser.html?pageSize=${pageSize-1}&method=${method}" class="active">上一页</a>
            </li>
                </c:if>
                <c:if test="${pageSize<=account-1}">
            <li>
                <a href="rightBackgroundUser.html?pageSize=${pageSize+1}&method=${method}" class="active">下一页</a>
            </li>
                </c:if>
            <li>
                <a href="rightBackgroundUser.html?pageSize=${account}&method=${method}" class="active">末页</a>
            </li>
                <li>
                    <a href="#" class="active">一共${account}页数据</a>
                </li>
                <li><form class="tianzhuan" style="display: inline-block" action="rightBackgroundUser.html" method="post">
                       <span class="active" style="height: 33px"><input type="number" style="width: 50px;height: 10px" name="pageSize" id="tiaozhuanye"/>
                       <input type="hidden" value="${account}" id="biiao"/></span>
                </form>
                </li>
                <li>
                    <button class="btn btn-info" style="width: 50px;height: 30px" onclick="dijitiao()">
                        GO
                    </button>
            </li>


        </ul>

<input type="hidden" id="yinchang" value="${method}"/>
        <%-- 新增模态框（Modal） --%>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            增加管理员
                        </h4>
                    </div>
                    <div class="modal-body">
                        <%--新增管理员表单--%>

                        <form class="form-horizontal" role="form" method="post" action="addAdmin.html?method=${method}">
                            <div class="form-group">
                                <label for="updatename" class="col-sm-2 control-label">账号名</label>
                                <div class="col-sm-10">
                                    <%--调用ajax验证账号是否存在--%>
                                    <input type="text" class="form-control" id="updatename"
                                           placeholder="请输入名字只能字母开头包含数字和字母最大20" name="a_name">
                                    <input type="hidden" id="yanzhen" value="${yanzhen}" name="checkname"/><span
                                        class="chuu"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="updatepassword" class="col-sm-2 control-label"> 密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="updatepassword"
                                           placeholder="请输入密码只能输入6-20个字母、数字  " onchange="yanzhenpassword()">
                                    <span class="chupassword"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="checkpassword" class="col-sm-2 control-label"> 确认密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="a_password" id="checkpassword"
                                           placeholder="请确认密码" onchange="verifypassword()">
                                    <input type="hidden" id="passcheck" value="${yanzhen}" name="checkpassword"/>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="checkboxjue" class="col-sm-2 control-label">选择角色</label>
                                <div class="col-sm-10">
                                <button type="button" class="btn dropdown-toggle" id="dropdownMenu2"
                                        data-toggle="dropdown" style="background-color: #ffe0d0">
                                    。。。
                                </button>

                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                    <li role="presentation" class="dropdown-header">权限名称</li>
                                    <%--遍历权限名称--%>
                                    <c:forEach items="${maprole}" var="rolelist">
                                        <li role="presentation" style="float: left">
                                            <input type="radio" id="checkboxjue" name="r_id"
                                                   value="${rolelist.key}">${rolelist.value}&nbsp;&nbsp;&nbsp;
                                        </li>


                                    </c:forEach>

                                </ul>

                                </div>
                            </div>
                            <%--遍历权限名称点击选择--%>
                            <div class="form-group">

                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-default">提交</button>
                                    </div>

                            </div>
                        </form>

                        <%----%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>

                    </div>
                </div>
                <%--  --%>
            </div>
        </div>

        <%--修改模态框（Modal）updateMyModal --%>

        <div class="modal fade" id="updateMyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel1">
                            修改用户信息
                        </h4>
                    </div>
                    <div class="modal-body">

                        <%--修改管理员表单--%>
                        <form class="form-horizontal" id="form2" role="form" method="post" action="updateAdmin.html?method=${method}">
                            <div class="form-group">
                                <label for="firstname1" class="col-sm-2 control-label">
                                    用户名：
                                    <input type="hidden" id="olda_id" name="olda_id"/>
                                    <input type="hidden" id="od_name_id" name="od_name_id"/>
                                </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="firstname1"
                                           name="updataa_name">
                                    <input type="hidden" id="updateyanzhen" value="${yanzhen}"
                                           name="updatecheckname"/><span
                                        class="updatechuu"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="checkboxjue" class="col-sm-2 control-label">
                                    角色：
                                </label>
                                <div class="col-sm-10">
                                    <span id="xuanjue"></span>
                                <button type="button" class="btn dropdown-toggle" id="dropdownMenu3"
                                        data-toggle="dropdown" style="background-color: #ffe0d0">
                                    。。。
                                </button>

                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                    <li role="presentation" class="dropdown-header">权限名称</li>
                                    <%--遍历权限名称--%>
                                    <c:forEach items="${maprole}" var="rolelist">

                                        <li role="presentation" style="float: left">
                                            <input type="radio" class="xiucheckbox" name="updatar_id"
                                                   value="${rolelist.key}">${rolelist.value}&nbsp;&nbsp;&nbsp;
                                        </li>


                                    </c:forEach>

                                </ul>
                                </div>
                            </div>
                            <%--通过遍历选择角色--%>



                            </form>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default" id="updatebutton" onclick="xiutijiao()">提交修改</button>
                                </div>
                            </div>
                            <%----%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>

                    </div>
                </div>
                <%-- /.modal-content --%>
            </div>
            <%-- /.modal --%>
        </div>

    </div>
</div>
</body>
</html>