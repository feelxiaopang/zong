/**
 * Created by Administrator on 2017/6/21.
 */
$(function () {
    var name= $("#babyName").val();
    if(name==null||name==""){
        window.top.location.href="http://10.0.8.41:8080/DearBaby/member/registerUser.html";
    }
})
function cli(url){
    alert(url);
    window.top.location.href=url;
}