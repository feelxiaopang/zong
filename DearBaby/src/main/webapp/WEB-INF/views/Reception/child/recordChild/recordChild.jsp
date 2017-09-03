<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/10
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../../common/lib.jsp" %>
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

        .RightIcon {
            color: #0cff00;
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
                <span class="mui-icon mui-icon-left-nav" style="font-size: 16px;padding-top:13px;">取消</span>
            </button>
            <button id="saveRecord" type="button" class="mui-btn mui-btn-link mui-btn-nav mui-pull-right">
                <span class="iconRight" style="font-size: 17px">保存</span>
            </button>
            <h1 class="mui-title">增加生长记录 </h1>
        </header>
        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper" id="offCanvasContentScroll">
            <div class="mui-scroll" style="height: 100%;padding:0px;">
                <input id="dearBabyPath" value="<%=path%>" hidden="hidden">
                <form action="<%=path%>/member/addRecord.html" method="post" id="recordFrom">
                    <input name="baby_id" value="${param.baby_id}" hidden="hidden">
                    <input name="recordType" value="${recordType}" hidden="hidden">
                    <div>
                        <ul class="mui-table-view">
                            <li class="bloodTypeLi mui-table-view-cell ">
                                <div class="mui-input-row">
                                    <div class="mui-col-xs-2 mui-col-sm-2"
                                         style="float: left; line-height: 200%;font-size: 17px"> 身高
                                    </div>
                                    <div class="mui-col-xs-9 mui-col-sm-9" style="float: left;">
                                        <input type="text" id="babyHeight" name="record_height" class="mui-input-clear"
                                               placeholder="请输入身高"
                                               maxlength="3" style="margin-top: -5px;"
                                               value="0" onfocus="if (value =='0'){value =''}"
                                               onblur="if (value ==''){value='0'}">
                                    </div>
                                    <div class="mui-col-xs-1 mui-col-sm-1"
                                         style="float: right;line-height: 200%;font-size: 17px">
                                        cm
                                    </div>
                                </div>
                            </li>

                            <li class="bloodTypeLi mui-table-view-cell ">
                                <div class="mui-input-row">
                                    <div class="mui-col-xs-2 mui-col-sm-2"
                                         style="float: left; line-height: 200%;font-size: 17px"> 体重
                                    </div>
                                    <div class="mui-col-xs-9 mui-col-sm-9" style="float: left;">
                                        <input type="text" id="babyWeight" name="record_weight" class="mui-input-clear"
                                               placeholder="请输入体重"
                                               maxlength="3" value="0" onfocus="if (value =='0'){value =''}"
                                               onblur="if (value ==''){value='0'}"
                                               style="margin-top: -5px;">
                                    </div>
                                    <div class="mui-col-xs-1 mui-col-sm-1"
                                         style="float: right;line-height: 200%;font-size: 17px">
                                        kg
                                    </div>
                                </div>
                            </li>

                            <li class="bloodTypeLi mui-table-view-cell ">
                                <div class="mui-input-row">
                                    <div class="mui-col-xs-2 mui-col-sm-2"
                                         style="float: left; line-height: 200%;font-size: 17px"> 头围
                                    </div>
                                    <div class="mui-col-xs-9 mui-col-sm-9" style="float: left;">
                                        <input id="babyTouWei" type="text" name="record_touwei" class="mui-input-clear"
                                               placeholder="请输入头围"
                                               maxlength="2" value="0" onfocus="if (value =='0'){value =''}"
                                               onblur="if (value ==''){value='0'}"
                                               style="margin-top: -5px;">
                                    </div>
                                    <div class="mui-col-xs-1 mui-col-sm-1"
                                         style="float: right;line-height: 200%;font-size: 17px">
                                        cm
                                    </div>
                                </div>
                            </li>
                            <%
                                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                                String date = format.format(new Date());
                            %>
                            <li class="bloodTypeLi mui-table-view-cell ">
                                <div class="mui-input-row">
                                    <div class="mui-col-xs-2 mui-col-sm-2"
                                         style="float: left; line-height: 200%;font-size: 17px"> 日期
                                    </div>
                                    <div class="mui-col-xs-9 mui-col-sm-9" style="float: left;">
                                        <input type="date" name="record_time" data-dateType="date" class="mui-getDate"
                                               style="margin-top: -5px;" value="<%=date%>">
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script>

    $("#myBut").on("tap", function () {
        document.location.href = $('#dearBabyPath').val() + "/member/babyInformation.html?baby_id=${param.baby_id}";
    });
    $("#babyHeight,#babyWeight,#babyTouWei").keyup(function () {
        var patt = /\D/g;
        var str = $(this).val();
        if (patt.test(str)) {
            $(this).val(str.replace(patt, ""));
        }
    });

    /* 点击保存 的方法*/
    $("#saveRecord").on("tap", function (check) {
        var babyHeight = $.trim($("#babyHeight").val());
        var babyWeight = $.trim($("#babyWeight").val());
        var babyTouWei = $.trim($("#babyTouWei").val());
        if (babyHeight != undefined && babyHeight != '' && babyWeight != undefined && babyWeight != "" && babyTouWei != undefined && babyTouWei != '') {
            $("#recordFrom").submit();
        } else {
            check.preventDefault();
        }
    });

        (function ($) {
            $("#offCanvasContentScroll").scroll({
                bounce: false,//滚动条是否有弹力默认是true
                indicators: false, //是否显示滚动条,默认是true
            });
        })(mui);



</script>


</body>
</html>
