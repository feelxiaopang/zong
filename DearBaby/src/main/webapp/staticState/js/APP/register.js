/**
 * Created by wujie on 2017/6/21.
 */
/*
 调用ajax验证账号是否存在
 */

$(function(){
    //按钮单击时执行
    $("#u_pNumber").change(function(){

        var str = $("#u_pNumber").val();
        var ret = /^[0-9]{11}$/;
        if(ret.test(str)){
            $.ajax({
                type: "POST",
                url: "verifyAccount",
                data: "updatename="+$('#u_pNumber').val()+"",
                success: function(data){
                    $(".chuu").html(data);
                    if (data=="true"){
                        $("#yanzhen").val("true");
                        alert("账号可以使用");
                    }else{
                        $("#yanzhen").val("false");
                        alert("账号已存在");
                    }
                }
            });
        }else{
            $("#yanzhen").val("false");
            alert('账户名格式错误');
        }

    });
});
/*
 验证密码格式是否正确
 */
function yanzhenpassword() {


    var str = $("#u_password").val();
    var ret = /^[A-Za-z0-9]+$/;
    if(!ret.test(str)){
        $("#yanzhen").val("false");
        $(".ketishi").html("密码格式错误");
    }else{
        $(".ketishi").html("密码格式正确");
        if ( $("#yanzhen").val()=='false'){
            $("#yanzhen").val("false");
        }
        if ( $("#yanzhen").val()=='true'){
            $("#yanzhen").val("true");
        }
    }
}
function addBao() {
    mui.openWindow({
        url: "http://10.0.8.41:8080/DearBaby/member/addBaby.html",
        id: "small",
        styles: {
            top: "0px",//新页面顶部位置
            bottom: "0px",//新页面底部位置

        }
    });};
function queding() {
    //利用对话框返回的值 （true 或者 false）
    if (confirm("确定退出？")) {
        mui.openWindow({
            url: "http://10.0.8.41:8080/DearBaby/member/logout",
            id: "small",
            styles: {
                top: "0px",//新页面顶部位置
                bottom: "0px",//新页面底部位置

            }
        })
    }
    else {

    }
}
function phototiji() {
    if($("#firstname1").val()!=null&&$("#firstname1").val()!=""){
        $("#reUpda").submit();
    }else{
        alert("请选择图片")
    }

}
function diaregi() {
    if($("#u_pNumber").val()!=null&&$("#u_pNumber").val()!=''&&$("#u_password").val()!=null&&$("#u_password").val()!=''){
        $("#userti").submit();
    }else{
        alert("请完善资料：如账号,密码,昵称")
    }


}
