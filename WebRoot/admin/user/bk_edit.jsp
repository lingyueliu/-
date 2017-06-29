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
	<jsp:include page="user_link.jsp"></jsp:include>
  		<s:form action="UpdateUser" theme="simple">
	  		<table>

				<tr>
				<td><font><b>ID:</b></font></td>
				<td>
					<s:textfield name="userPrm.id" id="txtfld_id" value="%{#session.user_checked_token.id}" readonly="true" size="15" maxlength="50" required="true"></s:textfield>
				</td>
				<td>
		            <input type="button" name="btn_update" value="Update" onclick="check()"/>	
		            <input type="button" name="btn_delete" value="Delete" onclick="location.href='DeleteUser.action'"/>				
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

  </body>
</html>
