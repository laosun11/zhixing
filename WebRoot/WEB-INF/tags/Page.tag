<%@ tag pageEncoding="UTF-8" 
body-content="scriptless"
description="分页标签"
%>
<%@ taglib    uri="http://java.sun.com/jsp/jstl/core"       prefix="c" %>
<%@ attribute name="id"            required="true"  rtexprvalue="true"  description="ID"%>
<%@ attribute name="count"         required="true"  rtexprvalue="true"  description="总数"%>
<%@ attribute name="pageSize"      required="true"  rtexprvalue="true"  description="每页数量"%>
<%@ attribute name="currentPage"   required="true"  rtexprvalue="true"  description="当前页码"%>
<%@ attribute name="pageCount"     required="true"  rtexprvalue="true"  description="总页数"%>
<%@ attribute name="url"           required="false" rtexprvalue="true"  description="分页请求的url"%>
<%@ attribute name="pageCallback"  required="false" rtexprvalue="true"  description="点击页签的js回调函数"%>
<%@ attribute name="useCallback"   required="false" rtexprvalue="true"  type="java.lang.Boolean" description="是否需要js回调函数"%>
<%
  if(null!=url && !"".equals(url) ){
	  if(url.indexOf("?")<0){
		  url+="?1=1";
	  }
  }
jspContext.setAttribute("url", url);
%>
<ul class="pagination pagination-sm" style="margin:0px; ">
<li ><a href="javascript:void(0);">${currentPage}/${pageCount},共${count}条记录</a></li>
<c:choose>
      <c:when test="${currentPage-1<=0}">
        <li ><a href="javascript:void(0);">&laquo;</a></li>
      </c:when>
      <c:when test="${useCallback}">
        <li ><a href="#" onclick="${pageCallback}({'pageSize':${pageSize},'currentPage':${currentPage-1}});">&laquo;</a></li>
      </c:when>
      <c:otherwise>
        <li ><a href="${url}&pageSize=${pageSize}&currentPage=${currentPage-1}">&laquo;</a></li>
      </c:otherwise>
</c:choose>
<c:forEach begin="${(currentPage-5 >0)? (currentPage-5):1 }"  end="${(currentPage-5 >0 )? ((currentPage+4>=pageCount)? pageCount:currentPage+4):(pageCount>=10?10:pageCount) }" var="p"  varStatus="status">
    <c:choose>
      <c:when test="${useCallback}">
        <li <c:if test="${status.index eq currentPage}">class="active"</c:if> ><a href="#" onclick="${pageCallback}({'pageSize':${pageSize},'currentPage':${status.index}});">${status.index}</a></li>
      </c:when>
      <c:otherwise>
        <li <c:if test="${status.index eq currentPage}">class="active"</c:if> ><a href="${url}&pageSize=${pageSize}&currentPage=${status.index}">${status.index}</a></li>
      </c:otherwise>
    </c:choose>
</c:forEach>
<c:choose>
      <c:when test="${currentPage+1>pageCount}">
        <li ><a href="javascript:void(0);">&raquo;</a></li>
      </c:when>
      <c:when test="${useCallback}">
        <li ><a href="#" onclick="${pageCallback}({'pageSize':${pageSize},'currentPage':${currentPage+1}});">&raquo;</a></li>
      </c:when>
      <c:otherwise>
        <li ><a href="${url}&pageSize=${pageSize}&currentPage=${currentPage+1}">&raquo;</a></li>
      </c:otherwise>
</c:choose>
</ul>

