/**
 * Created by Administrator on 2017/6/29.
 */
$("li").click(function () {
    $(".active").removeClass("active");
    $(this).addClass("active");
});
