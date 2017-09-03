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
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>
    </title>
    <script src="<%=path%>/staticState/js/APP/register.js"></script>
    <script src="<%=path%>/staticState/js/APP/iconfont.js"></script>

    <style type="text/css">
        body {
            background-color: #000000;
        }
    </style>
</head>

<body>
<!-- 侧滑导航根容器 -->

<!-- 菜单容器 -->

<!-- 主页面容器 -->
<div class="mui-inner-wrap">
    <!-- 主页面标题 -->
    <header class="mui-bar mui-bar-nav" style="background-color: #FFC028">

        <h1 class="mui-title" style="color:white">更多</h1>
    </header>
    <div id="offCanvasContentScroll" class="mui-content mui-scroll-wrapper">
        <div class="mui-scroll">

            <%--作为标题空白处--%>

            <%--个人信息--%>
            <a href="information.html">
                <div style="height: 90px;background-color: white;border-bottom: 1px solid #F9F6F9">
                    <div style="float: left"><img src="<%=path%>/staticState/imgs/${imgurl}"
                                                  style="display: inline-block ;width: 100px;height: 98%;line-height: 90px">
                    </div>

                    <div style="float: left">
                        <br/>
                        <span style="color: #000">${u_name}</span>
                        <br/>


                        <div style="font-size: 7px;color: #8d8888">
                            <svg class="icon" aria-hidden="true"
                                 style=" width: 20px; height: 20px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block">
                                <use xlink:href="#account"></use>
                                <span style="font-size: 10px">上传一张自己的照片吧！</span>
                            </svg>

                        </div>
                    </div>
                    <span class="mui-icon mui-icon-arrowright mui-pull-right"
                          style="line-height: 90px;color:#8d8888; "></span>
                </div>
            </a>

            <%--添加宝宝--%>
            <div style="height: 90px;background-color: white;border-bottom: 1px solid #F9F6F9">
                <div style="height: 10px"></div>
                <div style="height: 50px">
                    <div style="display: inline-block;width: 52px"></div>
                    <a href="#">
                        <svg class="icon" aria-hidden="true" style=" width: 40px; height: 40px;
            vertical-align: -0.15em;
            fill: currentColor;
            overflow: hidden;
              color: #8d8888">
                            <use xlink:href="#icon-baobao"></use>
                        </svg>
                    </a>
                    <div style="display: inline-block;width: 51px"></div>
                    <a href="#">
                        <svg class="icon" aria-hidden="true" style=" width: 40px; height: 40px;
            vertical-align: -0.15em;
            fill: currentColor;
            overflow: hidden;
              color: #8d8888">
                            <use xlink:href="#icon-yijian"></use>
                        </svg>
                    </a>
                    <div style="display: inline-block;width: 60px"></div>
                    <a href="generalSettings.html">
                        <svg class="icon" aria-hidden="true" style=" width: 40px; height: 40px;
            vertical-align: -0.15em;
            fill: currentColor;
            overflow: hidden;
              color: #8d8888">
                            <use xlink:href="#icon-set"></use>
                        </svg>
                    </a>
                </div>
                <a href="#">
                    <div style="display: inline-block;width: 48px;"></div>
                    <span style="color: #000;">添加宝宝</span></a>
                <a href="#">
                    <div style="display: inline-block;width: 33px ;color: #000;"></div>
                    <span style="color: #000;">意见反馈</span></a>
                <a href="generalSettings.html">
                    <div style="display: inline-block;width: 43px;color: #000;"></div>
                    <span style="color: #000;">通用设置</span></a>
            </div>
            <div style="height: 20px;background-color: #F9F6F9"></div>
            <%--我的宝豆--%>
            <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9 ;width: 100%;">
                <div style="width:40px;height:40px;display: inline-block;float:left;padding: 3px;margin-left: 10px">
                    <svg class="icon" aria-hidden="true"
                         style=" width: 30px; height: 30px; fill: currentColor; overflow: hidden;display: inline-block;line-height: 40px">
                        <use xlink:href="#icon-dou"></use>
                    </svg>
                </div>
                <div style="display: inline-block;height: 40px;float:left;vertical-align: middle;">我的宝豆</div>
                <span class="mui-icon mui-icon-arrowright mui-pull-right"
                      style="line-height: 40px ;color:#8d8888; "></span>
            </div>

            <%--妈咪印--%>
            <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9 ;width: 100%;">
                <div style="width:40px;height:40px;display: inline-block;float:left;padding: 3px;margin-left: 10px">
                    <svg class="icon" aria-hidden="true"
                         style=" width: 30px; height: 30px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block;line-height: 40px">
                        <use xlink:href="#icon-shu"></use>
                    </svg>
                </div>
                <div style="display: inline-block;height: 40px;float:left;vertical-align: middle;">妈咪印</div>
                <span class="mui-icon mui-icon-arrowright mui-pull-right"
                      style="line-height: 40px ;color:#8d8888; "></span>
            </div>
            <div style="height: 20px;background-color: #F9F6F9"></div>
            <%--我的订单--%>
            <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9 ;width: 100%;">
                <div style="width:40px;height:40px;display: inline-block;float:left;padding: 3px;margin-left: 10px">
                    <svg class="icon" aria-hidden="true"
                         style=" width: 30px; height: 30px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block;line-height: 40px">
                        <use xlink:href="#icon-dingdan"></use>
                    </svg>
                </div>
                <div style="display: inline-block;height: 40px;float:left;vertical-align: middle;">我的订单</div>
                <span class="mui-icon mui-icon-arrowright mui-pull-right"
                      style="line-height: 40px ;color:#8d8888; "></span>
            </div>
            <%--喜欢的商品--%>
            <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9 ;width: 100%;">
                <div style="width:40px;height:40px;display: inline-block;float:left;padding: 3px;margin-left: 10px">
                    <svg class="icon" aria-hidden="true"
                         style=" width: 30px; height: 30px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block;line-height: 40px">
                        <use xlink:href="#icon-iconfont-edu04"></use>
                    </svg>
                </div>
                <div style="display: inline-block;height: 40px;float:left;vertical-align: middle;">喜欢的商品</div>
                <span class="mui-icon mui-icon-arrowright mui-pull-right"
                      style="line-height: 40px ;color:#8d8888; "></span>
            </div>
            <%--优惠卷--%>
            <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9 ;width: 100%;">
                <div style="width:40px;height:40px;display: inline-block;float:left;padding: 3px;margin-left: 10px">
                    <svg class="icon" aria-hidden="true"
                         style=" width: 30px; height: 30px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block;line-height: 40px">
                        <use xlink:href="#icon--wodeyouhuijuan"></use>
                    </svg>
                </div>
                <div style="display: inline-block;height: 40px;float:left;vertical-align: middle;">优惠券</div>
                <span class="mui-icon mui-icon-arrowright mui-pull-right"
                      style="line-height: 40px ;color:#8d8888; "></span>
            </div>

            <div style="height: 30px;background-color: #F9F6F9;width: 100%;top: 480px;"></div>
            <%--收藏--%>
            <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9 ;width: 100%;">
                <div style="width:40px;height:40px;display: inline-block;float:left;padding: 3px;margin-left: 10px">
                    <svg class="icon" aria-hidden="true"
                         style=" width: 30px; height: 30px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block;line-height: 40px">
                        <use xlink:href="#icon-ai-mark"></use>
                    </svg>
                </div>
                <div style="display: inline-block;height: 40px;float:left;vertical-align: middle;">收藏</div>
                <span class="mui-icon mui-icon-arrowright mui-pull-right"
                      style="line-height: 40px ;color:#8d8888; "></span>
            </div>
            <%--下载--%>
            <div style="height: 40px;background-color: white;line-height: 40px;border-bottom: 1px solid #F9F6F9 ;width: 100%;">
                <div style="width:40px;height:40px;display: inline-block;float:left;padding: 3px;margin-left: 10px">
                    <svg class="icon" aria-hidden="true"
                         style=" width: 30px; height: 30px;vertical-align: -0.15em; fill: currentColor; overflow: hidden;display: inline-block;line-height: 40px; ">
                        <use xlink:href="#icon-ai"></use>
                    </svg>
                </div>
                <div style="display: inline-block;height: 40px;float:left;vertical-align: middle;">下载</div>
                <span class="mui-icon mui-icon-arrowright mui-pull-right"
                      style="line-height: 40px ;color:#8d8888; "></span>
            </div>
            <div style="height: 50px;background-color: #F9F6F9"></div>


        </div>
    </div>
</div>

<script type="text/javascript" charset="utf-8">
    window.onload = function () {
        mui('#offCanvasContentScroll').scroll({
            bounce: false,//滚动条是否有弹力默认是true
            indicators: false, //是否显示滚动条,默认是true
        });
    }
</script>
</body>

</html>