<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="../public/publictaglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>列表</title>
<%@include file="../public/publicbootstrap.jsp"%>
<script type='text/javascript' src='${r"${basePath}"}${modPath}/${className?lower_case}.js'></script>
<style type="text/css">
</style>
</head>
<body>
	<form name="searchForm" id="searchForm" method="post" >
		<table class="border" >
				<tr class="Navigation">
					<td><b>列表</b></td>
				</tr>
		</table>
		<table class="border "  align="center" >
			<tbody>
				<#list list as item>
				
				  <#if  (item_index>0 &&  item_index%2 ==0) ||  !item_has_next >
				   </tr> 
                  </#if>
				
				  <#if item_index%2 ==0 >
				    <tr class="Navigationtdbg">
				  </#if>
					  <td align="right">
					     <#if item.comments?length  lte 10>   
						    ${item.comments}:&nbsp;
						 <#else> 
						    ${item.comments[0..10]}:&nbsp; 
						 </#if>
					  </td>
					  <td> 
					      <input name="${item.beanLable}"  id="${item.beanLable}" type="text" />
					  </td>
					  
				<#if  !item_has_next >
				      <#if  item_index%2 ==0 >
				       <td align="right">
				       </td>
					   <td>
					   </td>
				      </#if>
				   </tr> 
                </#if>	  
					  
				  
                </#list>
				<tr class="Navigationtdbg">
					<td colspan="8" align="right">
					  <INPUT class=button type="button" value=" 查 询 "  onclick="pageCallback();" name="btQuery"> 
					  <INPUT class=button type="reset"  value=" 重置 "   name="btReset">
					</td>
				</tr>
			</tbody>
		</table>
</form>
     <aa:zone name="listZone">
		<table class="border"  align="center" >
			<tbody>
				<tr class="title">
			        <th style="width:30px;text-align: center"><input type="checkbox" value="all"  id="check_all" onclick="check(this)" /></th> 
				    <th style="width:50px;text-align: center">行号</th>
				    <#list list as item>
                         <th>
                            <#if item.comments?length lte 10>   
							     ${item.comments}
							<#else> 
							     ${item.comments[0..10]} 
							</#if>
                         </th>
                    </#list>
                    <th>操作</th>
				</tr>
				<c:forEach items="${r"${page.list}"}" var="obj" varStatus="status">
					   <tr class="titletdbg" >
					    <td style="width:50px;text-align: center"> <input  id="check${r"${obj.id}"}" type="checkbox" value="${r"${obj.id}"}" name="ck_id"  /><%-- <input  id="check${r"${obj.id}"}" type="checkbox" value="${r"${obj.id}"}" name="ck_id"   onclick="check(this)"/> --%></td>
					    <td style="width:30px;text-align: center">${r"${(page.currentPage-1)*page.pageSize+ status.index+1 }"}  </td>
						<#list list as item>
                         <td style="text-align: center"> ${r"${obj."}${item.beanLable}${r"}"}</td>
                        </#list> 
					    <td style="text-align: center">
					      <a href="javascript:void(0)" style='text-decoration : underline ' onClick='goUpdate("${r"${obj.id}"}");'><span  style="color: blue">修改</span></a>
					      <a href="javascript:void(0)" style='text-decoration : underline ' onClick='view("${r"${obj.id}"}");'><span  style="color: blue">查看</span></a>
					      <a href="javascript:void(0)" style='text-decoration : underline ' onClick='deleteByIds("${r"${obj.id}"}");'><span  style="color: blue">删除</span></a>
					    </td>
					</tr>
				</c:forEach>
				<tr class="titletdbg">
			<td colspan="16" align="right">
                <app:Page id="pageCallback" count="${r"${page.count}"}" currentPage="${r"${page.currentPage}"}" pageCount="${r"${page.pageCount}"}" pageSize="${r"${page.pageSize}"}" useCallback="true" pageCallback="pageCallback" />
            </td>
			</tr>
				<tr class="titletdbg">
					<td colspan="16" align="center">
					<input name='submit1' type="button" class=button value='增加'      onClick='goSave();' />
					<input name='submit3' type='button' class=button value='批量删除'   onClick='deleteByIds();' />
					</td>
				</tr>
			</tbody>
		</table>
	</aa:zone>
</body>
</html>
