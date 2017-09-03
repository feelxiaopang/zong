/**
 * Created by wujie on 2017/6/29.
 */
/*
 点击修改触发的方法
 */
function obtain_id() {
    if ($("input:checkbox[name='select_id']:checked").val() != null && $("input:checkbox[name='select_id']:checked").length == 1) {
        /**
         * $(".ob_id").length用于判断是否多选
         */firstname1
        /**$(".ob_id").parent().parent().parent().parent().next().html()用户名
         *$(".ob_id").parent().parent().parent().parent().next().next().html()=$("#ide")角色
         * $(".ob_id").parent().parent().parent().parent().next().next().next().children().children("ul").children("li").children().length权限名称
         */
        $("#olda_id").val($("input:checkbox[name='select_id']:checked").val())
        $("#od_name_id").val($("input:checkbox[name='select_id']:checked").val());
        //console.log($(".ob_id").parent().parent().parent().parent().next().next().next().children().children("ul").children("li").children().length);
        $(".od_name_id").html($("input:checkbox[name='select_id']:checked").parent().parent().parent().parent().next().html());
        $("#firstname1").attr("placeholder", $("input:checkbox[name='select_id']:checked").parent().parent().parent().parent().next().html());
        $("#updataa_name").val($("input:checkbox[name='select_id']:checked").parent().parent().parent().parent().next().html())
        $("#xuanjue").html($("input:checkbox[name='select_id']:checked").parent().parent().parent().parent().next().next().html())
        $('#updateMyModal').modal('show');
        $("#updateMyModal").attr("data-show", "true");
    } else if($("input:checkbox[name='select_id']:checked").val() == null) {
        alert("请选择修改对象")
    }else{
        alert("不能修改多个对象")
    }

};
/*
 调用ajax验证账号是否存在
 */
$(function () {
    //按钮单击时执行
    $("#updatename").change(function () {

        var str = $("#updatename").val();
        var ret = /^[a-zA-Z][a-zA-Z0-9_]{0,20}$/;
        if (ret.test(str)) {
            $.ajax({
                type: "POST",
                url: "verifyAccount.html",
                data: "updatename=" + $('#updatename').val() + "",
                success: function (data) {
                    $(".chuu").html(data);
                    if (data == "true") {
                        $("#yanzhen").val("true");
                        $(".chuu").html("账号可以使用");
                    } else {
                        $("#yanzhen").val("false");
                        $(".chuu").html("账号已存在");
                    }
                }
            });
        } else {
            $("#yanzhen").val("false");
            $(".chuu").html("账户名格式错误");
            alert('账户名格式错误');
        }

    });
});
/*
 修改调用ajax验证修改账号是否存在
 */
$(function () {
    //按钮单击时执行
    $("#firstname1").change(function () {
        var str = $("#firstname1").val();
        if (str == $("input:checkbox[name='select_id']:checked").parent().parent().parent().parent().next().html()) {

        } else {
            var ret = /^[a-zA-Z][a-zA-Z0-9_]{0,20}$/;
            if (ret.test(str)) {
                $.ajax({
                    type: "POST",
                    url: "verifyAccount.html",
                    data: "updatename=" + $('#firstname1').val() + "&method=" + $('#yinchang').val(),
                    success: function (data) {
                        $(".chuu").html(data);
                        if (data == "true") {
                            $("#updateyanzhen").val("true");
                            $(".updatechuu").html("账号可以使用");
                        } else {
                            $("#updateyanzhen").val("false");
                            $(".updatechuu").html("账号已存在");
                        }
                    }
                });
            } else {
                $("#yanzhen").val("false");
                $(".chuu").html("账户名格式错误");
                alert('账户名格式错误');
            }
        }


    });
});
/*
 验证密码格式是否正确
 */
function yanzhenpassword() {


    var str = $("#updatepassword").val();
    var ret = /^[A-Za-z0-9]+$/;
    if (!ret.test(str)) {
        $(".chupassword").html("密码格式错误");
    } else {
        $(".chupassword").html("密码格式正确");
    }
}
/*
 验证俩次密码是否一致
 */
function verifypassword() {
    if ($("#updatepassword").val() == $("#checkpassword").val()) {
        $("#passcheck").val("true");
        $(".chupassword").html(" ");
    } else {
        $(".chupassword").html("俩次密码不一致");
    }

}
/*
 获取传入权限ID拼接后传入后台进行删除
 */
function pinr_id() {
    if ($("input:checkbox[name='select_id']:checked").length == 0) {
        alert("请选择删除对象");
    } else {
        if (confirm("确定删除么？")) {


            if ($("input:checkbox[name='select_id']:checked").length > 1) {
                if (confirm("是否删除多个？")) {
                    var str = "";
                    /*
                     遍历出来的id在这拼接
                     */
                    $("input:checkbox[name='select_id']:checked").each(function (i) {
                        if (i == 0) {
                            str = $(this).val();
                        } else {
                            str += ("," + $(this).val())
                        }
                    })
                    $("#updatehid").val(str);
                    $.ajax({
                        type: "POST",
                        url: "deleteAdmin.html",
                        data: "multiplea_id=" + str + "&method=" + $('#yinchang').val(),
                        success: function (data) {

                            alert("删除成功");
                            window.location.reload();
                        }
                    });

                } else {

                }
            } else {
                var str = "";
                /*
                 遍历出来的id在这拼接
                 */
                $("input:checkbox[name='select_id']:checked").each(function (i) {
                    if (i == 0) {
                        str = $(this).val();
                    } else {
                        str += ("," + $(this).val())
                    }
                })
                $("#updatehid").val(str);
                console.log(str);
                $.ajax({
                    type: "POST",
                    url: "deleteAdmin.html",
                    data: "multiplea_id=" + str + "&method=" + $('#yinchang').val(),
                    success: function (data) {
                        alert("删除成功");
                        window.location.reload();
                    }
                });
            }
        }
    }


};
$(function hangxuan() {
    $(".hangxuan").each(function () {
        $(this).click(function () {
            if ($(this).children().children().children().children().children().prop("checked")==false){
                $(this).children().children().children().children().children().prop("checked", true)
            }else{
                $(this).children().children().children().children().children().prop("checked", false)
            }

       })
    })
})
$(function danxuan() {
    $(".ob_id").each(function () {
        $(this).click(function () {
            if ($(this).prop("checked")==false){
                $(this).prop("checked", true)
            }else{
                $(this).prop("checked", false)
            }

        })
    })
})

function xiutijiao() {
    var bi="false";
   $(".xiucheckbox").each(function () {
       if($(this).prop("checked")==true){
           bi="true"
       }
   })
    if (bi=="false"){
        alert(" 请选择角色")
    }else{
        $("#form2").submit();
    }


}
function dijitiao() {
    if($("#tiaozhuanye").val()==""||$("#tiaozhuanye").val()==null){
        alert("请选择跳转到第几页")
    }else {
        if ($("#biiao").val()<$("#tiaozhuanye").val()||$("#tiaozhuanye").val()<0){
            alert("输入页数错误")
        }else{
            $(".tianzhuan").submit()
        }

    }

}
function zong_id() {

    $(".ob_id").each(function () {
        if ($(this).prop("checked")==false){
            $(this).prop("checked", true)
        }else{
            $(this).prop("checked", false)
        }
    })
}

