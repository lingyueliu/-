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
    
    <title>List User</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<jsp:include page="user_link.jsp"></jsp:include>
	<table width="400" height="6">
	
		<tr></tr>
		
		<tr height="10">
	   		<td>CHECK</td>
	   		<td>ID</td>
	   		<td>NAME</td>
	   		<td>PASSWORD</td>
	   		<td>TYPE</td>
	   		<td>ROLE</td>
	   	</tr>
	   	<tr></tr>
	   	
	   	<s:iterator value="#session.users_retrieved_token" id="user">
	   		<tr height="6">
	   			<td>&nbsp;<s:a href="CheckUser.action?user_id_checked_token=%{#user.id}">Check</s:a></td>
	   			<td>&nbsp;<s:property value="#user.id" /></td>
	   			<td>&nbsp;<s:property value="#user.name" /></td>
	   			<td>&nbsp;<s:property value="#user.password" /></td>
	   			<td>&nbsp;<s:property value="#user.type" /></td>
	   			<td>&nbsp;<s:property value="#user.role" /></td>	   			
	   		</tr>
	   	</s:iterator>
	</table>
  </body>
</html>
