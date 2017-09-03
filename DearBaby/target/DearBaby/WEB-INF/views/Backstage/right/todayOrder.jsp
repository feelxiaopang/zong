<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/5
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="background:url('<%=path%>/staticState/imgs/home_image.png') no-repeat -200px -20px;background-attachment:fixed">
<div class="bigDiv">
<c:if test="${empty todayOrder}">
    <div style="width: 400px;height: 50px;border-radius: 6px;margin: 200px auto">
        <p style="font-family: DFKai-SB;font-size: 30px;line-height: 50px">
            今日暂时还没有订单哦...=_=
        </p>
    </div>
</c:if>
<c:if test="${not empty todayOrder}">
    <table class="table table-hover">
        <tr style="text-align: center">
            <th>订单号</th>
            <th>订单时间</th>
            <th>订单状态</th>
            <th>收货人</th>
            <th>邮编</th>
            <th>收货地址</th>
            <th>电话</th>
            <th>状态</th>
        </tr>
        <tbody>
        <c:forEach items="${todayOrder}" begin="0" end="20" var="todayOrder">
            <tr>
                <td>${todayOrder.order_num}</td>
                <td>${todayOrder.order_time}</td>
                <td>${todayOrder.order_status}</td>
                <td>${todayOrder.consignee}</td>
                <td>${todayOrder.zipcode}</td>
                <td>${todayOrder.address}</td>
                <td>${todayOrder.tel}</td>
                <td>
                    <c:if test="${todayOrder.order_status==1}">
                        未付款
                    </c:if>
                    <c:if test="${todayOrder.order_status==2}">
                        已付款
                    </c:if>
                    <c:if test="${todayOrder.order_status==3}">
                        已发货
                    </c:if>
                    <c:if test="${todayOrder.order_status==4}">
                        已收货
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</div>
</body>
</html>
