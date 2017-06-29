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
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/search.css">
	
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
			<!-- Top Navigation -->
			<div class="codrops-top">
				<a href="admin/index/create.jsp"><span>Create Index</span></a>
				<a href="admin/index/retrieve.jsp"><span>Retrieve Index</span></a>
				<a href="admin/index/edit.jsp"><span>Edit Index</span></a>	
				
				<span class="right"><a href="admin/user/create.jsp"><span>Create User</span></a></span>
				<span class="right"><a href="admin/user/retrieve.jsp"><span>Retrieve User</span></a></span>
				<span class="right"><a href="admin/user/list.jsp"><span>List User</span></a></span>
				<span class="right"><a href="admin/user/edit.jsp"><span>Edit User</span></a></span>
			</div>
	 	</s:if>
	 	<s:else></s:else>		
			
  	<br>
  	<br>
  	<center>
  		<img src="images/logo.PNG" width=200 height=200 usemap="#mp" id=lg>
  	</center>	
  		<br>
  		<br>
  		<br>
  		<br>
  		
  	<div class='search--container'>
  		<s:form action="SearchFile" theme="simple">
  			<div class='search--search-container'>
	  			<s:textfield name="srch.contIncl" id="txtfld_in"></s:textfield>
	  			<button type="submit" name="btn_search" value="Search" onclick="check()">Search</button>
<!--	  			<input type="button" name="btn_search" value="Search" onclick="check()"/>-->
	  			<s:a href="opr/advanced.jsp">Advanced</s:a>
  			</div>
  			<br>
  			<s:hidden name="srch.contExcl" cssClass="search--advanced-link" id="txtfld_ex"></s:hidden>
  		</s:form>
  	</div>
  		<br>

  		
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		  		  		  		
		<footer>Copyright &copy; 2016 - 2066 Efilebee. &nbsp; All Rights Reserved.</footer>  	
  	
  </body>
</html>
