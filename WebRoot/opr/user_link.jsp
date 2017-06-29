<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
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
	  <a href="opr/search.jsp">Search</a>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <a href="opr/advanced.jsp">Advanced</a>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	  
	  <a href="UserLogout.action">Logout</a>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <s:property value="#session.current_user_token.name"/>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	  <a href="javascript:history.go(-1)">Back</a>
  </body>
</html>
