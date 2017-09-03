/**
 * Created by wujie on 2017/7/11.
 */
/*
 点击修改触发的方法
 */
$(function ttt() {
    $(".thTypeZi").each(function () {
        $(this).dblclick(function () {
            $(".hangxuan").each(function () {
                if ($(this).children().children().children().children().children().prop("checked") == true) {
                    $(this).children().children().children().children().children().prop("checked", false)
                }

            })
            $("#theme_id").val($(this).prev().children().children().children().children().val());
            $('#myModal').modal('show');
            $("#myModal").attr("data-show", "true");
            $("#theme_type").attr("placeholder", $(this).html());
            $("#theme_type").val($(this).html())
            $('#theme_type').focus(function () {

            });
            $('#theme_type').blur(function () {
                var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
                if (reg.test($('#theme_type').val())) {
                    $.ajax({
                        type: "POST",
                        url: "queryTheme.html",
                        data: "theme_type=" + $('#theme_type').val() + "&theme_id=" + $("#theme_id").val(),
                        success: function (data) {
                            if (data == 'true') {
                                $.ajax({
                                    type: "POST",
                                    url: "updateTheme.html",
                                    data: "theme_type=" + $('#theme_type').val() + "&theme_id=" + $("#theme_id").val(),
                                    success: function (data) {
                                        alert("修改成功");
                                        window.location.reload();
                                    }
                                });
                                window.location.reload();
                            }
                            if (data == 'false') {
                                $("#sheti").html("社区名不能重复！")

                            }

                        }
                    });
                } else {
                    alert("社区名格式不正确！")
                }


            });
        })
    })
});
function community_delete() {
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
                    $("#deleteTheme").val(str);
                    $.ajax({
                        type: "POST",
                        url: "deleteTheme.html",
                        data: "deleteTheme=" + $("#deleteTheme").val(),
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
                $("#deleteTheme").val(str);
                console.log(str);
                $.ajax({
                    type: "POST",
                    url: "deleteTheme.html",
                    data: "deleteTheme=" + $("#deleteTheme").val(),
                    success: function (data) {
                        alert("删除成功");
                        window.location.reload();
                    }
                });
            }
        }
    }
}
function community_add() {
    $("#biaoJi").after(function () {
        // "<tr>"+"<td class='active'><button class='btn btn-info'style='margin-left: 10px' onclick='quxiao()'>取消</button></td>"+"<td class='col-sm-offset-2 col-sm-10'><input type='text' placeholder='请输入社区名字' name='theme_type' id='add_community' onchange='add_community()' style='width: auto' onblur='t()' /></td>"+"</tr>"
        return "<tr class='hangxuan' style='height: 30px;width: 50%' ><td class='active' style='height: 30px;width: 50%'><div class='col-sm-offset-1 col-sm-10'> <div class='checkbox'><label><button class='btn btn-info'style='width: auto;height: auto' onclick='quxiao()'>取消</button><button class='btn btn-info' style='width: auto;height: auto' >提交</button> </label> </div> </div> </td> <td class='thTypeZi' style='height: 30px;width: 50%'><input type='text' placeholder='请输入社区名字' name='theme_type' id='add_community' onchange='add_community()' style='width: auto;height: auto' onblur='t()' /></td> </tr>"
    })
    $(".hangxuan").each(function () {
            if ($(this).children().children().children().children().children().prop("checked") == true) {
                $(this).children().children().children().children().children().prop("checked", false)
            }

        })
}
function add_community() {
    var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
    if (reg.test($('#add_community').val())) {
        $.ajax({
            type: "POST",
            url: "queryTheme.html",
            data: "theme_type=" + $("#add_community").val(),
            success: function (data) {
                if (data == 'true') {
                    $.ajax({
                        type: "POST",
                        url: "addTheme.html",
                        data: "theme_type=" + $("#add_community").val(),
                        success: function (data) {
                            alert("增加成功");
                            window.location.reload();
                        }
                    });
                    window.location.reload();
                }
                if (data == 'false') {
                    $("#sheti").html("社区名不能重复！")

                }

            }
        });
    } else {
        alert("社区名格式不正确！")
    }

}
function t() {

    if ($("#add_community").val() == null || $("#add_community").val() == "") {
        window.location.reload();
    }

}
function tijishequ() {
    var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
    if (reg.test($('#theme_type').val())) {
        $.ajax({
            type: "POST",
            url: "queryTheme.html",
            data: "theme_type=" + $('#theme_type').val() + "&theme_id=" + $("#theme_id").val(),
            success: function (data) {
                if (data == 'true') {
                    $.ajax({
                        type: "POST",
                        url: "updateTheme.html",
                        data: "theme_type=" + $('#theme_type').val() + "&theme_id=" + $("#theme_id").val(),
                        success: function (data) {
                            alert("修改成功");
                            window.location.reload();
                        }
                    });
                    window.location.reload();
                }
                if (data == 'false') {
                    $("#sheti").html("社区名不能重复！")

                }

            }
        });
    } else {
        alert("社区名格式不正确！")
    }
}
$(function hangxuan() {
    $(".hangxuan").each(function () {
        $(this).click(function () {
            if ($(this).children().children().children().children().children().prop("checked") == false) {
                $(this).children().children().children().children().children().prop("checked", true)
            } else {
                $(this).children().children().children().children().children().prop("checked", false)
            }

        })
    })
})
function quxiao() {
    window.location.reload();
}