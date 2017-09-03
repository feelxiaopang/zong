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
    <title>角色详情</title>
</head>
<body class="container-fluid"
      style="background: url('<%=path%>/staticState/imgs/home_image.png') no-repeat -200px 0px;background-attachment:fixed;">
<div class="bigDiv" style="height: 700px">
    <div class="smallDiv">

        <a class="btn btn-info" href="<%=path%>/admin/rolePowerManage.html">返回</a>

        <div class="text-center"> <h1> ${r_name} </h1> </div>


        <ul class="list-group">
        <c:forEach items="${roleDetails}" var="fatherRoleDetail">

            <c:if test="${fatherRoleDetail.father_id == 0}">
                <li class="list-group-item" style="background: #c2dbff">  ${fatherRoleDetail.p_name}</li>
                <c:forEach items="${roleDetails}" var="sonRoleDetail">
                    <c:if test="${(sonRoleDetail.father_id+0) == (fatherRoleDetail.p_id+0)}">
                      <span style="line-height: 50px;font-size: 17px">${sonRoleDetail.p_name}</span>
                    </c:if>
                </c:forEach>


            </c:if>


        </c:forEach>
        </ul>
    </div>
</div>

</body>
</html>
