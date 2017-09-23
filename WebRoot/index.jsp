<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<%@include file="publicbootstrap.jsp" %>
<script>
function go(){
	window.location="login/login.do";
}
</script>
</head>
<body class="login">
	<input type="button" value="跳转" onclick="go();" />
	<div class="logo">

		<img src="media/image/logo-big.png" alt="" />

	</div>

	<!-- END LOGO -->

	<!-- BEGIN LOGIN -->

	<div class="content">

		<!-- BEGIN LOGIN FORM -->

		<form class="form-vertical login-form" action="login/login.do" method="post">
			<h3 class="form-title">请登入您的账号</h3>
			<div class="alert alert-error hide">
				<button class="close" data-dismiss="alert"></button>
				<span>Enter any username and password.</span>
			</div>

			<div class="control-group">

				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->

				<label class="control-label visible-ie8 visible-ie9">用户名:</label>

				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" placeholder="用户名" name="userId" />
					</div>
				</div>

			</div>

			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">密码:</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" placeholder="密码" name="pwd" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button type="submit" class="btn green pull-right">
					Login <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</form>
</body>
</html>