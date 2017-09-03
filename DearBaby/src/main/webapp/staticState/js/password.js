/**
 * 密码验证js
 *
 * Created by wuxiaoyu on 2017/7/12.
 */
$(function () {
    $(".form-control").each(function () {
        console.log(123);
        $(this).change(function () {
            if($(this).val()==""){
                $("#notice").css("color","red").html("输入不能为空！");
            }else if($(this).val().length>16){
                $("#notice").css("color","red").html("密码长度不能超过16位！");
            }else if (($("#newPwd").val()==$("#comPwd").val())&&($("#comPwd").val()!="")){
                $("#notice").css("color","green").html("两次输入一致");
                $("#subButton").attr("disabled",false);
            }else{
                $("#notice").css("color","red").html("两次输入不一致");
            }
        });
    })
})
