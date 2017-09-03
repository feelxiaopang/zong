/**
 * Created by Administrator on 2017/6/30.
 */
$(document).ready(function () {
    /* 点击角色表中 任意一行的地方,其行都能被选中*/
    $(".roleTableTR input").click(function () {
        $(this).prop("checked") == true ? $(this).removeProp("checked") : $(this).prop("checked", true);
    });
    $(".roleTableTR").click(function () {
        $(this).find(":checkbox").prop("checked") == true ? $(this).find(":checkbox").removeAttr("checked") : $(this).find(":checkbox").prop("checked", true);
    });

    /*给行加上移入的css效果*/
    $('.roleTableTR').hover(function () {
        $(this).attr("class", "info");
    });
    /* 给行加上移除的css效果*/
    $('.roleTableTR').mouseout(function () {
        $(this).removeClass("info");
    });

    /* 点击角色表中 全选/反选,实现全选/反选*/
    $("#selectAndReverseSelection").click(function () {
        $(this).closest("table").find(".roleTableInput").prop("checked", this.checked);
    });


    /*新增角色权限--子权限单选后 父级权限的状态*/
    $(".sonPowerInput").click(function () {
        $(this).closest("tr").find(".fatherPowerInput").prop("checked", this.checked);
        var count = $(this).closest("tr").find(".sonPowerInput:checked").length;
        if (count > 0) {
            $(this).closest("tr").find(".fatherPowerInput").prop("checked", "checked");
        }
    });


    /* 绑定新增角色 的ajax的验证角色名是否存在*/
    $('#addRoleName').keyup(function () {
        try {
            clearTimeout(sto);
        } catch (e) {
        }
        sto = setTimeout(selectRoleName, 500);
    });
    /* 绑定新增角色 ajax 方法*/
    function selectRoleName() {
        var r_name = $('#addRoleName').val();
        $.post($("#DearBabyPath").val() + "/admin/selectRoleName.html", "r_name=" + r_name, function (data, status) {
            $("#addRolePD").html(data);
            if ("已存在" == data) {
                $("#addRolePD").css("color", "red")
            } else {
                $("#addRolePD").css("color", "green")
            }
        }, "html");
    }

    /* 绑定新增角色 的提交方法 */
    $("#addSubmit").click(function (check) {
        var patt = $("#addRolePD").text();

        var fp_id = "";
        $(".sonPowerInput:checked").each(function (i) {
            fp_id = fp_id.concat($(this).val()) + ";";
        });
        $(".fatherPowerInput:checked").each(function (i) {
            fp_id = fp_id.concat($(this).val()) + ";";
        });
        if ("已存在" == patt||fp_id=='') {
            /*此处阻止提交表单*/
            check.preventDefault();
        } else {

            $.ajax({
                async: false,
                type: "post",
                url: $("#DearBabyPath").val() + "/admin/addRole.html",
                data: "r_name=" + $("#addRoleName").val() + "&fp_id=" + fp_id,
                error: function (msg) {
                    $.alert({
                        title: "",
                        content: "错误",
                        confirm: function () {
                            window.location.reload(true);
                        }
                    });
                },
                success: function (data) {
                    $.alert({
                        title: "",
                        content: data,
                        confirm: function () {
                            window.location.reload(true);
                        }
                    });
                }
            }, "html");
        }
    });

    /*新增角色提交事件*/
    function addRoleSubmit() {
        var patt = $("#addRolePD").text();
        if (/true/.test(patt)) {
            return true;
        } else {
            return false;
        }
    };


    /* 绑定删除角色按钮上的click事件,单击时弹出提示*/
    $('#deleteRole').click(function () {
        if ($(".roleTableInput:checked").length == 0) {
            $.alert({
                title: "",
                content: "请选择至少一行数据"
            });
        } else {
            $.confirm({
                title: '确认!',
                content: '确定删除!?',
                confirm: function () {
                    var roleID = "";
                    $(".roleTableInput:checked").each(function (i) {
                        roleID = roleID.concat($(this).val()) + ";";
                    });
                    // 调用删除方法
                    $.ajax({
                        async: true,
                        type: "post",
                        url: $("#DearBabyPath").val() + "/admin/removeRole.html",
                        data: "roleID=" + roleID,
                        error: function (msg) {
                            $.alert({
                                title: "",
                                content: "操作失败",
                                confirm: function () {
                                    window.location.reload(true);
                                }
                            });
                        },
                        success: function (data) {
                            $.alert({
                                title: "",
                                content: "操作成功",
                                confirm: function () {
                                    window.location.reload(true);
                                }
                            });
                        }
                    }, "html");
                },
                cancel: function () {
                    //  $.alert('11已取消!')
                }
            });
        }
    });


    /* 绑定修改角色按钮上的click事件,单击时弹出提示*/
    $('#modifyRole').click(function () {
        if ($(".roleTableInput:checked").length != 1) {
            $.alert({
                title: "",
                content: "请选择一行数据"
            });
            $('#modifyModal').modal('hide');
        } else {
            /*角色id*/
            var r_id = $(".roleTableInput:checked")[0].defaultValue;
            var p_id = "";

            $(".roleTableInput").each(function () {
                if ($(this).val() == r_id) {
                    $(this).closest("tr").find(".rolePowerID").each(function () {
                        p_id = p_id.concat($(this).val()) + ";";
                    });
                    var strs = new Array(); //定义一数组
                    strs = p_id.split(";"); //字符分割
                    $(".modifyFatherPowerInput").removeAttr("checked");
                    $(".modifySonPowerInput").removeAttr("checked");

                    $(".modifyFatherPowerInput").each(function () {
                        for (i = 0; i < strs.length; i++) {
                            if ($(this).val() == parseInt(strs[i])) {
                                $(this).prop("checked", "checked");
                            }
                        }
                    });
                    $(".modifySonPowerInput").each(function () {
                        for (i = 0; i < strs.length; i++) {
                            if ($(this).val() == parseInt(strs[i])) {
                                $(this).prop("checked", "checked");
                            }
                        }
                    });
                }
            });

            $.post($("#DearBabyPath").val() + "/admin/queryRoleName.html", "r_id=" + r_id, function (data, status) {
                $("#modifyRoleName").val(data);
                beforeModifyRoleName = $("#modifyRoleName").val();
                $('#modifyModal').modal('show');
            }, "html");
        }
    });


    /*修改角色权限--子权限单选后 父级权限的状态*/
    $(".modifySonPowerInput").click(function () {
        $(this).closest("tr").find(".modifyFatherPowerInput").prop("checked", this.checked);
        var count = $(this).closest("tr").find(".modifySonPowerInput:checked").length;
        if (count > 0) {
            $(this).closest("tr").find(".modifyFatherPowerInput").prop("checked", "checked");
        }
    });

    /* 绑定修改后角色 的ajax的验证角色名是否存在*/
    $('#modifyRoleName').keyup(function () {
        try {
            clearTimeout(sto);
        } catch (e) {
        }
        sto = setTimeout(selectModifyRoleName, 500);
    });
    /* 绑定新增角色 ajax 方法*/
    function selectModifyRoleName() {
        var r_name = $('#modifyRoleName').val();
        if (beforeModifyRoleName == r_name) {
            $("#modifyRolePD").html("可用").css("color", "green");
        } else {
            $.post($("#DearBabyPath").val() + "/admin/selectRoleName.html", "r_name=" + r_name, function (data, status) {
                $("#modifyRolePD").html(data);
                if ("已存在" == data) {
                    $("#modifyRolePD").css("color", "red");
                } else {
                    $("#modifyRolePD").css("color", "green");
                }
            }, "html");

        }
    }

    /* 绑定修改角色 的提交方法 */
    $("#modifySubmit").click(function (check) {
        var patt = $("#modifyRolePD").text();
        if ("已存在" == patt) {
            /*此处阻止提交表单*/
            check.preventDefault();
        } else {
            var fp_id = "";
            $(".modifySonPowerInput:checked").each(function (i) {
                fp_id = fp_id.concat($(this).val()) + ";";
            });
            $(".modifyFatherPowerInput:checked").each(function (i) {
                fp_id = fp_id.concat($(this).val()) + ";";
            });
            var r_id = $(".roleTableInput:checked")[0].defaultValue;
            $.ajax({
                async: false,
                type: "post",
                url: $("#DearBabyPath").val() + "/admin/modifyRole.html",
                data: "r_name=" + $("#modifyRoleName").val() + "&fp_id=" + fp_id + "&roleID=" + r_id,
                error: function (msg) {
                    $.alert({
                        title: "",
                        content: "错误",
                        confirm: function () {
                            window.location.reload(true);
                        }
                    });
                },
                success: function (data) {
                    $.alert({
                        title: "",
                        content: data,
                        confirm: function () {
                            window.location.reload(true);
                        }
                    });
                }
            }, "html");

        }
    });


    /*修改角色提交事件*/
    function modifySubmit() {
        var patt = $("#modifyRolePD").text();
        if (/true/.test(patt)) {
            return true;
        } else {
            return false;
        }
    };
    /*搜索提交事件*/
    $("#searchButton").click(function (check) {
        $("#searchFrom").attr("action", $("#DearBabyPath").val() + "/admin/rolePowerManage.html").submit();
    });
    /*搜索回车事件*/
    $("#searchInput").keydown(function (e) {
        var curKey = e.which;
        if (curKey == 13) {
            $("#searchFrom").attr("action", $("#DearBabyPath").val() + "/admin/rolePowerManage.html").submit();
        }
    });


});