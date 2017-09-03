<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/17
  Time: 14:12
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
    <title>
    </title>

    <style type="text/css">
        body {
            background-color: #000000;
        }
    </style>
</head>
<body>

<div id="small" class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 主页面标题 -->
        <header class="mui-bar mui-bar-nav" style="background-color: #f7b928;">
            <a href="<%=path%>/member/homePage.html?baby_id=${baby_id}" class="mui-icon mui-icon-left-nav mui-pull-left"
               style="color: white;padding:0px;margin-top:2%;">
                <span style="font-size: 18px;margin-left:-11px;">
                    返回
                </span>
            </a>
            <h1 class="mui-title" style="color:white;">宝宝云相册</h1>
            <a href="#"
               style="font-size:15px;float:right;margin-top:2%;color:white;" id="addAndSoOn">
                <span style="font-size:20px;font-weight:700;">···</span>
            </a>
        </header>

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll"
                 style="width:100%;height: 100%;padding:0px;vertical-align:middle;background: #f3f3f3;">
                <div class="search" style="width: 100%;padding:2%;">
                    <a href="#">
                        <div style="width: 100%;padding:3px;border: 1px solid #C9C9C9;background: white;">
                            <p style="margin: 0px">搜索照片、视频、日记</p>
                        </div>
                    </a>
                </div>
                <div class="nearUpload" style="width: 100%;height: 30%;">
                    <a href="<%=path%>/member/babyAlbumDetails.html?baby_id=${baby_id}&photoType=0">
                        <div style="width: 100%;height: 50%;padding:9px;background:white;border-top: 1px solid #c9c9c9;border-bottom: 1px solid #c9c9c9">
                            <div class="photo" style="width:0px;height: 100%;float:left;display:inline-block;">
                                <img src="<%=path%>/staticState/imgs/back.png" style="width: 100%;height: 100%;">
                            </div>
                            <div style="width: 100px;margin-top:7%;float: left;padding-left:10px;font-size:16px;">
                                最近上传
                                <span style="display: inline-block;float: right;margin-right: 10px">&gt;</span>
                            </div>
                        </div>
                    </a>
                    <a href="<%=path%>/member/babyAlbumDetails.html?baby_id=${baby_id}&photoType=1">
                        <div class="bigPhoto"
                             style="width: 100%;height: 50%;padding:9px;background:white;border-bottom: 1px solid #c9c9c9">
                            <div class="photo" style="width:0px;height: 100%;float:left;display:inline-block;">
                                <img src="<%=path%>/staticState/imgs/back.png" style="width: 100%;height: 100%;">
                            </div>
                            <div style="width: 100px;margin-top:7%;float: left;padding-left:10px;font-size:16px;">
                                所有照片
                                <span style="display: inline-block;float: right;margin-right: 10px">&gt;</span>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>

    </div>
</div>

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
     style="width:80%;padding-top:60%;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <form id="changeCover" action="upLoadPictures" method="post" enctype="multipart/form-data"
                      class="form-horizontal">
                    <div style="font-size:20px;color:black;">提示</div>
                    <div id="addPhoto" style="font-size:17px;color:black;margin:15px auto 0px;">添加照片</div>
                    <div id="addVideo" style="font-size:17px;color:black;margin:15px auto 0px;">添加视频</div>
                    <div id="PrintPhotos" style="font-size:17px;color:black;margin:15px auto 0px;">打印照片</div>
                    <input type="file" name="file" id="changing" onchange="submitPhoto()" style="display:none">
                    <input type="hidden" name="albumAdd" style="display:none" value="fengmian" id="albumAdd">
                </form>
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

    var photoHeight = $(".photo").height();
    $(".photo").css("width", photoHeight);
    $(".photo").next().css("width", $(".nearUpload").width() - photoHeight - 20);
    $(".eachPhoto").css("height", $(".bigPhoto").height() + 18);
    $(".eachPhoto").next().css("width", $(".nearUpload").width() - photoHeight - 20);

    document.getElementById('addAndSoOn').addEventListener('tap', function () {
        $('#addModal').modal('show');
        $("#addModal").attr("data-show", "true");
    });

    document.getElementById('addPhoto').addEventListener('tap', function () {
        $("#changing").click();
    });

    document.getElementById('addVideo').addEventListener('tap', function () {
        $("#changing").click();
    });

</script>

</body>
</html>
