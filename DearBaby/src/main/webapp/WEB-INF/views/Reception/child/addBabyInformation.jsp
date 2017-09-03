<%--
  Created by IntelliJ IDEA.
  User: chenfumei
  Date: 2017/7/14
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>添加宝宝信息</title>
    <script src="<%=path%>/staticState/js/APP/iconfont.js"></script>
    <script src="<%=path%>/staticState/js/APP/addBabyInformation.js"></script>
    <script src="<%=path%>/staticState/js/rili.js"></script>
    <style type="text/css">
        body {
            background-color: #000000;
        }
    </style>
    <script>
        /*点击a标签跳转*/
        mui('body').on('tap', 'a', function () {
            document.location.href = this.href;
        });
    </script>
</head>
<body>
<!-- 主页面容器 -->
<div class="mui-inner-wrap">
    <!-- 主页面标题 -->
    <header class="mui-bar mui-bar-nav" style="background-color: #FFC028">
        <a href="addBaby.html"
           style="font-size:15px;float:left;padding:2px;margin-top:8px;color:white;">
            取消
        </a>
        <h1 class="mui-title" style="color:white">宝宝信息</h1>
        <a href="#" onclick="addbb()" style="font-size:15px;float:right;padding:2px;margin-top:8px;color:white;">
            下一步
        </a>
    </header>
    <div id="offCanvasContentScroll" class="mui-content mui-scroll-wrapper">
        <div class="mui-scroll" style="height:600px;background:#f3f3f3;">
            <%--border: 1px solid saddlebrown--%>
            <form method="post" action="addBabyInfor" style="height:70%;margin-top:5%;" id="addbb">
                <div style="width:100%;height:20%;padding: 0px 3%;background:white;border-top:  1px solid #cfcfcf;border-bottom: 1px solid #cfcfcf;">
                    <div style="height: 50%;padding:0px;border-bottom: 1px solid #cfcfcf">
                        <div style="width:15%;padding:0px;text-align:center;font-size:17px;padding:2px;color:black;display: inline-block;">
                            小名
                        </div>
                        <div style="width:83%;height:100%;padding:0px;display: inline-block;">
                            <input type="hidden" name="baby_sex" value="${baby_sex}">
                            <input type="hidden" name="baby_photo" value="${bbtoux}">
                            <input type="text" name="baby_name" id="baby_name" placeholder="请输入宝宝的小名"
                                   style="height:100%;font-size:17px;padding: 0px;border:none;">
                        </div>
                    </div>
                    <div style="height: 50%;">
                        <div style="width:16%;padding:0px;margin-top:3%;text-align:center;float:left;font-size:17px;padding:2px;color:black;display: inline-block;">
                            生日
                        </div>
                        <div style="width:83%;height:100%;padding:0px;display: inline-block;">
                            <input type="text" name="baby_birth" id="baby_birth" placeholder="请输入宝宝的生日" onclick="dibi()"
                                 style="width:55%;height:100%;padding: 0px;float:left;font-size:17px;color:black;border:none;">
                            </input>
                            <span class="constellation" style="width:25%;height:100%;padding: 1%;text-align:center;color:orange;float:right;font-size:15px;"></span>
                        </div>
                    </div>
                </div>
                <div style="width:100%;height:19%;background:white;">
                    <div style="width:100%;height:45%;font-size:16px;padding-left:5%;padding-top:3%;display:inline-block;background:#f3f3f3;border-bottom: 1px solid #cfcfcf;">
                        你与宝宝的关系
                    </div>
                    <div style="width:100%;height:55%;padding:3% 4%;display: inline-block;font-size:18px;color:black;border-bottom: 1px solid #cfcfcf;">
                        <input name="relation" type="radio" value="mather" style="margin-left: 2%" class="relation"/>
                        <span >妈妈</span>
                        <input name="relation" type="radio" value="father" style="margin-left: 18%" class="relation"/>
                        <span >爸爸</span>
                        <input name="relation" type="radio" value="other" style="margin-left: 18%" class="relation"/>
                        <span >其他</span>
                    </div>
                    <input type="hidden" name="r_name" id="r_name">
                </div>
                <div style="width:100%;height:30%;">
                    <div class="photo" style="width: 15%;height:0px;margin-top:5%;">
                        <a href="#" onclick="bbtou()">
                            <div style="width: 100%;height: 100%;border-radius:50%;border: 1px solid #9B9B9B;">
                                <c:if test="${empty bbtoux}">
                                    <svg class="icon" aria-hidden="true"
                                         style="width: 80%; height: 80%;margin:8% 10%;vertical-align: -0.15em;fill: currentColor;overflow: hidden;color: #8d8888">
                                        <use xlink:href="#icon-mengwa"></use>
                                    </svg>
                                </c:if>
                                <c:if test="${not empty bbtoux}">
                                    <img src="<%=path%>/staticState/imgs/${bbtoux}"
                                         style="width: 100%;height: 100%;border-radius:50%;">
                                </c:if>
                            </div>
                        </a>
                    </div>
                    <div style="width: 100%;margin-top:3%;text-align: center;">点击设置宝宝头像</div>
                </div>
            </form>

        </div>
    </div>
</div>
<input type="hidden" id="rili">

<div class="modal fade" id="bbMyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%--修改管理员表单--%>
                <form action="upLoadPictures" method="post" enctype="multipart/form-data" class="form-horizontal"
                      id="bbphoto">
                    <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">

                        &nbsp;&nbsp;
                        <div style="display: inline-block">设置头像</div>
                        <div style="width: 220px;display: inline-block;color: #8d8888"></div>
                        <span style="color: #8d8888"></span>
                    </div>
                    <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">

                        &nbsp;&nbsp;
                        <div style="display: inline-block">拍照</div>
                        <div style="width: 220px;display: inline-block;color: #8d8888"></div>
                        <span style="color: #8d8888"></span>
                    </div>
                    <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9"
                         onclick="xuantou()">

                        &nbsp;&nbsp;
                        <div style="display: inline-block">本地照片</div>
                        <div style="width: 220px;display: inline-block;color: #8d8888"></div>
                        <span style="color: #8d8888"></span>
                    </div>
                    <input type="file" name="file" id="firstname1" style="display:none">
                    <input type="hidden" name="fileurl" style="display:none" value="bbtoux" id="fileurl">
                </form>
                    <button onclick="tijiao()">
                        提交
                    </button>
            </div>

        </div>
        <%-- /.modal-content --%>
    </div>
    <%-- /.modal --%>
</div>
<div class="modal fade" id="biModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%--修改管理员表单--%>
                <input type="date" name="infor_birth" id="infor_birth" placeholder="请输入时间"/>
            </div>
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="bigai()">提交
            </button>
        </div>
        <%-- /.modal-content --%>
    </div>
    <%-- /.modal --%>
</div>


</body>
