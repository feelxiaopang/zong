
function diji() {
    $('#updateMyModal').modal('show')
    $("#updateMyModal").attr("data-show","true");
}
function xuantou() {
    $("#firstname1").click();
}
function tijiao() {
    $("#photoupda").submit();
}
function sexdiji() {
    $('#sexModal').modal('show')
    $("#sexModal").attr("data-show","true");
}
function nan() {

    $.ajax({
        type: "POST",
        url: "setInformation.html",
        data: "infor_sex=男",
        success: function(data){
            window.location.reload();
        },

    });

}
function nvdijiao() {
    $.ajax({
        type: "POST",
        url: "setInformation.html",
        data: "infor_sex=女",
        success: function(data){
            window.location.reload();
        }
    });
}

function birthdiji() {
    $('#birthModal').modal('show')
    $("#birthModal").attr("data-show","true");
}
function birthgai() {
    if($("#infor_birth").val()!=null&&$("#infor_birth").val()!=""){
        $.ajax({
            type: "POST",
            url: "setInformation.html",
            data: "infor_birth="+$("#infor_birth").val(),
            success: function(data){
                window.location.reload();
            },

        });
    }else{
        alert("请输入时间")
    }

}

function shuru() {
    if($("#event_content").val().length>60){
        alert("超过60字");
        $("#butt").attr("disabled",true);
    };
}
function ti() {
    if($("#infor_signature").val()!=null&&$("#infor_signature").val()!=""){
        $("#Form1").submit();
    }
    if ($("#u_name").val()!=null&&$("#u_name").val()!=""){
        $("#Form1").submit();
    }

}
function adrssdiji() {
    $('#addrsshModal').modal('show')
    $("#addrsshModal").attr("data-show","true");
}
function addrssgai() {

    if ($("#province option:checked").val()!=null&&$("#province option:checked").val()!=""||$("#city option:checked").val()!=null&&$("#city option:checked").val()!=""||$("#town option:checked").val()!=null&&$("#town option:checked").val()!=""){
        $("#sheng_id").val($("#province option:checked").val()+$("#city option:checked").val()+$("#town option:checked").val())
            $("#addrssForm").submit();

    }


}
function dangdate() {
    $(".zidingdate").attr("checked",false);
    $("#Sdate").val($(".dangqian").html())
}
function Sdate() {
    $(".dangdate").attr("checked",false);
    $('#SdateModal').modal('show');
    $("#SdateModal").attr("data-show","true");

}
function Sdategai() {
    $("#zidingdate").html($("#infor_birth").val());
    $('#SdateModal').modal('hide');
    $("#Sdate").val($("#zidingdate").html())
}
function setSdate() {
        $("#Sdatefrom").submit();
}
function rad1() {
    $("#SCheckRoot").val($(".rootRadio1").val());
}
function rad2() {
    $("#SCheckRoot").val($(".rootRadio2").val());
}
function checkRoot() {
    if ($("#SCheckRoot").val()!=null&&$("#SCheckRoot").val()!=''){
        $("#SCheckRootfrom").submit();
    }

}

function rootcheck() {
    $("#checkTextr").val($("infor_signature").val())
    $("#SRootfrom").submit();
}function dateCheck() {
    $("#checkTextd").val($("infor_signature").val())
    $("#SDatefrom").submit();
}
var first = '';
$(function rr() {
    $(".diTable").each(function () {
        $(this).click(function () {
            first = $(this).find("span").html();
           // console.log($(this).find("span").html());
            $(".diTable").each(function () {
                $(this).css("border","1px solid white")
            })
            if($("#dicheck").prop("checked")==true){
                $("#dicheck").prop("checked", true)
                $(".diTable").each(function () {
                    $(this).css("border","1px solid white")
                })
                $(this).css("border","1px solid green");

            }else{
                $("#dicheck").prop("checked", true);
                $(this).css("border","1px solid green");
            }

        })
    })
})

function xianDiv() {
    if($("#anDIV").prop("checked")==true){
        $("#anDIV").prop("checked", false);
        $("#dicheck").prop("checked", true);
        $("#xiDiv").css("display","");
        $("#divxian").html("第一次")
    }else{
        $("#anDIV").prop("checked", true);
        $("#dicheck").prop("checked", false);
        $("#divxian").html("")
        $("#xiDiv").css("display","none");
    }
}
