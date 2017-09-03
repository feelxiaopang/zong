/**
 * Created by chenfumei on 2017/7/14.
 */
function de() {
    console.log($(this))
    console.log($(this))
    $(this).prev().prop("checked", true);
    console.log($(this).html());
    $("#r_name").val($(this).html());
};

$(function () {
    $(".photo").css("height", $(".photo").width());
})
function bbtou() {
    $('#bbMyModal').modal('show')
    $("#bbMyModal").attr("data-show", "true");
}
function xuantou() {
    $("#firstname1").click();
}
function tijiao() {
    $("#bbphoto").submit();
}
function addbb() {
    $("#r_name").val($(".relation:checked").val());
    console.log($("#baby_name").val())
    console.log($("#baby_birth").val())
    console.log($("#r_name").val())
    if ($("#baby_name").val() != null && $("#baby_name").val() != ''&& $("#baby_birth").val() != ''&& $("#baby_birth").val() != null && $("#r_name").val() != ''&& $("#r_name").val() != null) {
        $("#addbb").submit();
    } else {
        alert("请完善资料!!");
    }
}
function dibi() {
    $('#biModal').modal('show')
    $("#biModal").attr("data-show", "true");
}
function bigai() {
    $("#baby_birth").val($("#infor_birth").val())
    var str = $("#infor_birth").val().split('-');
    var lunar = calendar.solar2lunar(str[0], str[1], str[2]);
    $(".constellation").html(lunar.IMonthCn + lunar.IDayCn+"<br/>"+getxingzuo(str[1], str[2]));
}