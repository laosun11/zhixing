<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/public/publictaglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>404</title>
<%@include file="/WEB-INF/pages/public/publicbootstrap.jsp" %>

<body class="page-404-3">

	<%-- <div class="page-inner">

		<img src="${basePath}bootstrap/image/earth.jpg" alt="">

	</div> --%>

	<div class="container error-404">

		<h1>404</h1>

		<h2>没有找到该页面，请刷新后重试！</h2>
<!-- 		<p> -->
<!-- 		<a href="index.html">Return home</a> -->
<!-- 		<br> -->
<!-- 		</p> -->

	</div>

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="media/js/jquery-1.8.3.min.js" type="text/javascript"></script>   

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->  

	<script src="media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="media/js/bootstrap.min.js" type="text/javascript"></script>

	<!--[if lt IE 9]>

	<script src="media/js/excanvas.js"></script>

	<script src="media/js/respond.js"></script>  

	<![endif]-->   

	<script src="${basePath}bootstrap/js/breakpoints.js" type="text/javascript"></script>  

	<!-- IMPORTANT! jquery.slimscroll.min.js depends on jquery-ui-1.10.1.custom.min.js --> 

	<script src="${basePath}bootstrap/js/jquery.uniform.min.js" type="text/javascript" ></script> 

	<!-- END CORE PLUGINS -->

	<script src="${basePath}bootstrap/js/app.js"></script>  

	<script>

		jQuery(document).ready(function() {    

		   App.init();

		});

	</script>

	<!-- END JAVASCRIPTS -->

<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>

<!-- END BODY -->
</html>