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
    
    <title>Enterprise Document Advanced Search System</title>
    
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
			var js_ex = document.getElementById("txtfld_ex");
			
			
			if(js_in.value == "" && js_ex.value == "") {
				alert("Invalid!");
				return false;
			} else {
				document.forms[0].submit();
			}			
		}
		
		function change(s) {
			
			var js_lb_in = document.getElementById("lb_in");
			var js_lb_ex = document.getElementById("lb_ex");
			var js_txtfld_ex = document.getElementById("txtfld_ex");
			
			
			if(s == "free") {
				js_lb_in.textContent = "Content:";
				js_lb_ex.style.visibility = "hidden";
				js_txtfld_ex.style.visibility = "hidden";			
			} else {
				js_lb_in.textContent = "Content Include:";
				js_lb_ex.style.visibility = "visible";
				js_txtfld_ex.style.visibility = "visible";				
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

	  		<table>

				<tr>
				<td><b><label id="lb_in">Content Include &nbsp;&nbsp;</label></b></td>
				<td>
					<s:textfield name="srch.contIncl" id="txtfld_in" size="40" maxlength="50" required="true"></s:textfield>			
				</td>
				<td>
		            <button type="submit" name="btn_search" value="Search" onclick="check()">Search</button>				
<!--		            <input type="button" name="btn_search" value="Search" onclick="check()"/>	-->
				</td>				
				</tr>

				<tr>
				<td><b><label id="lb_ex">Content Exclude &nbsp;&nbsp;</label></b></td>
				<td>
					<s:textfield name="srch.contExcl" id="txtfld_ex" size="40" maxlength="50" required="true"></s:textfield>			
				</td>
				<td></td>				
				</tr>									
					  		
				<tr>
				<td><label><b>Search Type &nbsp;</b></label></td>
				<td>
					<select name="srch.srchTp" onclick="change(this.options[this.options.selectedIndex].value)">
	                    <option value="term" selected="selected">Term
	                	<option value="prefix">Prefix
	                	<option value="wildcard">Wildcard
	                	<option value="fuzzy">Fuzzy
	                	<option value="free">Free
	                </select>
				</td>
				</tr>
				
				
				<!--	

				<tr>
				<td><label><b>Date Range &nbsp;</b></label></td>
				<td>
					<select name="srch.dtRng">
	                    <option value="0" selected="selected">All days
	                	<option value="15">Last 15 days
	                	<option value="30">Last 30 days
	                </select>
				</td>
				</tr>
				
	  	
				-->
				
				<tr>
				</tr>
				
				<tr>
				<td><label><b>Number Per Page &nbsp;</b></label></td>
				<td>
					<select name="srch.pgNum">
	                    <option value="10" selected="selected">10 per page
	                	<option value="15">15 per page
	                	<option value="20">20 per page
	                </select>
				</td>
				</tr>
				
				<tr>
				</tr>
				
				<tr>
                <td><label><b>Top Number &nbsp;</b></label></td>
				<td>
					<select name="srch.tpNum">
	                    <option value="100" selected="selected">Only top 100
	                	<option value="200">Only top 200
	                	<option value="500">Only top 500
	                </select>
				</td>
				</tr>
				
				<tr>
				</tr>				
				
				<tr>
				<td><label><b>Document Type &nbsp;</b></label></td>
				<td>
				<select name="srch.docTp">
                	<option value="pdf">PDF Document
                	<option value="word">Word Document
                	<option value="text">TXT Document
                	<option value="all" selected="selected">All Document
                </select>
				</td>
				</tr>	  	
	  	
	  			
	  		</table>

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
  		  		  		  		
		<footer>Copyright &copy; 2016 - 2066 Efilebee. &nbsp; All Rights Reserved.</footer>  	
  	
  	
  </body>
</html>
