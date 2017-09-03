<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/17
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../../common/lib.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>Title</title>

</head>
<body>

<div id="small" class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">

        <header class="mui-bar mui-bar-nav" style="background-color: #f7b928">
            <a id="myBut" class="mui-btn mui-btn-link mui-btn-nav mui-pull-left" href="homePage.html?baby_id=${baby.baby_id}">
                <span class="mui-icon mui-icon-left-nav" style="font-size: 18px;padding-top:13px;">返回</span>
            </a>
            <h1 class="mui-title" style="color:white">宝宝大事记</h1>
            <a href="#popover"
               style="font-size:15px;float:right;padding:2px;margin-top:8px;color:white;">
                添加
            </a>
        </header>

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" style="height: 100%;padding:0px;">
                <div style="width:100%;height: auto;">
                    <div style="width:30px;height: 30px;border-radius:50%;margin:5px 46%;overflow: hidden">
                        <img src="<%=path%>/staticState/imgs/${baby.baby_photo}" style="width:30px;height: 30px">
                    </div>
                </div>

                <div style="width:100%;height: 100%;">
                    <div style="width:45%;height:auto;float: left; margin: 0px 7px;">

                        <c:forEach items="${growthEvents}" var="res" begin="0" step="2">
                            <fmt:parseDate var="birth" value="${baby.baby_birth}" pattern="yyyy-MM-dd"></fmt:parseDate>
                            <fmt:parseDate var="time" value="${res.event_time}" pattern="yyyy-MM-dd"></fmt:parseDate>
                            <c:set var="interval" value="${time.time - birth.time}"></c:set>
                        <div class="bigThingDiv"
                             style="width:93%;height:auto;margin:0px auto 15px;padding:7px;background-color: white">
                            <div class="smallIcon"
                                 style="width: 25%;height: 50px;float:left;">
                                <img style="width:100%;height: 100%;border-radius: 50%;"
                                     src="<%=path%>/staticState/imgs/1.jpg">
                            </div>
                            <div class="firstBig"
                                 style="width: 28%;height: 50px;float:left;padding:1px 5px;">
                                <span style="color: lightblue;font-size: 13px;display: block;">${res.event_first}</span>
                                <span style="color: lightgray;font-size: 4px;display: block;">第<fmt:formatNumber value="${interval/1000/60/60/24}" maxFractionDigits="0"/>天</span>
                            </div>
                            <div class="bigThingPhoto" style="width:100%;height:160px;clear:left;margin-top:45px;border: 1px solid #000000">
                                <img style="width:100%;height:100%;" src="<%=path%>/staticState/imgs/${res.event_photo}">
                            </div>
                        </div>
                        </c:forEach>
                    </div>

                    <div style="width: 2%;height: 100%;float: left;"></div>
                    <div style="width:45%;height: auto;float: left;margin: 30px 5px 0 5px;">

                    <c:forEach items="${growthEvents}" var="res" begin="1" step="2">.
                        <fmt:parseDate var="birth" value="${baby.baby_birth}" pattern="yyyy-MM-dd"></fmt:parseDate>
                        <fmt:parseDate var="time" value="${res.event_time}" pattern="yyyy-MM-dd"></fmt:parseDate>
                        <c:set var="interval" value="${time.time - birth.time}"></c:set>
                        <div class="bigThingDiv"
                             style="width:93%;height:auto;margin:0px auto 15px;padding:7px;background-color: white">
                            <div class="smallIcon"
                                 style="width: 25%;height: 50px;float:left;">
                                <img style="width:100%;height: 100%;border-radius: 50%;"
                                     src="<%=path%>/staticState/imgs/1.jpg">
                            </div>
                            <div class="firstBig"
                                 style="width: 28%;height: 50px;float:left;padding:1px 5px;">
                                <span style="color: lightblue;font-size: 13px;display: block;">${res.event_first}</span>
                                <span style="color: lightgray;font-size: 4px;display: block;">第<fmt:formatNumber value="${interval/1000/60/60/24}" maxFractionDigits="0"/>天</span>
                            </div>
                            <div class="bigThingPhoto" style="width:100%;height:160px;clear:left;margin-top:45px;border: 1px solid #000000">
                                <img style="width:100%;height:100%;" src="<%=path%>/staticState/imgs/${res.event_photo}">
                            </div>
                        </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%--更多操作--%>
<div id="popover" class="mui-popover mui-popover-bottom mui-popover-action ">
    <!-- 可选择菜单 -->
    <ul class="mui-table-view">
        <li class="mui-table-view-cell">
            <a href="#" id="insert">
                添加照片
            </a>
        </li>
        <li class="mui-table-view-cell">
            <a href="#">添加视频</a>
        </li>
        <!-- 取消菜单 -->
        <li class="mui-table-view-cell">
            <a href="#" id="cancel"><b>取消</b></a>
        </li>
    </ul>
</div>

<form id="file_upload" method="post" action="upLoadPictures" style="display: none;"enctype="multipart/form-data"
      class="form-horizontal">
    <input type="file" name="file" id="photo" onchange="fileChange()">
    <input type="hidden" name="fileurl" value="Shuo" id="fileurl1">
    <input type="hidden" name="baby_id" value="${baby.baby_id}" >
</form>
<script>
    mui('#popover').on('tap','#cancel',function(){
        mui('#popover').popover('hide');
    });
    /*点击a标签跳转*/
    mui('body').on('tap', 'a', function () {
        document.location.href = this.href;
    });


    $(".smallIcon").css("height", $(".smallIcon").width() );
    $(".bigThingPhoto").css("height", $(".bigThingPhoto").width() + 2);
    $(".firstBig").css("width", $(".bigThingDiv").width() - $(".smallIcon").width() - 3);
    $(".firstBig").css("height", $(".smallIcon").height() + 2);

    document.getElementById("insert").addEventListener('tap',function () {
        $("#photo").click();
    })

    function fileChange(){
        var filePath=$("#photo").val();
        if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
            var arr=filePath.split('\\');
            var fileName=arr[arr.length-1];
            $("#file_upload").submit();
        }else{
            return false
        }
    }
</script>
</body>
</html>
