<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: wujie
  Date: 2017/7/7
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
    <script src="<%=path%>/staticState/js/APP/iconfont.js"></script>
</head>
<body style="background-color: #F9F6F9;">
<input type="hidden" name="baby_id" style="display:none" value="${baby_id}" >

<header class="mui-bar mui-bar-nav" style="background-color: #FFC028">
    <a href="homePage.html?baby_id=${baby_id}" style="font-size: 15px;align-content: center;line-height: 45px;color: white;" id="cancel">取消</a>
    <h1 class="mui-title" style="color:white">宝宝新变化</h1>
    <a class="mui-icon mui-pull-right" style="font-size: 15px;background-color: #FFC028;line-height: 23px" id="butt"><span style="color: white">保存</span></a>
</header>
<%--作为标题空白处--%>
<div style="height: 40px;background-color: #F9F6F9"></div>
<div>
    <textarea name="event_content" style="height: 100px;border: 0px solid white"
              id="event_content" placeholder="宝宝在笑，在跑...还是在发呆?"></textarea>
</div>
<%-- /.modal-content --%>
<div style="height: 30px;">
    <div style="display: inline-block;width: 10px"></div>
    <svg class="icon" aria-hidden="true"
         style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block;">
        <use xlink:href="#icon-luyin"></use>
    </svg>
    <div style="display: inline-block;width: 10px"></div>
    <%--输入框下面按钮--%>
    <svg class="icon" aria-hidden="true"
         style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block">
        <use xlink:href="#icon-xiaolian"></use>
    </svg>
    <div style="display: inline-block;width: 10px"></div>
    <div style="display: inline-block" onclick="xianDiv()">
        <svg class="icon" aria-hidden="true"
             style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block" >
            <use xlink:href="#icon-xiaocao"></use>
        </svg>
        <input type="checkbox" name="Shuo" style="display:none" id="anDIV">
        <span id="divxian"></span>
    </div>
</div>
<div style="height: 10px;background-color: #d5d0d0"></div>
<div style="display: inline-block;width: 100%;border-bottom: 0.5px solid #d1cccc;border-top: 0.2px solid #d1cccc; height: 50px;line-height: 50px"
     onclick="dateCheck()">
    <span class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 50px ;color:#8d8888; "></span>
    <span style="color: #000;">&nbsp;&nbsp;&nbsp;记录时间</span>
    <div style="width: 45%;display: inline-block"></div>
    <span style="color: #8d8888">${Sdate}</span>
    <form style="display: none" action="modificationTime.html" method="post" id="SDatefrom">
        <input type="hidden" name="Shuo"  value="${Shuo}" >
        <input type="hidden" name="baby_id"  value="${baby_id}" >
        <input type="hidden"  name="checkText" id="checkTextd"/>
        <input type="hidden" name="SCheckRoot" value="${SCheckRoot}" />
    </form>
</div>
<div style="display: inline-block;width: 100%;border-bottom: 0.5px solid #d1cccc;height: 50px;line-height: 50px"
     onclick="rootcheck()">
    <span class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 50px ;color:#8d8888; "></span>
    <span style="color: #000;">&nbsp;&nbsp;&nbsp;可见范围</span>
    <div style="width: 45%;display: inline-block"></div>
    <span style="color: #8d8888">${SCheckRoot}</span>
</div>

<form style="display: none" action="checkRoot.html" method="post" id="SRootfrom">
    <input type="hidden" name="Shuo" style="display:none" value="${Shuo}" >
    <input type="hidden" name="baby_id"  value="${baby_id}" >
    <input type="hidden" name="checkText" id="checkTextr"/>
    <input type="hidden" value="${Sdate}" name="Sdate"/>
</form>

<div style="display: inline-block;width: 100%;border-bottom: 0.5px solid #d1cccc; height: 50px;line-height: 50px">
    <span class="mui-icon mui-icon-arrowright mui-pull-right" style="line-height: 50px ;color:#8d8888; "></span>
    <span style="color: #000;">&nbsp;&nbsp;&nbsp;所在位置</span>
    <div style="width: 45%;display: inline-block"></div>
    <span style="color: #8d8888">不显示位置</span>
</div>
<div style="height: 10px;background-color: #d5d0d0"></div>
<div style="display: inline-block;width: 100%;border-bottom: 0.5px solid #d1cccc; height: 80px;line-height: 50px">
    <img src="<%=path%>/staticState/imgs/${Shuo}" style="width: 50px;height: 100%;border: 0.5px solid #8d8888;">
