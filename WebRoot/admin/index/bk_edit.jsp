<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<!--    <base href="<%=basePath%>">-->
    
    <title>Edit Index</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
	function checkAll() {
		var check_list = document.getElementsByName("chkbxs");
		if(document.getElementById("chkAll").checked)
		{
			for(var i=0; i<check_list.length; i++)
			{
				check_list[i].checked = 1;
			}
		} else {
			for(var j=0; j<check_list.length; j++)
			{
				check_list[j].checked = 0;
			}
		}
	}
	</script>	

  </head>
  
  <body>
	<jsp:include page="user_link.jsp"></jsp:include>  
	<br>
	<br>
	<s:form action="" name="main_form" theme="simple">	
	
	<table border="" width="600" height="10">
	<tr>
		<td>Update/Delete: </td>
		<td colspan="2">
			<input type="button" name="btn_update" value="Update" onclick="main_form.action='UpdateIndex.action';main_form.submit();"/>
			<s:textfield name="role" id="txtfld_role" value="" size="15" maxlength="50" required="true"></s:textfield>
		</td>
		<td><input type="button" name="btn_delete" value="Delete" onclick="main_form.action='DeleteIndex.action';main_form.submit();"/></td>	
	</tr>		
	<tr>
		<td>&nbsp;<input onclick="checkAll()" type="checkbox" name="chkAll" id="chkAll"/></td>
		<td>ID</td>
		<td>Name</td>
		<td>Role</td>
	
	</tr>
	<s:iterator value="#session.index_page_entity_token.resultList" id="file">
		<tr>
			<td>&nbsp;<input type="checkbox" name="chkbxs" value="<s:property value="#file.id"/>"></td>
			<td>&nbsp;<s:property value="#file.id"/></td>
			<td>&nbsp;<s:property value="#file.name"/></td>
			<td>&nbsp;<s:property value="#file.role"/></td>
		</tr>
	</s:iterator>
	</table>
	There are <s:property value="#session.index_page_entity_token.recordSum"/> records and <s:property value="#session.index_page_entity_token.pageSum"/> pages. 
	This is Page <s:property value="#session.index_page_entity_token.currentPage"/>.<br/>
	
	<s:if test="%{#session.index_page_entity_token.currentPage == 1}">
		First Previous
	</s:if>
	<s:else>
		<s:a href="SearchIndex.action?index_page_token=1">First</s:a>
		<s:a href="SearchIndex.action?index_page_token=%{#session.index_page_entity_token.currentPage - 1}">Previous</s:a>
	</s:else> 
	
	<s:if test="%{#session.index_page_entity_token.currentPage == #session.index_page_entity_token.pageSum}">
		Next Last
	</s:if>
	<s:else>
		<s:a href="SearchIndex.action?index_page_token=%{#session.index_page_entity_token.currentPage + 1}">Next</s:a>
		<s:a href="SearchIndex.action?index_page_token=%{#session.index_page_entity_token.pageSum}">Last</s:a> 
	</s:else> 	
	
	</s:form>
  </body>
</html>
