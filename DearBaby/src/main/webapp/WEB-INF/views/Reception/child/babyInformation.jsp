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
    <title>宝宝信息</title>
    <script src="<%=path%>/staticState/js/APP/babyInformation.js"></script>
    <link href="<%=path%>/staticState/css/APP/homePage.css" type="text/css" rel="stylesheet"/>
    <link href="<%=path%>/staticState/mui/css/mui.picker.min.css" type="text/css" rel="stylesheet"/>
    <script src="<%=path%>/staticState/mui/js/mui.picker.min.js"></script>
    <script src="<%=path%>/staticState/js/rili.js"></script>
    <script type="text/javascript">

        document.addEventListener('plusready', function () {
            //console.log("所有plus api都应该在此事件发生后调用，否则会出现plus is undefined。"

        });

    </script>


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
            <button class="mui-btn mui-btn-link mui-btn-nav mui-pull-right">
                <a href="#sheet" class="mui-btn-block"> <span id="iconRight" class="mui-icon mui-icon-more"></span></a>
            </button>
            <h1 class="mui-title">宝宝信息</h1>
        </header>
        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper" style="">
            <div class="mui-scroll">
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
                </ul>

                <div>
                    <ul class="mui-table-view">
                        <li class="mui-table-view-cell">
                            <a class="babyProperty" class="mui-navigate-right"
                               href="<%=path%>/member/babyUpdateDetails.html?babyProperty=1&baby_id=${baby.baby_id}">
                                <div style="float:left;">小名</div>
                                <div style="float:right;margin-right: 20px">${baby.baby_name}</div>
                            </a>
                        </li>
                        <li class="mui-table-view-cell" id="babySex">
                                <div style="float:left;">性别</div>
                                <div style="float:right;margin-right: 20px">
                                    <c:if test="${empty baby.baby_sex}">未填写</c:if>
                                    <c:if test="${not empty baby.baby_sex}">${baby.baby_sex}</c:if>
                                </div>
                        </li>
                        <li class="mui-table-view-cell" id="babyBirth">
                                <div style="float:left;line-height: 300%">生日</div>
                                <div style="float:left;margin-left: 40px;">
                                    <span id="constellation"></span></div>
                                <div style="float:right;line-height: 300%;margin-right: 20px">${baby.baby_birth}</div>
                        </li>
                        <li class="mui-table-view-cell">
                            <a class="babyProperty" class="mui-navigate-right"
                               href="<%=path%>/member/babyUpdateDetails.html?babyProperty=2&baby_id=${baby.baby_id}">
                                <div style="float:left;">血型</div>
                                <div style="float:right;margin-right: 20px" id="bloodTypeName">
                                    <c:if test="${empty baby.baby_blood}">未填写</c:if>
                                    <c:if test="${not empty baby.baby_blood}">${baby.baby_blood}</c:if>
                                </div>
                            </a>
                        </li>
                        <li class="mui-table-view-cell" id="babyTime">
                                <div style="float:left;">出生时刻</div>
                                <div style="float:right;margin-right: 20px">
                                    <c:if test="${empty baby.baby_time}">未填写</c:if>
                                    <c:if test="${not empty baby.baby_time}">${baby.baby_time}</c:if>
                                </div>
                        </li>
                        <li class="mui-table-view-cell">
                            <a class="babyProperty" class="mui-navigate-right"
                               href="<%=path%>/member/recordPage.html?baby_id=${baby.baby_id}">
                                <div style="float:left;">身高</div>
                                <div style="float:left;margin-left: 40px">
                                    <c:if test="${baby.baby_height==0}">未填写</c:if>
                                    <c:if test="${baby.baby_height !=0}">${baby.baby_height}</c:if>
                                </div>
                                <div style="float:left;margin-left: 40px">体重</div>
                                <div style="float:right;margin-right: 20px">
                                    <c:if test="${baby.baby_weight==0}">未填写</c:if>
                                    <c:if test="${baby.baby_weight !=0}">${baby.baby_weight}</c:if>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>


            </div>
        </div>
    </div>
</div>
<%-- id="small"--%>
<%-- 封面图片--%>
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
                        <input type="hidden" name="baby_id" style="display:none" value="${baby.baby_id}">
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
                    <input hidden="hidden" value="${baby.baby_id}" name="baby_id">
                </form>
            </div>
        </div>
        <%-- /.modal-content --%>
    </div>
    <%-- /.modal --%>
</div>
<%--更多操作--%>
<div id="sheet" class="mui-popover mui-popover-bottom mui-popover-action ">
    <!-- 可选择菜单 -->
    <ul class="mui-table-view">
        <li>
            <h4>更多操作</h4>
        </li>
        <li class="mui-table-view-cell">
            <a href="#">重置邀请码</a>
        </li>
        <li class="mui-table-view-cell" id="deleteBaby">
         删除
        </li>
        <!-- 取消菜单 -->
        <li class="mui-table-view-cell" id="babyClose">
          取消
        </li>
    </ul>
