<%--
  Created by IntelliJ IDEA.
  User: wujie
  Date: 2017/7/5
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../../common/lib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <script src="<%=path%>/staticState/js/APP/information.js"></script>

    <script src="<%=path%>/staticState/js/APP/area.js"></script>
    <script src="<%=path%>/staticState/js/APP/select.js"></script>
    <style>
        select {
            width: auto;
            height: auto;
        }

        .outer {
            width: auto;
            height: auto;
        }
    </style>
</head>
<body>
<header class="mui-bar mui-bar-nav" style="background-color: #FFC028">
    <a class="mui-icon mui-icon-left-nav mui-pull-left" href="more.html"></a>
    <h1 class="mui-title" style="color:white">个人信息</h1>
</header>
<%--作为标题空白处--%>
<div style="height: 60px;background-color: #F9F6F9"></div>

<%--头像--%>
<a href="#" onclick="diji()">
    <div style="height: 70px;background-color: white;line-height: 50px;border-bottom: 1px solid #F9F6F9; position: inherit">
    <span class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 70px ;color:#8d8888; "
    ></span>
        &nbsp;&nbsp;
        <div style="display: inline-block;line-height: 70px;color: #000">头像</div>
        <div style="float: right;margin-top:4px;border-radius: 10%;overflow: hidden">
            <img src="<%=path%>/staticState/imgs/${infor_photo}"
                                       style="display: inline-block ;width: 62px;height: 62px;line-height: 70px">
        </div>
    </div>
</a>
<a href="modifyInformation.html?infor_name=${infor_name}">

    <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9;overflow: hidden">
                <span class="mui-icon mui-icon-arrowright mui-pull-right"
                      style="clear:right;float:right;line-height: 40px ;color:#8d8888; "></span>
        &nbsp;&nbsp;
        <div style="display: inline-block;color: #000">名字</div>
        <span style="float: right;">${infor_name}</span>
    </div>
    <div style="height: 30px;background-color: #F9F6F9;font-size: 10px">

    </div>
    </div>
    </div>
</a>
<a href="#" onclick="sexdiji()">
    <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9">
        <span class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; "></span>
        &nbsp;&nbsp;
        <div style="display: inline-block;color: #000">性别</div>
        <span style="float: right;color: #8d8888">${infor_sex}</span>
    </div>
</a>
<div style="height: 40px;background-color: white;line-height:40px;border-bottom: 1px solid #F9F6F9;overflow: hidden;position: relative"
     onclick="birthdiji()">
    <span class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; "></span>
    &nbsp;&nbsp;
    <div style="display: inline-block;overflow: hidden">生日</div>
    <span style="float:right;color: #8d8888;overflow: hidden;line-height: 40px">${infor_birth}</span>
</div>


<div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9;overflow: hidden"
     onclick="adrssdiji()">
    <span class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; "></span>
    &nbsp;&nbsp;
    <div style="display: inline-block">地区</div>
    <span style="float:right;color: #8d8888 ;overflow: hidden">${infor_address}</span>
</div>
<a href="modifyInformation.html?infor_signature=${infor_signature}">

    <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9;overflow: hidden">
        <span class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 40px ;color:#8d8888; "></span>
        &nbsp;&nbsp;
        <div style="display: inline-block;color: #000">个性签名</div>
        <span style="float:right;color: #8d8888">${infor_signature}</span>
    </div>

</a>


<div class="modal fade" id="updateMyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%--修改管理员表单--%>
                <form action="upLoadPictures" method="post" enctype="multipart/form-data"
                      class="form-horizontal" id="photoupda">
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
                        <div style="display: inline-block">选择照片</div>
                        <div style="width: 220px;display: inline-block;color: #8d8888"></div>
                        <span style="color: #8d8888"></span>
                    </div>
                    <input type="file" name="file" id="firstname1" onchange="tijiao()" style="display:none">
                    <input type="hidden" name="fileurl" style="display:none" value="information" id="fileurl">
                </form>
            </div>

        </div>
        <%-- /.modal-content --%>
    </div>
    <%-- /.modal --%>
</div>


<div class="modal fade" id="sexModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%--修改管理员表单--%>
                <form id="sexForm" action="setInformation.html" method="post" enctype="multipart/form-data"
                      class="form-horizontal">

                    <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9"
                         onclick="nan()">
                        &nbsp;&nbsp;
                        <div style="display: inline-block">男</div>
                        <div style="width: 220px;display: inline-block;color: #8d8888"></div>
                        <span style="color: #8d8888"></span>
                    </div>
                    <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9"
                         onclick="nvdijiao()">
                        &nbsp;&nbsp;
                        <div style="display: inline-block">女</div>
                        <div style="width: 220px;display: inline-block;color: #8d8888"></div>
                        <span style="color: #8d8888"></span>
                    </div>
                    <input name="u_name" value="1" type="hidden"/>
                </form>
            </div>

        </div>
        <%-- /.modal-content --%>
    </div>
    <%-- /.modal --%>
</div>

<div class="modal fade" id="birthModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%--修改管理员表单--%>
                <form id="sexForm" action="setInformation.html" method="post" enctype="multipart/form-data"
                      class="form-horizontal">

                    <input type="date" name="infor_birth" id="infor_birth" placeholder="请输入时间"/>
                    <input name="u_name" value="1" type="hidden"/>
                </form>
                <input type="button" value="提交" onclick="birthgai()"/>
            </div>

        </div>
        <%-- /.modal-content --%>
    </div>
    <%-- /.modal --%>
</div>


<div class="modal fade" id="addrsshModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%--修改管理员表单--%>
                <form id="addrssForm" action="setInformation.html" method="post" enctype="multipart/form-data"
                      class="form-horizontal">

                    <div class="outer">
                        <select name="province" id="province">
                            <option value="请选择" style="width: auto;height: auto">请选择</option>
                        </select>
                        <select name="city" id="city">
                            <option value="请选择" style="width: auto;height: auto">请选择</option>
                        </select>
                        <select name="town" id="town">
                            <option value="请选择" style="width: auto;height: auto">请选择</option>
                        </select>
                    </div>
                    <input type="hidden" name="infor_address" id="sheng_id"/>
                    <input name="u_name" value="1" type="hidden"/>
                </form>
                <input type="button" value="提交" onclick="addrssgai()"/>
            </div>

        </div>
        <%-- /.modal-content --%>
    </div>
    <%-- /.modal --%>
</div>

</body>

</html>
