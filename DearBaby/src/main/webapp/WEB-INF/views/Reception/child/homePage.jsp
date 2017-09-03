<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/21
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>首页</title>
    <link href="<%=path%>/staticState/css/APP/homePage.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" charset="utf-8">
        mui.init();
    </script>


    <script src="<%=path%>/staticState/js/APP/homePage.js"></script>
</head>

<body>
<div id="small" class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">

        <!-- 主页面标题 -->
        <header id="head" class="mui-bar mui-bar-nav">

            <a id="myBut" class="mui-btn mui-btn-link mui-btn-nav mui-pull-left" href="baby.html">
                <span class="mui-icon mui-icon-left-nav" style="font-size: 16px;padding-top:13px;">宝宝</span>
            </a>
            <button class="mui-btn mui-btn-link mui-btn-nav mui-pull-right">
                <span id="iconRight" class="mui-icon mui-icon-camera"></span>
            </button>
            <h1 class="mui-title">${Baby.baby_name}</h1>
        </header>

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" style="height: 100%;padding:0px;">
                <!-- 主界面具体展示内容 position:relative;-->
                <ul id="headPhoto" class="mui-table-view mui-grid-view" style="height: 200px;padding: 0px;">

                    <li class="mui-table-view-cell mui-media mui-col-xs-12"
                        style="width:100%;height:100%;padding: 0px;">
                        <span data-toggle="modal" data-target="#changeCover">
                            <c:if test="${not empty fengmian}">
                                <img class="mui-media-object" src="<%=path%>/staticState/imgs/${fengmian}"
                                     id="beidiaji">
                            </c:if>
                             <c:if test="${empty fengmian}">
                                 <img class="mui-media-object" src="<%=path%>/staticState/imgs/back.png" id="beidiaji">
                             </c:if>
                        </span>
                    </li>

                    <div class="HeadPortrait">
                        <div class="picture"
                             style="background: url('<%=path%>/staticState/imgs/${tengxiang}');background-size: 40px 40px"></div>
                        <span class="birthToToday">&nbsp;出生${days}天</span>
                    </div>
                    <button type="button" class="mui-btn mui-btn-green"
                            style="position:absolute;background:#4edb00;height:26px;bottom:20px;right:13px; padding: 4px;border: none">
                        邀请亲
                    </button>
                </ul>

                <ul class="babyMenu" style="height:45px;padding: 0px;">
                    <li>
                        <a href="babyAlbum.html?baby_id=${Baby.baby_id}" class="menuA">
                            <div class="menuDiv" style="background: #dcebf9">
                                <span style="font-size: small">宝宝<br>云相册</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="menuA">
                            <div class="menuDiv" style="background: #ffeaf2;">
                                <span style="font-size: small">生长<br>记录</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="menuA">
                            <div class="menuDiv" style="background: #dcebf9">
                                <span style="font-size: small">疫苗<br>接种</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="menuA">
                            <div class="menuDiv" style="background: #ffeaf2;">
                                <span style="font-size: small">${guanxicount}<br>位亲</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="bigThings.html?baby_id=${Baby.baby_id}" class="menuA">
                            <div class="menuDiv" style="background: #dcebf9">
                                <span style="font-size: small">宝宝<br>大事记</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="<%=path%>/member/babyInformation.html?baby_id=${Baby.baby_id}" class="menuA">
                            <div class="menuDiv" style="background: #ffeaf2;">
                                <span style="font-size: small">宝宝<br>信息</span>
                            </div>
                        </a>
                    </li>
                </ul>
                <div class="bigThing">
                    <div class="timeLine"></div>
                    <c:forEach items="${growthEvents}" var="growthEvents">
                        <fmt:parseDate var="event" value="${growthEvents.event_time}"
                                       pattern="yyyy-MM-dd"></fmt:parseDate>
                        <fmt:parseDate var="time" value="${date}" pattern="yyyy-MM-dd"></fmt:parseDate>
                        <c:set var="interval" value="${time.time - event.time}"></c:set>
                        <div class="timeAndThing">
                            <div class="leftTime">
                                <div class="detailedTime">
                                    <span style="font-size:20px;color:black;font-weight: 600">${fn:substring(growthEvents.event_time, 8, 10)}</span>
                                    <span style="font-size: 12px">${fn:substring(growthEvents.event_time, 5, 7)}月</span>
                                    <div class="dayLabel"
                                         style="background: url('<%=path%>/staticState/imgs/detailedTime.png');background-size: 100% 100%;">
                                        <span style="font-size: 12px">第<fmt:formatNumber
                                                value="${interval/1000/60/60/24+1}" maxFractionDigits="0"/>天</span>
                                    </div>
                                </div>
                            </div>
                            <div class="rightWord">
                                <div class="mui-card">
                                    <c:if test="${growthEvents.event_first != '0'}">
                                        <div class="mui-card-header"
                                             style="font-size:14px;border: none;">${growthEvents.event_first}</div>
                                    </c:if>
                                    <c:if test="${not empty growthEvents.event_photo}">
                                        <!--图片 内容区-->
                                        <div class="mui-card-image" style="padding: 4px;border: none;">
                                            <div class="imageDiv"
                                                 style="background: url('<%=path%>/staticState/imgs/${growthEvents.event_photo}') no-repeat;width: 100%;height:0px;">
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty growthEvents.event_content}">
                                    <div class="mui-card-content"
                                         style="padding:4px;border: none;">${growthEvents.event_content}</div>
                                    </c:if>
                                        <%-- /.modal-content --%>
                                    <!--页脚，放置补充信息或支持的操作-->
                                    <div class="mui-card-footer"
                                         style="min-height:30px;padding:4px;border: none;">${r_name}，${fn:substring(growthEvents.event_time, 0, 16)}</div>
                                </div>
                                    <%-- /.modal --%>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <%--<宝宝动态显示结束>--%>
    </div>
