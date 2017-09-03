//关闭登录窗口
$("#remove_login").click(function(){
	$(".hidden_div").css({
		height:0,
		width:0,
		display:"none"
	})
	$("#login_div").hide(1000);
})
//关闭注册窗口
$("#remove_registered").click(function(){
	$(".hidden_div").css({
		height:0,
		width:0,
		display:"none"
	})
	$("#registered_div").hide(1000);
})
//登录账号获得焦点事件
$("#username").focus(function(){
	var username=document.getElementById("username");
	if(username.placeholder=="请输入账号"){
		username.placeholder="";
	}
})
//登录账号失去焦点事件
$("#username").blur(function(){
	var username=document.getElementById("username");
	if(username.placeholder==""){
		username.placeholder="请输入账号";
	}
})
//登录密码获得焦点事件
$("#password").focus(function(){
	var password=document.getElementById("password");
	if(password.placeholder=="请输入密码"){
		password.placeholder="";
	}
})
//登录密码失去焦点事件
$("#password").blur(function(){
	var password=document.getElementById("password");
	if(password.placeholder==""){
		password.placeholder="请输入密码";
	}
})
//登录验证码获得焦点事件
$("#code").focus(function(){
	var code=document.getElementById("code");
	if(code.placeholder=="请输入验证码"){
		code.placeholder="";
	}
})
//登录验证码失去焦点事件
$("#code").blur(function(){
	var code=document.getElementById("code");
	if(code.placeholder==""){
		code.placeholder="请输入验证码";
	}
})
//登录校验
$("#submit_login").click(function(){
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var code = document.getElementById("code").value;
	var b1 = true;
	if(username==null || username==""){
		b1 = false;
		alert("账号不能为空")
	}else if(password==null || password==""){
		b1 = false;
		alert("密码不能为空")
	}else if(code==null || code==""){
		b1 = false;
		alert("验证码不能为空")
	}else{
		b1=true;
	}
	return b1;
})
//点击登录获得登录窗口
$("#login").click(function(){
	var wh = $(Window).height();
	var ht = $(window).width();
	$(".hidden_div").css({
		height:wh,
		width:ht,
		display:"block"
	})
	$("#login_div").show(1000)
})
//点击变手指
$("#login").hover(function(){
	$(this).css("cursor","pointer")
})
$("#registered").hover(function(){
	$(this).css("cursor","pointer")
})
//点击获得注册窗口
$("#registered").click(function(){
	var wh = $(Window).height();
	var ht = $(window).width();
	$(".hidden_div").css({
		height:wh,
		width:ht,
		display:"block"
	})
	$("#registered_div").show(1000)
})
//验证码验证
$("#code").blur(function(){
	var code = document.getElementById("code").value;
	ajaxcode = {
		type:"get",
		url:"login?method=code",
		data:{"codeImage":$("#code").val()},
		dataTyoe:"text",
		success:function(obj){
			if(code==null || code==""){
				$("#p1").html("")
			}else{
				if(obj=="yes"){
					$("#p1").html("验证码正确")
					$("#p1").css("color","gray")
				}else if(obj=="no"){
					$("#p1").html("验证码错误")
					$("#p1").css("color","red")
				}
			}
		}
	}
	$.ajax(ajaxcode);
})
//注册账号获得焦点
$("#username1").focus(function(){
	var username1=document.getElementById("username1");
	if(username1.placeholder=="您的账户名和登录名"){
		username1.placeholder="";
	}
})
//注册账号失去焦点
$("#username1").blur(function(){
	var username1=document.getElementById("username1");
	if(username1.placeholder==""){
		username1.placeholder="您的账户名和登录名";
	}
	ajaxuesr ={
			type:"get",
			url:"registered?method=username",
			data:{"username1":$("#username1").val()},
			dataType:"text",
			success:function(obj){
				var username = document.getElementById("username1").value;
				if(username==null || username ==""){
					$("#p2").html("")
				}else{
					if(obj=="yes"){
						$("#p2").html("账号已存在！！！")
						$("#p2").css("color","red")
					}else{
						$("#p2").html("账号可用")
						$("#p2").css("color","gray")
					}
				}
			}
	}
	$.ajax(ajaxuesr);
})
//注册密码获得焦点
$("#password1").focus(function(){
	var password1=document.getElementById("password1");
	if(password1.placeholder=="请输入您的密码"){
		password1.placeholder="";
	}
})
//注册密码失去焦点
$("#password1").blur(function(){
	if(password1.placeholder==""){
		password1.placeholder="请输入您的密码";
	}
	if($("#password1").val()==null || $("#password1").val()==""){
		$("#p3").html("")
	}else{if($("#password1").val().length>=6 && $("#password1").val().length<=20){
			$("#p3").html("密码正确")
			$("#p3").css("color","gray")
		}else{
			$("#p3").html("密码必须是6-12位数的")
			$("#p3").css("color","red")
		}
	}
})
//注册二次密码获得焦点
$("#password2").focus(function(){
	var password2=document.getElementById("password2");
	if(password2.placeholder=="请再次输入您的密码"){
		password2.placeholder="";
	}
})
//注册二次密码失去焦点
$("#password2").blur(function(){
	var password2=document.getElementById("password2");
	if(password2.placeholder==""){
		password2.placeholder="请再次输入您的密码";
	}
	 var paw1 = document.getElementById("password1").value;
	 var paw2 = document.getElementById("password2").value;
	 if(paw2==null || paw2==""){
		 $("#p4").html("")
	 }else{
		 if(paw1==paw2){
			 $("#p4").html("密码正确")
			 $("#p4").css("color","gray")
		 }else if(paw1!=paw2){
			 $("#p4").html("两次密码不一致")
			 $("#p4").css("color","red")
		 }else{
			 $("#p4").html("")
		 }
	 }
})
//注册手机获得焦点
$("#phone").focus(function(){
	var phone=document.getElementById("phone");
	if(phone.placeholder=="建议使用常用手机"){
		phone.placeholder="";
	}
})
//注册手机失去焦点
$("#phone").blur(function(){
	var phone=document.getElementById("phone");
	if(phone.placeholder==""){
		phone.placeholder="建议使用常用手机";
	}
})
//注册手机获得焦点
$("#registered_code").focus(function(){
	var registered_code=document.getElementById("registered_code");
	if(registered_code.placeholder=="请输入验证码"){
		registered_code.placeholder="";
	}
})
//注册手机失去焦点
$("#registered_code").blur(function(){
	var registered_code=document.getElementById("registered_code");
	if(registered_code.placeholder==""){
		registered_code.placeholder="请输入验证码";
	}
})
//注册校验
$("#registered_submit").click(function(){
	
	var username = document.getElementById("username1").value;
	var password1 = document.getElementById("password1").value;
	var password2 = document.getElementById("password2").value;
	var phone = document.getElementById("phone").value;
	var code = document.getElementById("registered_code").value;
	var b1 = true;
	if(username==null || username==""){
		b1 = false;
		$("#p2").html("账号不能为空")
		$("#p2").css("color","red")
	}else if(password1==null || password1==""){
		b1 = false;
		$("#p3").html("密码不能为空")
		$("#p3").css("color","red")
	}else if(password2==null || password2==""){
		b1 = false;
		$("#p4").html("第二次密码不能为空")
		$("#p4").css("color","red")
	}else if(password1!=password2){
		b1 = false;
		$("#p4").html("两次密码不一致")
		$("#p4").css("color","red")
	}else if(phone==null || phone==""){
		b1 = false;
		$("#p5").html("手机号不能为空")
		$("#p5").css("color","red")
	}else if(code==null || code==""){
		b1 = false;
		$("#p6").html("验证码不能为空")
		$("#p6").css("color","red")
	}else{
		b1 = true;
	}
	return b1;
})