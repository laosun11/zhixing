<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@include file="public/publictaglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>奖学金评定系统</title>
<%@include file="public/publicbootstrap.jsp" %>
<link href="${basePath}bootstrap/css/login.css" rel="stylesheet" type="text/css" />
</head>
<body class="login">
	<div class="logo">
		<img src="${basePath }bootstrap/image/logo.png" alt="logo"/>
	</div>
	<div class="content">
		<!-- BEGIN LOGIN FORM -->
		<form class="form-vertical login-form" action="${basePath}login/login.do" method="post" >
			<h3 class="form-title" align="center">登入</h3>
			<div class="alert alert-error hide">
				<span id="erromsg">Enter any username and password.</span>
			</div>

			<div class="control-group">

				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->

				<label class="control-label visible-ie8 visible-ie9">用户名:</label>

				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" placeholder="用户名" name="userId" id="userId" onkeydown="huiche();"/>
					</div>
				</div>

			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">密码:</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" placeholder="密码" name="pwd" id="pwd" onkeydown="huiche();"/>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button type="button" class="btn green pull-right"  onclick="login();">
					登入 <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</form>
</body>

<script type="text/javascript">
function check(){
	var pwd=$("#pwd").val();
	var userId=$("#userId").val();
	if(!userId){
		$("#erromsg").text("请输入姓名!");
		$(".alert-error").attr("class","alert alert-error");
		return false;
	}
	if(!pwd){
		$("#erromsg").text("请输入密码!");
		$(".alert-error").attr("class","alert alert-error");
		return false;
	}
	return true;
}

/**
 * 登入方法
 */
function login(){
	if(!check()){
		return false;
	}
	var pwd=$("#pwd").val();
	var userId=$("#userId").val();
	$.ajax({
		   type: "POST",
		   url: "${basePath}login/login.do",
		   data: "userId="+userId+"&pwd="+pwd,
		   dataType:"json",
		   async:"false",
		   success: function(msg){
			   if(msg.ok){
				   window.location="${basePath}login/main.do";
			   }else{
				   $("#erromsg").text("用户名或密码不正确，请重试!");
				   $(".alert-error").attr("class","alert alert-error"); 
			   }
		   }
	});
}

function huiche(){
	 var e = window.event || arguments.callee.caller.arguments[0];
     if (e && e.keyCode == 13 ) {
         login();
     }
}
</script>
</html>