</div>

<div class="modal fade" id="beiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
     style="width:80%;padding-top:60%;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%--修改封面表单--%>
                <form id="changeCover" action="upLoadPictures" method="post" enctype="multipart/form-data"
                      class="form-horizontal">
                    <div style="font-size:20px;color:black;">设置封面</div>
                    <div style="font-size:17px;color:black;margin:15px auto 0px;">拍照</div>
                    <div id="localPhoto" style="font-size:17px;color:black;margin:15px auto 0px;">本地相册</div>
                    <input type="file" name="file" id="changing" onchange="submitPhoto()" style="display:none">
                    <input type="hidden" name="fileurl" style="display:none" value="fengmian" id="fileurl">
                    <input type="hidden" name="baby_id" style="display:none" value="${Baby.baby_id}" id="baby_id">
                </form>
            </div>
        </div>
        <%-- /.modal-content --%>
    </div>
    <%-- /.modal --%>
</div>


<div class="modal fade" id="shuoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
     style="width: 100%;height: 100%;background-image:url('<%=path%>/staticState/imgs/jil.png');border: 0px solid white">
    <div>
        <div>
            <div style="border: 0px solid white">
                <%--修改封面表单--%>
                <%--照片--%>
                <div style="width: 70px;height: 70px;border-radius: 50px;display: inline-block;position: absolute;left: 30px;top: 270px;"
                     id="zhaopdiv">
                    <form id="Szhaop" method="post" action="upLoadPictures" style="display: none;"
                          enctype="multipart/form-data"
                          class="form-horizontal">
                        <input type="file" name="file" id="zhaop" onchange="zhaoptijiao()" style="display:none">
                        <input type="hidden" name="fileurl" style="display:none" value="Shuo" id="fileurl1">
                        <input type="hidden" name="baby_id" style="display:none" value="${Baby.baby_id}">
                    </form>
                </div>
                <%--视频--%>
                <div style="width: 70px;height: 70px;border-radius: 50px;display: inline-block;position: absolute;left: 140px;top: 270px;">

                </div>
                <%--录音--%>
                <div style="width: 70px;height: 70px;border-radius: 50px;display: inline-block;position: absolute;left: 250px;top: 270px;">

                </div>
                <%--日记--%>
                <div style="width: 70px;height: 70px;border-radius: 50px;display: inline-block;position: absolute;left: 30px;top: 390px;">

                </div>
                <%--大事记--%>
                <a href="babyChang.html?baby_id=${Baby.baby_id}">
                    <div style="width: 70px;height: 70px;border-radius: 50px;display: inline-block;position: absolute;left: 140px;top: 390px;">

                    </div>
                </a>
                <%--升高体重--%>
                <div style="width: 70px;height: 70px;border-radius: 50px;display: inline-block;position: absolute;left: 250px;top: 390px;">

                </div>
            </div>
        </div>
        <%-- /.modal-content --%>
    </div>
    <%-- /.modal --%>
</div>

<script>
    /*点击a标签跳转*/
    mui('body').on('tap', 'a', function () {
        document.location.href = this.href;
    });

    function submitPhoto() {
        $("#changeCover").submit();
    }

</script>
</body>
</html>
