<%--
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
    <title>宝宝信息</title>
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
                <span class="mui-icon mui-icon-left-nav"></span>
                取消
            </button>
            <button class="mui-btn mui-btn-link mui-btn-nav mui-pull-right">
                <a id="save" href="<%=path%>/member/updateBabyInformatione.html?baby_id=${baby.baby_id}"> <span
                        id="iconRight" style="color:white;font-size: 17px">保存</span></a>
            </button>
            <h1 class="mui-title"> ${babyProperty}</h1>
        </header>
        <!-- 主页面内容容器 -->
        <input id="bloodTypeName" value="${baby.baby_blood}" hidden="hidden">
        <div class="mui-content mui-scroll-wrapper" style="border: 1px solid #0cff00;">

            <c:if test="${babyProperty == '血型'}">
                <div>
                    <ul id="bloodType" class="mui-table-view">
                        <li class="bloodTypeLi mui-table-view-cell ">
                            <div style="float:left;" class="bloodType">O型</div>
                            <div style="float:right;">
                                <span class="RightIcon mui-icon"></span></div>
                        </li>
                        <li class="bloodTypeLi mui-table-view-cell">
                            <div style="float:left;" class="bloodType">A型</div>
                            <div style="float:right;">
                                <span class="RightIcon mui-icon"></span></div>
                        </li>
                        <li class="bloodTypeLi mui-table-view-cell">
                            <div style="float:left;" class="bloodType">B型</div>
                            <div style="float:right;">
                                <span class="RightIcon mui-icon"></span></div>
                        </li>
                        <li class="bloodTypeLi mui-table-view-cell">
                            <div style="float:left;" class="bloodType">AB型</div>
                            <div style="float:right;">
                                <span class="RightIcon mui-icon"></span></div>
                        </li>
                        <li class="bloodTypeLi mui-table-view-cell">
                            <div style="float:left;" class="bloodType">未知</div>
                            <div style="float:right;">
                                <span class="RightIcon mui-icon"></span></div>
                        </li>
                    </ul>
                </div>
            </c:if>

            <c:if test="${babyProperty == '小名'}">
                <input type="text" id="babyName" value="${baby.baby_name}">
            </c:if>

        </div>


    </div>
</div>
<script>
    /*返回*/
    $("#myBut").on("tap", function () {
        window.history.back();
    });
    /*已填血型过来时 被选中的状态*/
    $(function () {
        if ($("#bloodTypeName").val().length > 0) {
            var bloodTypeName = $("#bloodTypeName").val();
            console.log(bloodTypeName);
            if (bloodTypeName == "O型") {
                $(".RightIcon").eq(0).addClass("mui-icon-checkmarkempty");
            }
            else if (bloodTypeName == "A型") {
                $(".RightIcon").eq(1).addClass("mui-icon-checkmarkempty");
            }
            else if (bloodTypeName == "B型") {
                $(".RightIcon").eq(2).addClass("mui-icon-checkmarkempty");
            }
            else if (bloodTypeName == "AB型") {
                $(".RightIcon").eq(3).addClass("mui-icon-checkmarkempty");
            }
            else if (bloodTypeName == "未知") {
                $(".RightIcon").eq(4).addClass("mui-icon-checkmarkempty");
            }
        }
    })


    /*  给 血型li 添加class*/
    $(".bloodTypeLi").on("tap", (function () {
            $(".RightIcon").removeClass("mui-icon-checkmarkempty");
            $(this).find(".RightIcon").addClass("mui-icon-checkmarkempty");
        })
    );

    /* 点击保存 的方法*/
    $("#save").on("tap", function () {
        if (${babyProperty == '血型'}) {
           var baby_blood = $(".mui-icon-checkmarkempty").eq(0).closest("li").find(".bloodType")[0].innerText;
            document.location.href = this.href+"&baby_blood="+baby_blood;
        } else if (${babyProperty == '小名'}) {
            var baby_name = $.trim($("#babyName").val());
            if (baby_name == "") {
             /*  $.alert("名字不能为空");*/
            } else {
              document.location.href = this.href + "&baby_name=" + baby_name;
            }
        }
    });

</script>


</body>
</html>
