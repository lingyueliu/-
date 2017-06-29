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
    <base href="<%=request.getRequestURL()%>">
    
    <title>Search Result</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="../css/normalize.css">
	<link rel="stylesheet" type="text/css" href="../css/font.css">	
	<link rel="stylesheet" type="text/css" href="../css/result.css">

  </head>
  
  <body>
	<div class="codrops-top">
		<a href="../opr/search.jsp"><span>Search</span></a>
		<a href="../opr/advanced.jsp"><span>Advanced</span></a>
		
		<span class="right"><a href="UserLogout.action"><span>Logout</span></a></span>
		<span class="right"><a href="javascript:history.go(-1)"><span>Back</span></a></span>
	</div>	
	
	<br>
      <ul class="paginate pag">
        <li class="single current">
			There are <s:property value="#session.file_page_entity_token.recordSum"/> records and <s:property value="#session.file_page_entity_token.pageSum"/> pages. 
			This is Page <s:property value="#session.file_page_entity_token.currentPage"/>.<br/>        
        </li>
			<s:if test="%{#session.file_page_entity_token.currentPage <= 1}">
				<li><a>First</a></li>
				<li><a>Previous</a></li>
			</s:if>
			<s:else>
				<li><s:a href="SearchFile.action?file_page_token=1">First</s:a></li>
				<li><s:a href="SearchFile.action?file_page_token=%{#session.file_page_entity_token.currentPage - 1}">Previous</s:a></li>
			</s:else> 
			
			<s:if test="%{#session.file_page_entity_token.currentPage >= #session.file_page_entity_token.pageSum}">
				<li><a>Next</a></li>
				<li><a>Last</a></li>				
			</s:if>
			<s:else>
				<li><s:a href="SearchFile.action?file_page_token=%{#session.file_page_entity_token.currentPage + 1}">Next</s:a></li>
				<li><s:a href="SearchFile.action?file_page_token=%{#session.file_page_entity_token.pageSum}">Last</s:a></li> 
			</s:else>         
      </ul>
	<br>    

	<c:forEach items="${file_page_entity_token.resultList}" var="eachfile">
	<div class="item_content">
		<h4><A href="${eachfile.path}" target=_blank> ${eachfile.name} </A></h4>
		<p>${eachfile.content}</p>
	</div>
	</c:forEach>

  		<br>
  		  		  		  		
	<footer>Copyright &copy; 2016 - 2066 Efilebee. &nbsp; All Rights Reserved.</footer>  
  </body>
</html>
