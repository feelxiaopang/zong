<%--
  Created by IntelliJ IDEA.
  User: wujie
  Date: 2017/7/10
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <script src="<%=path%>/staticState/js/theme.js"></script>
</head>
<body style="background:url('<%=path%>/staticState/imgs/home_image.png') no-repeat -200px -20px;background-attachment:fixed">
<!-- 每页显示数据 -->
<c:set var="pageSize" value="${pageModel.pageSize}"></c:set>
<!-- 总数据数 -->
<c:set var="recordCounts" value="${pageModel.recordCounts}"></c:set>
<!-- 总页数 -->
<c:set var="pageCounts" value="${pageModel.pageCounts}"></c:set>
<!-- 当前页 -->
<c:set var="pageNo" value="${pageModel.pageNo}"></c:set>
<div class="bigDiv">
    <div class="smallDiv">
        <c:forEach items="${power}" var="po">
            <c:if test="${po.p_id==13}">
                <%-- 使用按钮触发模态框 --%>
                <a href="#ch"><button class="btn btn-info" onclick="community_add()">
                    新增
                </button></a>
            </c:if>
            <c:if test="${po.p_id==15}">
                <%-- 删除按钮触发事件 --%>
                <button type="button" class="btn btn-danger" onclick="community_delete()">删除</button>
            </c:if>
        </c:forEach>  <%--多条件搜索框--%>


        <%--遍历用户信息列表--%>
        <div  style="background-color: #ffe0d0">
            <table class="table-bordered"  id="data_table" ng-model="data_table" style="border: 1px solid white;width: 100%;line-height: 50px">
                <%-- 标题第一行--%>
                <tr class="active" style="height: 30px;width: 50%">
                    <th class="active" style='height: 30px;width: 50%'>
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>

                                </label>
                            </div>
                        </div>
                    </th>
                    <th class="active">社区名</th>


                </tr>

                <%-- 通过遍历传的参数id建立数据--%>
                <c:forEach items="${pageModel.list}" var="a_id" varStatus="shuju">

                    <tr class="hangxuan" style="height: 30px;width: 50%">
                        <td class="active" style='height: 30px;width: 50%'>
                            <div class="col-sm-offset-1 col-sm-10">
                                <div class="checkbox">
                                    <label>
                                            <%--至根据遍历添加--%>
                                        <input type="checkbox" class="ob_id" name="select_id" id="select_id" value="${a_id.theme_id}"/>
                                    </label>
                                </div>
                            </div>
                        </td>

                        <td class="thTypeZi" style='height: 30px;width: 50%' >${a_id.theme_type}</td>


                    </tr>


                </c:forEach>
                    <input id="biaoJi" type="hidden" />
            </table>
        </div>

<input id="deleteTheme" type="hidden" name="deleteTheme"/>
        <ul class="pagination">
            <%--描述数据的一些信息--%>

                <!--当前页数>1 显示 上一页按钮 -->
                <c:if test="${pageModel.pageNo>1}">
                    <li><a class="use" href="community.html?pageNo=${pageModel.pageNo-1}">上一页</a></li>
                </c:if>
                <!--当前页数<总页数 显示 下一页按钮 -->
                <c:if test="${pageModel.pageNo<pageModel.pageCounts}">
                    <li><a class="use" href="community.html?pageNo=${pageModel.pageNo+1}">下一页</a></li>
                </c:if>
                </li>
                <li><a name="ch" href="#"><span>共${pageModel.pageCounts}页 当前第${pageModel.pageNo}页</span></a></li>



        </ul>


            <%-- 新增模态框（Modal） --%>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 data-show="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                                <tton>
                                    <h4 class="modal-title" id="myModalLabel">
                                        修改社区名字
                                    </h4>
                                </tton>
                            </button>
                        </div>
                        <div class="modal-body">
                            <%--新增管理员表单--%>
                           <span id="sheti"></span>
                            <input type="text" id="theme_type"/>
                            <input type="hidden" id="theme_id"/>
                            <%----%>
                                <div class="form-group">

                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-default" onclick="tijishequ()">提交</button>
                                    </div>

                                </div>
                        </div>

                    </div>

                    <%--  --%>
                </div>
            </div>
<script>
    $(function () {
        $(".bigDiv").css("height",$(".smallDiv").height()+330)
    })
</script>

</body>
</html>