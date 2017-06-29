<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<!--    <base href="<%=basePath%>">-->
    
    <title>Search Result</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="../css/result.css">
	
	<script>
	</script>	

  </head>
  
  <body>
	<jsp:include page="user_link.jsp"></jsp:include>  
	<br>
	<br>

	<c:forEach items="${file_page_entity_token.resultList}" var="eachfile">
		<TABLE>
			<TBODY>
				<TR>
					<TD class="rs">
						<A href="${eachfile.path}" target=_blank> ${eachfile.name} </A>
						<BR>
						${eachfile.content}
						<BR>
	
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</c:forEach>
		
	<br>
	<br>
	<table class="pg" border=0 cellSpacing=0 cellPadding=0 width="100%" align=center>	
	<tr>
		<td>
			There are <s:property value="#session.file_page_entity_token.recordSum"/> records and <s:property value="#session.file_page_entity_token.pageSum"/> pages. 
			This is Page <s:property value="#session.file_page_entity_token.currentPage"/>.<br/>
		</td>
	</tr>
	
	<tr>
		<td>
			<s:if test="%{#session.file_page_entity_token.currentPage == 1}">
				First Previous
			</s:if>
			<s:else>
				<s:a href="SearchFile.action?file_page_token=1">First</s:a>
				<s:a href="SearchFile.action?file_page_token=%{#session.file_page_entity_token.currentPage - 1}">Previous</s:a>
			</s:else> 
			
			<s:if test="%{#session.file_page_entity_token.currentPage == #session.file_page_entity_token.pageSum}">
				Next Last
			</s:if>
			<s:else>
				<s:a href="SearchFile.action?file_page_token=%{#session.file_page_entity_token.currentPage + 1}">Next</s:a>
				<s:a href="SearchFile.action?file_page_token=%{#session.file_page_entity_token.pageSum}">Last</s:a> 
			</s:else> 	
		</td>
	</tr>
	
	</table>

  </body>
</html>
