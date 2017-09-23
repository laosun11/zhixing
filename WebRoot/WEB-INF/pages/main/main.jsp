<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../public/publictaglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>奖学金评定系统主页面</title>
<%@include file="../public/publicbootstrap.jsp" %>
<style>
.navbar .nav>li>a{
padding:16px 15px 12px;
color:#fff;
}
.navbar .nav>li>a.usertext{
cursor:text;
}
</style>
<script>
$(function(){
	$("#main").css("overflow-y","auto")
	var hh=$(window).height()-$("#nav").outerHeight(true)-$("#footer").outerHeight(true);
    if($("#navLeft").outerHeight(true)<hh){
 	   $("#content").height(hh);
	   		$("#main").height(hh);
    }
})
</script>
</head>
<body class="page-header-fixed">
	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse navbar-fixed-top" id="nav">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="navbar-inner">
			<div class="container-fluid">
				<!-- BEGIN LOGO -->
				<a class="brand" href="javascript:void(0)">
				<img src="${basePath }bootstrap/image/logo.png" alt="logo"/>
				</a>
				<!-- END LOGO -->
				<!-- BEGIN TOP NAVIGATION MENU -->

				<ul class="nav pull-right">

					<!-- BEGIN USER LOGIN DROPDOWN -->

					<li class=" user">

						<a href="#" class="usertext">
						<i class="icon-user"></i>

						<span class="username ">${user.name }</span>

			

						</a>
					</li>
					<li class=" user">
						<a href="logout.do" class="userpointer" >
							<i class="icon-off "></i>
							<span class="username ">注销</span>
						</a>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
				<!-- END TOP NAVIGATION MENU -->

			</div>

		</div>

		<!-- END TOP NAVIGATION BAR -->
	</div>

	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->

	<div class="page-container" id="content">

		<!-- BEGIN SIDEBAR -->

		<div class="page-sidebar nav-collapse collapse" id="navLeft">

			<!-- BEGIN SIDEBAR MENU -->

<!-- 			<ul class="page-sidebar-menu"> -->
<!-- 				<li class=""> -->
<!-- 					<a href="javascript:;"> -->
<!-- 					<i class="icon-user"></i> -->
<!-- 					<span class="title">学生模块管理</span> -->
<!-- 					<span class="arrow "></span> -->
<!-- 					</a> -->
<!-- 					<ul class="sub-menu"> -->
<!-- 						<li id="xylr"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}wyfxs/xylist.do','xylr');"> --%>
<!-- 							学员录入 -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li id="cjlr"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}wyfxscj/list.do','cjlr');"> --%>
<!-- 						         成绩录入 -->
<!-- 						    </a> -->
<!-- 						</li> -->
<!-- 						<li id="grcjlist"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}wyfxscj/grcjlist.do','grcjlist');"> --%>
<!-- 						         个人成绩查看 -->
<!-- 						    </a> -->
<!-- 						</li> -->
<!-- 						<li id="zhgl"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}tssysuserinf/xylist.do','zhgl');"> --%>
<!-- 							账号管理 -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li id="xyxxcx"> -->
<%-- 							<a  href="javascript:void(0);" onclick="goload('${basePath}wyfxs/xyzhlist.do','xyxxcx');"> --%>
<!-- 							学生信息查询 -->
<!-- 							</a> -->
<!-- 						</li><li id="xxk"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}wyfxsxxkc/list.do','xxk');"> --%>
<!-- 							选修课 -->
<!-- 							</a> -->
<!-- 						</li> -->
						
