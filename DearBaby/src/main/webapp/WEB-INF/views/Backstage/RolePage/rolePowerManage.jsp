<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/29
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>

<html>
<head>
    <title>角色管理</title>
    <script src="<%=path %>/staticState/js/rolePage.js"></script>
</head>

<!-- container:声明bootstrap容器 -->

<body class="container-fluid"  style="background: url('<%=path%>/staticState/imgs/home_image.png') no-repeat -200px 0px;background-attachment:fixed;">
<input value="<%=path %>" id="DearBabyPath" hidden="hidden">
<div class="bigDiv">
    <div class="smallDiv">
        <div>
            <div class="col-lg-3 col-md-3 col-sm-3">
                <!-- 按钮触发模态框 -->
                <c:forEach items="${AdminPowerList}" var="AdminPower">
                    <c:if test="${AdminPower.p_id == 2}">
                        <button class="btn btn-info" data-toggle="modal" data-target="#addModal" id="insertRole">新增
                        </button>
                    </c:if> <c:if test="${AdminPower.p_id==3}">
                    <button class="btn btn-info" data-toggle="modal" id="modifyRole">修改</button>
                </c:if> <c:if test="${AdminPower.p_id==4}">
                    <button class="btn btn-danger" id="deleteRole">删除</button>
                </c:if>
                </c:forEach>
            </div>
            <div class="col-lg-5 col-md-5 col-sm-5">
                <form method="post" role="form" id="searchFrom">
                    <input type="text" class="form-control" placeholder="请输入角色名" id="searchInput" name="searchRoleName"
                           maxlength="6">
                </form>
            </div>

            <div class="col-lg-1 col-md-1 col-sm-1">
                <span class="btn btn-info" id="searchButton">搜索</span>
            </div>


            <div class="form-group">
                <table class="table table-bordered" id="data_table" ng-model="data_table">
                    <thead>
                    <tr>
                        <th class="col-md-1"><input type="checkbox" id="selectAndReverseSelection"/></th>
                        <th class="col-md-1">序号</th>
                        <th class="col-md-2">角色名称</th>
                        <th class="col-md-8">角色权限</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%-- 遍历角色:--%>
                    <c:if test="${roleList.size()==0}">
                        <tr>
                        <td colspan="4"> <p style="text-align: center;color: red">对不起没有查询到这个角色</p></td>
                        </tr>
                    </c:if>
                    <c:forEach items="${roleList }" var="role" varStatus="id">
                        <tr class="roleTableTR">
                            <td><input class="roleTableInput" type="checkbox" name="r_id" value="${role.r_id}"></td>
                            <td>${id.index+1}</td>
                            <td> <a href="<%=path%>/admin/roleDetails.html?r_name=${role.r_name}">${role.r_name}</a></td>
                            <td>
                                    <%-- 显示权限的个数 归零--%>
                                <c:set var="i" value="0"/>
                                    <%--  所有角色权限的遍历--%>
                                <c:forEach items="${rolePowerMapList }" var="rolePower" varStatus="rolePowerId1">
                                    <%-- 角色id 对应遍历权限--%>
                                    <c:if test="${((rolePower.r_id+0) == (role.r_id+0))&& (rolePower.father_id == 0)}">
                                        <input type="text" class="rolePowerID" value="${rolePower.p_id}"
                                               hidden="hidden"/>
                                       ${rolePower.p_name}
                                        <%-- 显示权限的个数 自增 --%>
                                        <c:set var="i" value="${ i+1 }"/>
                                    </c:if>
                                </c:forEach>

                                <c:forEach items="${rolePowerMapList }" var="rolePower" varStatus="rolePowerId">

                                    <%-- 角色id 对应遍历权限--%>
                                    <c:if test="${((rolePower.r_id+0) == (role.r_id+0)) &&  (rolePower.father_id>0)}">
                                        <input type="text" class="rolePowerID" value="${rolePower.p_id}"
                                               hidden="hidden"/>
                                        <%-- 显示权限的个数 自增 --%>
                                        <c:set var="i" value="${ i+1 }"/>
                                        <%--角色对应的权限 显示个数--%>
                                        <c:if test="${ i < 7}">
                                            ${rolePower.p_name}
                                        </c:if>
                                        <%--角色对应的权限 剩余个数 以 ...显示   --%>
                                        <c:if test="${ i == 7}">
                                            <span>...</span>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>


            <form class="bs-example bs-example-form" role="form" id="addForm" method="post">
                <!-- 模态框（新增Modal） -->
                <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content" style="background-color:#ffe0d0">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <div class="page-information text-center"><h3>新增角色</h3></div>
                            </div>
                            <div class="modal-body">

                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon">角色名</span>
                                    <input type="text" class="form-control" placeholder="请输入角色名" id="addRoleName"
                                           maxlength="6"/>
                                </div>
                                <p class="text-center" id="addRolePD">&nbsp;</p>

                                <p>赋予权限</p>
                                <div>
                                    <table id="addRolePowerTable" class="table table-bordered">
                                        <c:forEach items="${powerList }" var="fatherPower">
                                            <c:if test="${(fatherPower.father_id == 0)}">
                                                <tr style="font-size: 14px">
                                                    <th style="font-size: 15px"><label><input class="fatherPowerInput"
                                                                                              disabled="disabled"
                                                                                              type="checkbox"
                                                                                              name="fp_id"
                                                                                              value="${fatherPower.p_id}"/>${fatherPower.p_name}
                                                    </label>
                                                    </th>
                                                    <c:forEach items="${powerList }" var="SonPower">
                                                        <c:if test="${SonPower.father_id==fatherPower.p_id}">
                                                            <td><label><input class="sonPowerInput" type="checkbox"
                                                                              name="sp_id"
                                                                              value="${SonPower.p_id}">${SonPower.p_name}
                                                            </label>
                                                            </td>
                                                        </c:if>
                                                    </c:forEach>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </table>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" id="addSubmit">提交</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
            </form>


            <form class="bs-example bs-example-form" role="form" method="post">
                <!-- 模态框（修改Modal） -->
                <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content" style="background-color:#ffe0d0">
                            <button type="button" class="close closePower" data-dismiss="modal" aria-hidden="true">×
                            </button>
                            <div class="page-information text-center"><h3>修改角色</h3></div>

                            <div class="modal-body">
                                <%-- 遍历角色:--%>
                                <%--    <c:forEach items="${roleList }" var="role" varStatus="id" begin="0" end="0">--%>
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon">角色名</span>
                                    <input type="text" class="form-control" name="r_name" id="modifyRoleName"
                                           maxlength="6">
                                </div>
                                <p class="text-center" id="modifyRolePD">&nbsp;</p>
                                <p>赋予权限</p>
                                <div>
                                    <table id="modifyRolePowerTable" class="table table-bordered">
                                        <c:forEach items="${powerList }" var="fatherPower">
                                            <c:if test="${(fatherPower.father_id == 0)}">
                                                <tr style="font-size: 14px">
                                                    <th style="font-size: 15px"><label><input
                                                            class="modifyFatherPowerInput"
                                                            disabled="disabled"
                                                            type="checkbox" name="fp_id"
                                                            value="${fatherPower.p_id}"/>${fatherPower.p_name}
                                                    </label>
                                                    </th>
                                                    <c:forEach items="${powerList }" var="SonPower">
                                                        <c:if test="${SonPower.father_id==fatherPower.p_id}">
                                                            <td><label><input class="modifySonPowerInput"
                                                                              type="checkbox"
                                                                              name="sp_id"
                                                                              value="${SonPower.p_id}">${SonPower.p_name}
                                                            </label>
                                                            </td>
                                                        </c:if>
                                                    </c:forEach>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </table>
                                </div>
                                <%--   </c:forEach>--%>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default closePower" data-dismiss="modal">关闭
                                </button>
                                <button type="button" class="btn btn-primary" id="modifySubmit">提交</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
            </form>

        </div>
    </div>
</div>
</body>
</html>