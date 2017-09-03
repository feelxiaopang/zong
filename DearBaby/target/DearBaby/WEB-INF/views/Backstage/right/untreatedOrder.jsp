<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/5
  Time: 17:03
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
    <div class="smallDiv">
        <c:if test="${empty untreatedOrder}">
            <div style="width: 400px;height: 50px;background: lightblue;border-radius: 6px;margin: 200px auto">
                <p style="font-family: DFKai-SB;font-size: 30px">
                    今日暂时还没有订单哦...=_=
                </p>
            </div>
        </c:if>
        <c:if test="${not empty untreatedOrder}">
            <table class="table table-hover">
                <tr>
                    <th>订单编号</th>
                    <th>订单号</th>
                    <th>订单时间</th>
                    <th>收货人</th>
                    <th>邮编</th>
                    <th>收货地址</th>
                    <th>电话</th>
                    <th>订单状态</th>
                </tr>
                <tbody>
                <c:forEach items="${untreatedOrder}" begin="0" end="20" var="untreatedOrder">
                    <tr>
                        <td>${untreatedOrder.order_id}</td>
                        <td>${untreatedOrder.order_num}</td>
                        <td>${untreatedOrder.order_time}</td>
                        <td>${untreatedOrder.consignee}</td>
                        <td>${untreatedOrder.zipcode}</td>
                        <td>${untreatedOrder.address}</td>
                        <td>${untreatedOrder.tel}</td>
                        <td>
                            <c:if test="${untreatedOrder.order_status==1}">
                                未付款
                            </c:if>
                            <c:if test="${untreatedOrder.order_status==2}">
                                已付款
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
</body>
</html>
