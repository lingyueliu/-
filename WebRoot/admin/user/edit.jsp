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
    
    <title>Edit User</title>
    
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
		function isnull(exp) {
			if(!exp && typeof(exp) != "undefined" && exp != 0)
				return true;
		}
	
		function check() {			
			
			var js_Name = document.getElementById("txtfld_name");
			var js_Password = document.getElementById("txtfld_password");
			var js_Type = document.getElementById("txtfld_type");
			var js_Role = document.getElementById("txtfld_role");
			
			if(typeof(js_Name) == undefined || typeof(js_Password) == undefined || typeof(js_Type) == undefined || typeof(js_Role) == undefined) {
				alert("Undefined!");
				return false;			
			}
			
			if(isnull(js_Name) || isnull(js_Password) || isnull(js_Type) || isnull(js_Role)) {
			//if(js_Name === null || js_Password === null || js_Type === null || js_Role === null) {
				alert("Null!");
				return false;				
			}
			
			if(js_Name.value == "" || js_Password.value == "" || js_Type.value == "" || js_Role.value == "") {
				alert("Invalid!");
				return false;
			}
			if((js_Name.length > 0) && (js_Name.length > 20)){
				alert("Name Too Long!");
				return false;
			}
			if((js_Password.length > 0) && (js_Password.length > 20)){
				alert("Password Too Long!");
				return false;
			}		
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
  		<s:form action="UpdateUser" theme="simple">
	  		<table class="striped hoverable">

				<tr>
				<td><font><b>ID:</b></font></td>
				<td>
					<s:textfield name="userPrm.id" id="txtfld_id" value="%{#session.user_checked_token.id}" readonly="true" size="15" maxlength="50" required="true"></s:textfield>
				</td>
				<td>
		            	
				  <button class="btn waves-effect waves-light" type="submit" name="btn_update" onclick="check()">Update
				    <i class="mdi-content-send right"></i>
				  </button> 
				  <button class="btn waves-effect waves-light" type="submit" name="btn_delete" onclick="location.href='DeleteUser.action'">Delete
				    <i class="mdi-content-send right"></i>
				  </button> 				  		            
		
				</td>				
				</tr>
				
				<tr>
				<td><font><b>Name:</b></font></td>
				<td>
					<s:textfield name="userPrm.name" id="txtfld_name" value="%{#session.user_checked_token.name}" size="15" maxlength="50" required="true"></s:textfield>			
				</td>
				<td></td>				
				</tr>
				

				<tr>
				<td><font><b>Password:</b></font></td>
				<td>
					<s:textfield name="userPrm.password" id="txtfld_password" value="%{#session.user_checked_token.password}" size="15" maxlength="50" required="true"></s:textfield>			
				</td>
				<td></td>				
				</tr>									
					

				<tr>
				<td><font><b>Type:</b></font></td>
				<td>
					<s:textfield name="userPrm.type" id="txtfld_type" value="%{#session.user_checked_token.type}" size="15" maxlength="50" required="true"></s:textfield>			
				</td>
				<td></td>				
				</tr>	


				<tr>
				<td><font><b>Role:</b></font></td>
				<td>
					<s:textfield name="userPrm.role" id="txtfld_role" value="%{#session.user_checked_token.role}" size="15" maxlength="50" required="true"></s:textfield>			
				</td>
				<td></td>				
				</tr>	

	  	
	  			
	  		</table>


  		</s:form>

</div>

  </body>
</html>
