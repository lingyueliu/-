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
    
    <title>Retrieve User</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


	<style>
		html, body {
		  height: 100%;
		  font-family: "Roboto Slab", serif;
		  *font-family: GillSans, Calibri, Trebuchet, sans-serif;
		}		

		select {
		    border: solid 1px #000;
		    
		    appearance:none;
		    -moz-appearance:none;
		    -webkit-appearance:none;	
		    		    		
		    background: url("../../images/arrow.png") no-repeat scroll right center transparent;
		    padding-right: 14px;
		    color: #000000;

		    background-color: #000000;	    	    	
		}	
				
		option {
		    color: #000;		
		}
					
	</style>
  <!--Import materialize.css-->
	<link rel="stylesheet" type="text/css" href="../../css/normalize.css">
	<link rel="stylesheet" type="text/css" href="../../css/font.css">  
  <link type="text/css" rel="stylesheet" href="../../css/materialize.min.css"  media="screen,projection"/>

  <!--Let browser know website is optimized for mobile-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  
  <!--Import jQuery before materialize.js-->
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="../../js/materialize.min.js"></script>  


	

	<script type="text/javascript">
		function check() {		
			document.forms[0].submit();
		}
	</script>
	

  </head>
  
  <body>

  <!-- Dropdown Structure -->
  <ul id="dropdown1" class="dropdown-content">
	<li><a href="create.jsp">Create User</a></li>
	<li><a href="retrieve.jsp">Retrieve User</a></li>
	<li><a href="list.jsp">List User</a></li>
	<li><a href="edit.jsp">Edit User</a></li>	

    <li class="divider"></li>
 
    <li><a href="../index/create.jsp">Create Index</a></li>
    <li><a href="../index/retrieve.jsp">Retrieve Index</a></li>
    <li><a href="../index/edit.jsp">Edit Index</a></li>    
  </ul>
  <nav>
    <div class="nav-wrapper">
      <a>Welcome To Efilebee, <s:property value="#session.current_user_token.name"/>!</a>

      <ul class="right hide-on-med-and-down">
        <li><a href="javascript:history.go(-1)">Back</a></li>
        <li><a href="UserLogout.action">Logout</a></li>
        <li><a href="../../opr/search.jsp">Search</a></li>
        <!-- Dropdown Trigger -->
        <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Manage Index / Manage User<i class="mdi-navigation-arrow-drop-down right"></i></a></li>
      </ul>
    </div>
  </nav>     
  
  
<div class="container">  
  		<s:form action="RetrieveUser" theme="simple">
	  		<table class="hoverable">

				<tr>
				<td><font><b>Name:</b></font></td>
				<td>
					<s:textfield name="userPrm.name" size="15" maxlength="50" required="true"></s:textfield>			
				</td>
				<td>		            
				  <button class="btn waves-effect waves-light" type="submit" name="btn_retrieve" onclick="check()">Retrieve
				    <i class="mdi-content-send right"></i>
				  </button> 
				  		            			
				</td>				
				</tr>
								


				<tr>
				<td><font><b>Role:</b></font></td>
				<td>
					<s:textfield name="userPrm.role" size="15" maxlength="50" required="true"></s:textfield>			
				</td>
				<td></td>				
				</tr>	

	  	
	  			
	  		</table>


  		</s:form>
</div>  		

  </body>
</html>