</div>
<%--性别--%>
<div class="modal fade" id="babySexModle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
     style="width:80%;padding-top:60%;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="background: white">
                <%--修改性别表单--%>
                <form id="changebabySex" action="<%=path%>/member/updateBabyInformatione.html" method="post"
                      enctype="multipart/form-data"
                      class="form-horizontal">
                    <input name="baby_id" value="${baby.baby_id}" hidden="hidden">
                    <div style="font-size:20px;color:black;">性别</div>
                        <div style="font-size:17px;color:black;margin:15px auto 0px;">
                        <label class="babySex"><input
                                type="radio" name="baby_sex" value="男孩">男孩</label>
                    </div>
                    <div style="font-size:17px;color:black;margin:15px auto 0px;"><label class="babySex"><input
                            type="radio" name="baby_sex" value="女孩">女孩</label>
                    </div>
                    <div style="font-size:17px;color:black;margin:15px auto 0px;"><label class="babySex"><input
                            type="radio" name="baby_sex" value="未知">未知</label>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--生日--%>
<div class="modal fade" id="babyBirthModle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
     style="width:80%;padding-top:60%;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="background: white;height: 60%">
                <%--修改生日表单--%>
                <form action="<%=path%>/member/updateBabyInformatione.html" method="post"
                      enctype="multipart/form-data"
                      class="form-horizontal">
                    <input name="baby_id" value="${baby.baby_id}" hidden="hidden">
                    <div style="font-size:20px;color:black;">生日</div>
                    <div style="font-size:17px;color:black;margin:15px auto 0px;">
                        <input type="date" name="baby_birth" value="${baby.baby_birth}">
                    </div>
                    <div style="font-size:17px;color:black;margin:15px auto 0px;float: right">
                        <span id="babyBirthClose" class="btn">取消</span> &nbsp;
                        <button type="submit" class="btn-info">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--出生时刻--%>
<div class="modal fade" id="babyTimeModle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
     style="width:80%;padding-top:60%;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="background: white;height: 60%">
                <%--修改出生时刻表单--%>
                <form action="<%=path%>/member/updateBabyInformatione.html" method="post"
                      enctype="multipart/form-data"
                      class="form-horizontal">
                    <input name="baby_id" value="${baby.baby_id}" hidden="hidden">
                    <div style="font-size:20px;color:black;">出生时刻</div>
                    <div style="font-size:17px;color:black;margin:15px auto 0px;">
                    <input type="time" name="baby_time">
                    </div>
                    <div style="font-size:17px;color:black;margin:15px auto 0px;float: right">
                        <span id="babyTimeClose" class="btn">取消</span> &nbsp;
                        <button type="submit" class="btn-info">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    /*返回*/
    $("#myBut").on("tap", function () {
     //   window.history.back();
        document.location.href ="<%=path%>/member/homePage.html?baby_id=${baby.baby_id}"
    });

    document.getElementById("zhaopdiv").addEventListener('tap', function () {
        $('#zhaop').click();
    });

    /*删除宝宝*/
    $("#deleteBaby").on("tap", function () {
        $.confirm({
            title: '确认!',
            content: '确定删除!?',
            confirm: function () {
                document.location.href = "<%=path%>/member/deleteBaby.html?baby_id=${baby.baby_id}";
            },
            cancel: function () {
                //  $.alert('11已取消!')
            }
        });
    });
    /*生日 农历-星座*/
    (function () {
        var str = "${baby.baby_birth}".split('-');
        var lunar = calendar.solar2lunar(str[0], str[1], str[2]);
        $("#constellation").html(lunar.IMonthCn + lunar.IDayCn + "<br/>" + getxingzuo(str[1], str[2]));
    })();

    /*更多模态框取消*/
    $("#babyClose").on("tap", function () {
        mui('#sheet').popover('hide');
    });


    /*点击血型标签跳转*/
    $('.babyProperty').on('tap', function () {
        document.location.href = this.href;
    });

    /*性别模态框打开*/
   $("#babySex").on("tap", function () {
        $('#babySexModle').modal('show');
        $("#babySexModle").attr("data-show", "true");
        var sex = "${baby.baby_sex}";
        if (sex == '男孩') {
            $("[name='baby_sex']")[0].checked = true;
        } else if (sex == '女孩') {
            $("[name='baby_sex']")[1].checked = true;
        } else {
            $("[name='baby_sex']")[2].checked = true;
        }
    });

    /* 性别模态框里的点击事件*/
    $(".babySex").on('touchstart', function () {
        setTimeout(function () {
            $("#changebabySex").submit();
        }, 300);
    });
    /*生日模态框打开*/
    $("#babyBirth").on("tap", function () {
        $('#babyBirthModle').modal('show');
        $("#babyBirthModle").attr("data-show", "true");
    });

    /*生日模态框取消*/
    $("#babyBirthClose").on("tap", function () {
        $('#babyBirthModle').modal('hide');
    });
    /*出生时刻模态框打开*/
    $("#babyTime").on("tap", function () {
        $('#babyTimeModle').modal('show');
        $("#babyTimeModle").attr("data-show", "true");
    });
    /*出生时刻模态框取消*/
    $("#babyTimeClose").on("tap", function () {
        $('#babyTimeModle').modal('hide');
    });
    /* 封面模态框*/
    $('#beidiaji').on('tap', function () {
        $('#beiModal').modal('show');
        $("#beiModal").attr("data-show", "true");
    });
    /*本地相册处罚事件*/
    document.getElementById('localPhoto').addEventListener('tap', function () {
        $("#changing").click();
    });
    /*上传封面*/
    function zhaoptijiao(check) {
        $("#Szhaop").submit();
    }
    function submitPhoto() {
        $("#changeCover").submit();
    }
</script>

</body>
</html>
