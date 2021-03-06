<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/5
  Time: 16:14
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
        <div id="collapseOne" class="panel-collapse collapse in">
            <div class="panel-body">

                <table class="table table-hover">
                    <tr>
                        <th>订单号</th>
                        <th>订单时间</th>
                        <th>收货人</th>
                        <th>邮编</th>
                        <th>收货地址</th>
                        <th>电话</th>
                        <th>订单状态</th>
                    </tr>
                    <tbody>
                    <c:forEach items="${allOrder}" begin="0" end="20" var="myOrder">
                        <tr>
                            <td>${myOrder.order_num}</td>
                            <td>${myOrder.order_time}</td>
                            <td>${myOrder.consignee}</td>
                            <td>${myOrder.zipcode}</td>
                            <td>${myOrder.address}</td>
                            <td>${myOrder.tel}</td>
                            <td>
                                <c:if test="${myOrder.order_status==1}">
                                    未付款
                                </c:if>
                                <c:if test="${myOrder.order_status==2}">
                                    已付款
                                </c:if>
                                <c:if test="${myOrder.order_status==3}">
                                    已发货
                                </c:if>
                                <c:if test="${myOrder.order_status==4}">
                                    已收货
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
</body>
</html>
