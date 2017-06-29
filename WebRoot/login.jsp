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
    
    <title>Login</title>
    
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
	<link rel="stylesheet" type="text/css" href="css/login.css">
	
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/prefixfree.min.js"></script>
	<script src="js/login.js"></script>
  </head>
  
  <body>

<!--		<img src="images/logo.PNG" width=200 height=200>-->
	
	<div class='preload login--container'>
		<center><img src="images/logo.PNG" width=200 height=200></center>
		<div class='login--form'>
			
		  	<s:form action="UserLogin" theme="simple">
		  		<div class='login--username-container'>
			  		<label>NAME:</label>
			 		<input type="text" name="userPrm.name" autofocus placeholder='NAME' id="UserLogin_userPrm_name"/>

<!--			  		<s:text name="txt_name">NAME:</s:text>-->
<!--			  		<s:textfield name="userPrm.name"></s:textfield>-->
		  		</div> 
		  		<div class='login--password-container'>
			  		<label>PASSWORD:</label>
			  		<input type="password" name="userPrm.password" placeholder='PASSWORD' id="UserLogin_userPrm_password"/>
			  		<button type="submit" class='js-toggle-login login--login-submit'>Login</button>
			  		
<!--			  		<s:text name="txt_password">PASSWORD:</s:text>-->
<!--			  		<s:password name="userPrm.password"></s:password>-->
<!--			  		<s:submit cssClass='js-toggle-login login--login-submit' value="Login" />-->
		  		</div> 
		  	</s:form>
	  	</div> 
		<div class='login--toggle-container'>
			<small>Welcome,</small>
			<div class='js-toggle-login'>Login</div>
			<small>Please</small>
		</div>	  	
	</div>        

  </body>
</html>
