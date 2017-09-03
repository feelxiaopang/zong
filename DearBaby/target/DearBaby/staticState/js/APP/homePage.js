/**
 * Created by chenfumei on 2017/6/22.
 */
function zhaoptijiao() {
    $("#Szhaop").submit();
}
$(function () {

    document.getElementById('myBut').addEventListener('tap', function () {
        mui.plusReady(function () {

            var newURL = 'http://10.0.8.18:8080/DearBaby/member/baby.html';
            var self = plus.webview.currentWebview();
            var sub = plus.webview.create(newURL, newURL, {
                top: '0px',
                bottom: '0px',
                scrollIndicator: "none"
            })
            self.append(sub);
            plus.webview.show(newURL);
        })
    });

    document.getElementById('localPhoto').addEventListener('tap', function () {

        $("#changing").click();

    });
    document.getElementById('beidiaji').addEventListener('tap', function () {

        $('#beiModal').modal('show');
        $("#beiModal").attr("data-show", "true");

    });
    document.getElementById('iconRight').addEventListener('tap', function () {

        $('#shuoModal').modal('show');
        $("#shuoModal").attr("data-show", "true");

    });
    document.getElementById('zhaopdiv').addEventListener('tap', function () {
        $('#zhaop').click();
    });
    var rightWord = $(".mui-card").height();
    // alert(rightWord);
    // 给每一次动态大框赋予高度$(this).children(".mui-card").height()
    $(".timeAndThing").css("height", rightWord + 25);

    var bigThingHeight = 0;
    $(".timeAndThing").each(function () {
        // 获取imageDiv的宽度 并且赋予给imageDiv的宽度
        var imageHeight = $(this).find(".mui-card-image").width();
        $(".imageDiv").css("height", imageHeight);
        // 获取rightWord的高度 并且累加
        var rightHeight = $(this).children(".rightWord").height();
        $(this).height(rightHeight);
        var d = $(this).height();
        $("#shuoModal").attr("width",document.body.clientWidth+'px').attr("height",document.body.clientHeight+'px');
        console.log("这个高度为" + $(this).children(".rightWord").height() + "+" + $(this).find(".mui-card-image").width());
        bigThingHeight += d;
    });
    // alert(bigThingHeight);
    $(".bigThing").css("height", bigThingHeight + 20);

    var headPhoto = $("#headPhoto").height();
    var babyMenu = $(".babyMenu").height();
    var bigThing = $(".bigThing").height();
    $(".mui-scroll").css("height", headPhoto + babyMenu + bigThing);


    (function ($) {
        $(".mui-scroll-wrapper").scroll({
            bounce: false,//滚动条是否有弹力默认是true
            indicators: false, //是否显示滚动条,默认是true
        });
    })(mui);

    // 测试滑动
    // $("#left-menu").on('tap',
    //     function(event) {
    //         mui('.mui-off-canvas-wrap').offCanvas('show');
    //     });
    //
    // window.onload = function() {
    //     mui('#offCanvasSideScroll').scroll();
    //     mui('#small').scroll();
    // }

    /*document.getElementById('myBut').addEventListener('tap', function () {
     mui.openWindow({
     url: "http://10.0.8.41:8080/DearBaby/member/baby.html",
     id: "small",
     styles: {
     top: "0px",//新页面顶部位置
     bottom: "50px",//新页面底部位置

     },
     show: {
     autoShow: true,
     aniShow: "slide-in-left"
     }
     })
     })*/
    /* document.getElementById('myBut').addEventListener('tap', function () {
     var parent=plus.webview.currentWebview().parent();
     var sub = plus.webview.create(newURL,newURL, {
     top: '0px',
     bottom: '50px',
     scrollIndicator: "none"
     })
     parent.append(sub);
     plus.webview.show(newURL);
     })*/
})
