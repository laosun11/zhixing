<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../public/publictaglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>代码生成</title>
<%@include file="../public/publicbootstrap.jsp" %>
</head>
<body class="page-header-fixed">
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<h3 class="page-title">
				   系统配置
				</h3>
				<div class="row-fluid">
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="javascript:void(0)">系统配置</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li>
								<a href="#">代码生成</a>
							</li>
						</ul>

						<!-- END PAGE TITLE & BREADCRUMB-->

					</div>
				<div class="row-fluid">

					<div class="span6" style="width: 100%">
						<div class="portlet">
							<div class="portlet-body">
								<form action="" class="form-horizontal" name="saveform" id="saveform" method="post">
								<table class="table table-striped table-bordered table-advance table-hover">
									<tbody>
										<tr>
											<td style="text-align: right; padding-top: 15px"><label class="control-label">表名<span class="required">*</span></label></td>
											<td style="text-align: left;">
												<input name="tableName" id="tableName" type="text" />
											</td>
											<td style="text-align: right; padding-top: 15px"><label class="control-label">所属模块<span class="required">*</span></label></td>
											<td style="text-align: left;">
												<input name="mod" id="mod" type="text" />
											</td>
											<td style="text-align: right; padding-top: 15px"><label class="control-label">增加文件<span class="required">*</span></label></td>
											<td style="text-align: left;">
												<input name="mapper" id="mapper" type="checkbox"  value="true" checked="checked"/>mapper&nbsp;
												<input name="pojo" id="pojo" type="checkbox" value="true" checked="checked"/>pojo&nbsp;
												<input name="dao" id="dao" type="checkbox" value="true" checked="checked"/>dao&nbsp;
												<input name="service" id="service" type="checkbox" value="true" checked="checked"/>service&nbsp;
												<input name="controller" id="controller" type="checkbox" value="true" checked="checked"/>controller&nbsp;
												<input name="jsp" id="jsp" type="checkbox" value="true" checked="checked"/>jsp&nbsp;
											</td>
										</tr>
										<tr>
											<td style="text-align: right;" colspan="4">
												<button class="btn blue" type="button" onclick="save();">保存</button>
												<button class="btn blue" type="button" onclick="javascript:window.close();">返回</button>
											</td>
										</tr>
									</tbody>
								</table>
								</form>	
							</div>
						</div>
						<!-- END SAMPLE TABLE PORTLET-->
					</div>
</body>
<script type="text/javascript">
 function save(){
	 var data="tableName="+$("#tableName").val()+"&mod="+$("#mod").val()+"&mapper="+$("input[name='mapper']:checked").val()
	 +"&pojo="+$("input[name='pojo']:checked").val() +"&dao="+$("input[name='dao']:checked").val()
	 +"&service="+$("input[name='service']:checked").val()+"&controller="+$("input[name='controller']:checked").val()
	 +"&jsp="+$("input[name='jsp']:checked").val();
	 $.ajax({
		   type: "POST",
		   url: "${basePath}demo/code.do",
		   data: data,
		   dataType:"json",
		   async:false,
		   success: function(obj){
			   alert(obj.msg);
			   if(obj.ok){
				   getOpener().pageCallback();
				   window.close();
			   }
		   }
		});
	 
 }
</script>
</html>