<!-- 					</ul> -->
<!-- 				</li> -->
<!-- 				<li class="" > -->
<!-- 					<a href="javascript:;"> -->
<!-- 					<i class="icon-bar-chart"></i> -->
<!-- 					<span class="title">奖学金模块管理</span> -->
<!-- 					<span class="arrow "></span> -->
<!-- 					</a> -->
<!-- 					<ul class="sub-menu"> -->
<!-- 						<li id="jxjsq"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}wyfjxjsq/list.do','jxjsq');"> --%>
<!-- 							奖学金申请 -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li id="jxjsx"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}wyfjxjsq/shlist.do','jxjsx');"> --%>
<!-- 						         信息&nbsp;&nbsp;审核 -->
<!-- 						    </a> -->
<!-- 						</li> -->
<!-- 						<li id="jxjpd"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}wyfjxjsq/pflist.do','jxjpd');"> --%>
<!-- 							奖学金评分 -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li id="jxjzs"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}wyfjxjsq/jxjzslist.do','jxjzs');"> --%>
<!-- 							奖学金终审 -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li id="jxjpz"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}wyfjxj/list.do','jxjpz');"> --%>
<!-- 							奖学金配置 -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li id="zhcxjxj"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}wyfjxjsq/zhcxlist.do','zhcxjxj');"> --%>
<!-- 							奖学金综合查询 -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</li> -->
<!-- 				<li class=""> -->
<!-- 					<a href="javascript:;"> -->
<!-- 					<i class="icon-th"></i> -->
<!-- 					<span class="title">教务模块管理</span> -->
<!-- 					<span class="arrow "></span> -->
<!-- 					</a> -->
<!-- 					<ul class="sub-menu"> -->
<!-- 						<li id="nzqgl"> -->
<%-- 							<a href="javascript:void(0)" onclick="goload('${basePath}wyfnzqgl/list.do','nzqgl')"> --%>
<!-- 							年周期管理 -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li id="zygl"> -->
<%-- 							<a href="javascript:void(0)" onclick="goload('${basePath}wyfzy/list.do','zygl')"> --%>
<!-- 						         专业管理 -->
<!-- 						    </a> -->
<!-- 						</li> -->
<!-- 						<li id="kcgl"> -->
<%-- 							<a href="javascript:void(0)" onclick="goload('${basePath}wyfkc/list.do','kcgl')"> --%>
<!-- 						         课程管理 -->
<!-- 						    </a> -->
<!-- 						</li> -->
<!-- 						<li id="bjgl"> -->
<%-- 							<a href="javascript:void(0)" onclick="goload('${basePath}wyfbj/list.do','bjgl')"> --%>
<!-- 							班级管理 -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li id="zqzykcgl"> -->
<%-- 							<a href="javascript:void(0)" onclick="goload('${basePath}wyfzqzy/list.do','zqzykcgl')"> --%>
<!-- 							周期专业课程管理 -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</li> -->
<!-- 				<li class=""> -->
<!-- 					<a href="javascript:;"> -->
<!-- 					<i class="icon-th"></i> -->
<!-- 					<span class="title">人员模块管理</span> -->
<!-- 					<span class="arrow "></span> -->
<!-- 					</a> -->
<!-- 					<ul class="sub-menu"> -->
<!-- 						<li id="rygl"> -->
<%-- 							<a href="javascript:void(0)" onclick="goload('${basePath}wyfry/list.do','rygl')"> --%>
<!-- 							人员管理 -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</li> -->
<!-- 				<li class=""> -->
<!-- 					<a href="javascript:;"> -->
<!-- 					<i class="icon-cogs"></i> -->
<!-- 					<span class="title">系统模块管理</span> -->
<!-- 					<span class="arrow "></span> -->
<!-- 					</a> -->
<!-- 					<ul class="sub-menu"> -->
<!-- 						<li id="cdmk"> -->
<%-- 							<a href="javascript:void(0)" onclick="goload('${basePath}tssysmenu/list.do','cdmk')"> --%>
<!-- 							菜单模块</a> -->
<!-- 						</li> -->
<!-- 						<li id="yhmk"> -->
<%-- 							<a href="javascript:void(0)" onclick="goload('${basePath}tssysuserinf/list.do','yhmk')"> --%>
<!-- 						         用户模块</a> -->
<!-- 						</li> -->
<!-- 						<li id="jsmk"> -->
<%-- 							<a href="javascript:void(0)" onclick="goload('${basePath}tssysrole/list.do','jsmk')"> --%>
<!-- 							角色模块</a> -->
<!-- 						</li> -->
<!-- 						<li id="xgmm"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}tssysuserinf/goUpdatePwd.do','xgmm')"> --%>
<!-- 							修改密码</a> -->
<!-- 						</li> -->
<!-- 						<li id="dmsc"> -->
<%-- 							<a href="javascript:void(0);" onclick="goload('${basePath}demo/list.do','dmsc')"> --%>
<!-- 							代码生成</a> -->
<!-- 						</li> -->
<!-- 						<li > -->
<!-- 							<a href="layout_horizontal_sidebar_menu.html">公告 -->
<!-- 							</a> -->
							
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</li> -->
<!-- 			</ul> -->
			<!-- END SIDEBAR MENU -->
				<ul class="page-sidebar-menu">
					<c:forEach items="${menulist}" var="menu" >
						<c:if test="${'a7309f77e38b11e69b5e1c3947eb3247' eq menu.parentid}">
							<li class="">
							<a href="javascript:;">
							<i class=""></i>
							<span class="title">${menu.menuname }</span>
							<span class="arrow "></span>
							</a>
							<ul class="sub-menu">
								<c:forEach items="${menulist}" var="menusub">
									<c:if test="${menu.id eq menusub.parentid }">
										<li id="${menusub.id }">
											<a href="javascript:void(0)" onclick="goload('${basePath}${menusub.link }','${menusub.id }')">
											${menusub.menuname }</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
							</li>
						</c:if>
					</c:forEach>
				</ul>
		</div>

		<!-- END SIDEBAR -->

		<!-- BEGIN PAGE -->

		<div class="page-content" id="main">
		<div class="container-fluid">
			<h3 class="page-title">欢迎进入奖学金评审系统</h3>
			</div>
			</div>

		<!-- END PAGE -->
	</div>

	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->

	<div class="footer" id="footer">

		<div class="footer-inner">

			2017 &copy; JXJPSXT by Wang Yufeng.

		</div>

		

	</div>
</body>
<script type="text/javascript">

		jQuery(document).ready(function() {
		   App.init(); // initlayout and core plugins
		   Index.init();
		   Index.initJQVMAP(); // init index page's custom scripts
		   Index.initCalendar(); // init index page's custom scripts
		   Index.initCharts(); // init index page's custom scripts
		   Index.initChat();
		   Index.initMiniCharts();
		   Index.initDashboardDaterange();
		   Index.initIntro();	   
		});
		
		function goload(url,id){
			$("#main").load(url);
			$("li").removeClass("active");
			$("#"+id).addClass("active");
			$(".navbar .nav>li>a").css({
				"padding":"16px 15px 12px",
				"color":"#fff"
			});
			$(".navbar .nav>li>a.usertext").css("cursor","text");
		}
	</script>
	
	
</html>