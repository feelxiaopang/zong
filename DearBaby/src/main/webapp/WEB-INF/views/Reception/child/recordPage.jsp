<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/10
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>生长记录</title>
    <link href="<%=path%>/staticState/css/APP/homePage.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        document.addEventListener('plusready', function () {
            //console.log("所有plus api都应该在此事件发生后调用，否则会出现plus is undefined。"
        });
    </script>
    <style>
        a {
            text-decoration: none
        }

        li {
            display: block;
            height: 50px;
        }
    </style>
</head>
<body>
<div id="small" class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 主页面标题 -->
        <header id="head" class="mui-bar mui-bar-nav">
            <button id="myBut" class="mui-btn mui-btn-link mui-btn-nav mui-pull-left">
                <span class="mui-icon mui-icon-left-nav" style="font-size: 16px;padding-top:13px;">返回</span>
            </button>


            <button id="addRecord" class="mui-btn mui-btn-link mui-btn-nav mui-pull-right">
                <span class="iconRight" style="color:white;font-size: 17px">添加</span>
            </button>

            <h1 class="mui-title">生长记录</h1>
        </header>
        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" style="height: 100%;padding:0px;">
                <input id="dearBabyPath" value="<%=path%>" hidden="hidden">

                <c:if test="${recordType ==1}">
                    <ul class="mui-table-view">
                        <c:forEach items="${recordList}" var="record">
                            <div class="recordLi">
                                <input class="recordId" value="${record.record_id}" hidden="hidden">
                                <li class="mui-table-view-cell ">${record.record_time}</li>
                                <li class="mui-table-view-cell" style="height: 80px;">
                                    <div style="float:left;">身高 <c:if test="${record.record_height==0}">-</c:if>
                                        <c:if test="${record.record_height !=0}">${baby.baby_weight}<span
                                                style="font-size:15px;color: orange">${record.record_height}</span></c:if>cm
                                    </div>
                                    <div style="float:right;"> 体重
                                        <c:if test="${record.record_weight==0}">-</c:if>
                                        <c:if test="${record.record_weight!=0}">
                                            <span style="font-size:15px;color: orange">${record.record_weight}</span></c:if>kg
                                    </div>
                                    <div style="clear: both;height: 10px"></div>
                                    <div style="float:left;margin-left: 0px"> 头围 <c:if
                                            test="${record.record_touwei ==0}">-</c:if>
                                        <c:if test="${record.record_touwei !=0}">
                                            <span style="font-size:15px;color: orange">${record.record_touwei}</span></c:if>cm
                                    </div>
                                </li>
                            </div>
                        </c:forEach>
                    </ul>
                </c:if>

            </div>
        </div>
    </div>
</div>

<%--操作--%>
<div class="modal fade" id="RecordModle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
     style="width:80%;padding-top:60%;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div style="background: white">
                <%--操作表单--%>
                <ul class="mui-table-view">
                    <li class="mui-table-view-cell">
                        <h4> 操作</h4>
                    </li>
                    <li class="mui-table-view-cell">
                        <a href="#">修改</a>
                    </li>
                    <li class="mui-table-view-cell" id="deleteRecord">
                        删除
                    </li>
                    <li class="mui-table-view-cell" id="RecordClose">
                        取消
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>

    (function ($) {
        $(".mui-scroll-wrapper").scroll({
            bounce: false,//滚动条是否有弹力默认是true
            indicators: false, //是否显示滚动条,默认是true
        });
    })(mui);

    $("#myBut").on("tap", function () {
        document.location.href = $('#dearBabyPath').val() + "/member/babyInformation.html?baby_id=${param.baby_id}";
    });
    /* 点击添加 的方法*/
    $("#addRecord").on("tap", function () {
        document.location.href = $('#dearBabyPath').val() + "/member/recordPage.html?recordType=3&baby_id=${param.baby_id}";
    });
    /* 生长模态框触发*/
    $(".recordLi").on("tap", function () {
        record_id = $(this).find(".recordId").val();
        $('#RecordModle').modal('show');
        $("#RecordModle").attr("data-show", "true");
    });
    /*  删除宝宝生长记录*/
    $("#deleteRecord").on("tap", function () {
        $.confirm({
            title: '确认!',
            content: '确定删除!?',
            confirm: function () {
                document.location.href = $('#dearBabyPath').val() + "/member/deleteRecord.html?baby_id=${param.baby_id}&record_id=" + record_id;
            },
            cancel: function () {
                $('#RecordModle').modal('hide');
            }
        });
    });


    /*更多模态框取消*/
    $("#RecordClose").on("tap", function () {
        $('#RecordModle').modal('hide');
    });


</script>


</body>
</html>
