<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/pages/public/tag.jsp"%>
<html>
<head>
<title>查看</title>
<%@include file="/pages/public/head.jsp"%>
<%@include file="/pages/public/dialog.jsp"%>
<script type='text/javascript' src='${r"${pg}"}${modPath}${className?lower_case}/${className?lower_case}.js'></script>
</head>
<body>

	<table class="border">
		<tr class="Navigation">
			<td><b>查看</b></td>
		</tr>
	</table>
			<table class="border"  align="center" >
				<tbody>
				<#list list as item>
					 <#if  (item_index>0 &&  item_index%2 ==0) ||  !item_has_next >
				   </tr> 
                  </#if>
				  <#if item_index%2 ==0 >
				    <tr class="Navigationtdbg">
				  </#if>
					  <td align="right">
					     <#if item.comments?length lte 10>   
						    ${item.comments}:&nbsp;
						 <#else> 
						    ${item.comments[0..10]}:&nbsp; 
						 </#if>
					  </td>
					  <td> 
					      ${r"${vo."}${item.beanLable}${r"}"}
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
				</tbody>
			</table>
			
			<table class="border"  align="center" >
				<tbody>
					<tr class="titletdbg">
						<td  align="right">
							<input name='submit2' type='button' class='button' value='关闭' onClick='window.close();' />
						</td>
					</tr>
				</tbody>
			</table>
</body>
</html>