</div>

<div style="display: inline-block;width: 100%;border-bottom: 1px solid #d1cccc; height: 150px;" id="xiDiv">
    <div style="height: 2px;background-color: #ffdd49"></div>
    <div style="height: 30px;border-bottom: 1px solid #8d8888;width: 100%;line-height: 30px">
        <span style="line-height: 30px;">&nbsp;&nbsp;&nbsp;宝宝大事记</span>
        <div style="display: inline-block;width: 45%"></div>
        <input type="checkbox" style="border-radius: 0px;" id="dicheck"/>
        <span style="line-height: 30px;">&nbsp;&nbsp;&nbsp;第一次</span>
    </div>

    <div style="height: 100% ;width: 100%;">
        <div style="display: inline-block;width: 10px"></div>
        <div style="display: inline-block ;width: 30%;height: 20%;" class="diTable">
            <svg class="icon" aria-hidden="true"
                 style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block;">
                <use xlink:href="#icon-diYiCi"></use>
            </svg>
            <span>哭</span>
        </div>
        <div style="display: inline-block ;width: 30%;height: 20%; " class="diTable">

            <svg class="icon" aria-hidden="true"
                 style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block">
                <use xlink:href="#icon-diYiCi"></use>
            </svg>
            <span>抬头</span>
        </div>
        <div style="display: inline-block ;width: 30%;height: 20%;" class="diTable">

            <svg class="icon" aria-hidden="true"
                 style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block">
                <use xlink:href="#icon-diYiCi"></use>
            </svg>
            <span>咿呀语</span>
        </div><br/>
        <div style="display: inline-block;width: 10px"></div>
        <div style="display: inline-block ;width: 30%;height: 20%;" class="diTable">
            <svg class="icon" aria-hidden="true"
                 style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block">
                <use xlink:href="#icon-diYiCi"></use>
            </svg>
            <span>笑</span>
        </div>
        <div style="display: inline-block ;width: 30%;height: 20%;" class="diTable">
            <svg class="icon" aria-hidden="true"
                 style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block">
                <use xlink:href="#icon-diYiCi"></use>
            </svg>
            <span>翻身</span>
        </div>
        <div style="display: inline-block ;width: 30%;height: 20%;" class="diTable">
            <svg class="icon" aria-hidden="true"
                 style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block">
                <use xlink:href="#icon-diYiCi"></use>
            </svg>
            <span>叫妈妈</span>
        </div>
        <br/>
        <div style="display: inline-block;width: 10px"></div>
        <div style="display: inline-block ;width: 30%;height: 20%;" class="diTable">

            <svg class="icon" aria-hidden="true"
                 style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block">
                <use xlink:href="#icon-diYiCi"></use>
            </svg>
            <span>爬</span>
        </div>
        <div style="display: inline-block ;width: 30%;height: 20%;" class="diTable">

            <svg class="icon" aria-hidden="true"
                 style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block">
                <use xlink:href="#icon-diYiCi"></use>
            </svg>
            <span>尿尿</span>
        </div>
        <div style="display: inline-block ;width: 30%;height: 20%;" class="diTable">

            <svg class="icon" aria-hidden="true"
                 style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block">
                <use xlink:href="#icon-diYiCi"></use>
            </svg>
            <span>叫爸爸</span>
        </div>
        <br/>
    </div>
</div>
<form style="display: none" action="newGrowthEvents.html" id="insertForm">
 <input type="hidden" name="event_time" value="${Sdate}">
    <input type="hidden" name="event_content" id="hiddenContent">
    <input type="hidden" name="event_level" id="hiddenLevel">
    <input type="hidden" name="event_address" value="成都">
    <input type="hidden" name="baby_id" value="${baby_id}">
    <input type="hidden" name="event_photo" value="${Shuo}">
    <input type="hidden" name="event_first" id="hiddenFirst">
   </form>
<script>
$(document).ready(function () {
    var first = '';
    $(".diTable").each(function () {
        $(this).click(function () {
            first = $(this).find("span").html();
        });
    })
    $("#butt").click(function () {
        $("#hiddenContent").val($("#event_content").val());
        if(${SCheckRoot=='所有亲'}){
            $("#hiddenLevel").val(1);
        }else{
            $("#hiddenLevel").val(2);
        }
        if(first==''||first==null){
            $("#hiddenFirst").val('0');
        }else{
            $("#hiddenFirst").val("第一次"+first);
        }
       $("#insertForm").submit();
    });

})




</script>

</body>
</html>
