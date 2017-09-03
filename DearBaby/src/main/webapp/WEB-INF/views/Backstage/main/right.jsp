<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/21
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../../common/lib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="background:url('<%=path%>/staticState/imgs/home_image.png') no-repeat -200px -20px;background-attachment:fixed">
<div class="bigDiv1">
    <div class="inforAndOrder">
        <%--管理员个人信息列表--%>
        <div class="information">
            <table class="table table-hover">
                <caption class="inforTable">
                    个人信息
                </caption>
                <tbody>
                <tr style="height: 45px;">
                    <td style="color: #428bca;letter-spacing: 5px;padding: 10px;">账号</td>
                    <td style="font-size: 14px;padding: 10px;">${admin.a_name}</td>
                </tr>
                <tr style="height: 45px">
                    <td style="color: #428bca;letter-spacing: 5px;padding: 10px;">角色名</td>
                    <c:forEach items="${role}" var="role">
                        <td style="font-size: 14px;padding: 10px;">${role.r_name}</td>
                    </c:forEach>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="order">
            <span class="orderUl">订单信息</span>
            <ul class="nav nav-pills nav-stacked" style="font-size: 14.8px;padding: 5px;">
                <li style="float: left;width: 228px;margin-right:5px;">
                    <a href="<%=path%>/admin/untreatedOrder.html" target="showContents">
                        未处理订单
                        <c:if test="${untreatedOrder>0}">
                            <span class="badge" id="untreated">${untreatedOrder}</span>
                        </c:if>
                    </a>
                </li>
                <li style="float: left;width: 228px;margin-top:0px;">
                    <a href="<%=path%>/admin/newOrder.html" target="showContents">
                        最新订单
                        <c:if test="${newOrder>0}">
                            <span class="badge" id="newOrder">${newOrder}</span>
                        </c:if>
                    </a>
                </li>
            </ul>
            <ul class="nav nav-pills nav-stacked" style="font-size: 14.8px;padding: 5px;">
                <li style="float: left;width: 228px;margin-right:5px;">
                    <a href="<%=path%>/admin/allOrder.html" target="showContents">
                        总订单
                        <c:if test="${orderSum>0}">
                            <span class="badge" id="orderSum">${orderSum}</span>
                        </c:if>
                    </a>
                </li>
                <li style="float: left;width: 228px;margin-top:0px;">
                    <a href="<%=path%>/admin/todayOrder.html" target="showContents">
                        今日订单
                        <c:if test="${todayOrder>0}">
                            <span class="badge" id="todayOrder">${todayOrder}</span>
                        </c:if>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <%--系统信息列表--%>
    <div class="message">
        <table class="table table-hover" style="width: 100%;color: #428bca">
            <caption style="letter-spacing:20px;font-family:DFKai-SB;font-size: 23px;color:black;line-height: 40px;vertical-align: bottom">
                系统信息
            </caption>
            <tbody>
            <tr>
                <td>本机IP</td>
                <td>${systemInformation.ip}</td>
            </tr>
            <tr>
                <td>本机名称</td>
                <td>${systemInformation.hostName}</td>
            </tr>
            <tr>
                <td>系统名称</td>
                <td>${systemInformation.osName}</td>
            </tr>
            <tr>
                <td>系统构架</td>
                <td>${systemInformation.osArch}</td>
            </tr>
            <tr>
                <td>系统版本</td>
                <td>${systemInformation.osVersion}</td>
            </tr>
            <tr>
                <td>jre版本</td>
                <td>${systemInformation.jreVendor}</td>
            </tr>
            <tr>
                <td>jvm版本</td>
                <td>${systemInformation.jvmVersion}</td>
            </tr>
            </tbody>
        </table>
    </div>


</div>
</body>
</html>
