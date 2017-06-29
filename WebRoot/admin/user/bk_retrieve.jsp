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
	

	<script type="text/javascript">
		function check() {		
			document.forms[0].submit();
		}
	</script>
	

  </head>
  
  <body>
	<jsp:include page="user_link.jsp"></jsp:include>
  		<s:form action="RetrieveUser" theme="simple">
	  		<table>

				<tr>
				<td><font><b>Name:</b></font></td>
				<td>
					<s:textfield name="userPrm.name" size="15" maxlength="50" required="true"></s:textfield>			
				</td>
				<td>
		            <input type="button" name="btn_retrieve" value="Retrieve" onclick="check()"/>				
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

  </body>
</html>
