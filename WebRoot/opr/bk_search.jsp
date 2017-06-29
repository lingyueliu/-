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
    
    <title>Enterprise Document Search System</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function check() {
			
			var js_in = document.getElementById("txtfld_in");
			
			if(js_in.value == "") {
				alert("Invalid!");
				return false;
			} else {
				document.forms[0].submit();
			}			
		}
	</script>
  </head>
  
  <body>
 	<s:if test="#session.current_user_token.type==0">
 		<jsp:include page="../admin/index/main.jsp"></jsp:include>
 		<br>
 		<jsp:include page="../admin/user/main.jsp"></jsp:include>
 	</s:if>
 	<s:else></s:else>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<center>
  		<img src="images/logo.PNG" width=200 height=200 usemap="#mp" id=lg>
  		<br>
  		<br>
  		<br>
  		<br>
  		
  		
  		<s:form action="SearchFile" theme="simple">
  			<s:textfield name="srch.contIncl" id="txtfld_in" size="45" maxlength="100"></s:textfield>
  			<input type="button" name="btn_search" value="Search" onclick="check()"/>
  			<s:a href="opr/advanced.jsp">Advanced</s:a>
  			<br>
  			<s:hidden name="srch.contExcl" id="txtfld_ex"></s:hidden>
  		</s:form>
  		
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		  		  		  		
		<p>
			<span>Copyright &copy; 2016 - 2066 Efilebee. &nbsp; All Rights Reserved.</span>
		</p>  	
  	
  	</center>
  </body>
</html>
