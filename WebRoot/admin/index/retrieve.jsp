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
    
    <title>Retrieve Index</title>
    
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
  
  <!--Import jQuery before materialize.js-->
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="../../js/materialize.min.js"></script>
  	
  </head>
  
  <body>

  <!-- Dropdown Structure -->
  <ul id="dropdown1" class="dropdown-content">
    <li><a href="create.jsp">Create Index</a></li>
    <li><a href="retrieve.jsp">Retrieve Index</a></li>
    <li><a href="edit.jsp">Edit Index</a></li>

    <li class="divider"></li>
        
	<li><a href="../user/create.jsp">Create User</a></li>
	<li><a href="../user/retrieve.jsp">Retrieve User</a></li>
	<li><a href="../user/list.jsp">List User</a></li>
	<li><a href="../user/edit.jsp">Edit User</a></li>	    
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
  	
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<center>
  		<img src="../../images/logo.PNG" width=200 height=200 usemap="#mp" id=lg>
  		<br>
  		<br>
  		<br>
  		<br>
  		
    <div class="container">
      <!-- Page Content goes here -->
		
  		<s:form action="SearchIndex" theme="simple">
	  		<table class="striped">

				<tr>
				<td><b><label id="lb_in">Content Include:</label></b></td>
				<td>
					<s:textfield name="srch.contIncl" id="txtfld_in" size="35" maxlength="50" required="true"></s:textfield>			
				</td>
				<td>
				  <button class="btn waves-effect waves-light" type="submit" name="btn_search" onclick="check()">Search
				    <i class="mdi-content-send right"></i>
				  </button>  		            				
				</td>				
				</tr>

				<tr>
				<td><b><label id="lb_ex">Content Exclude:</label></b></td>
				<td>
					<s:textfield name="srch.contExcl" id="txtfld_ex" size="35" maxlength="50" required="true"></s:textfield>			
				</td>
				<td></td>				
				</tr>									
					  		
				<tr>
				<td><label><b>Search Type:</b></label></td>
				<td>

					<select class="browser-default" name="srch.srchTp" onclick="change(this.options[this.options.selectedIndex].value)">
	                    <option value="" disabled selected>Choose your option</option>	
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
				<td><label><b>Date Range:</b></label></td>
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
				<td><label><b>Number Per Page:</b></label></td>
				<td>
					<select class="browser-default" name="srch.pgNum">
	                    <option value="" disabled selected>Choose your option</option>	
	                    <option value="10" selected="selected">10 per page
	                	<option value="15">15 per page
	                	<option value="20">20 per page
	                </select>
				</td>
				</tr>
				
				<tr>
				</tr>
				
				<tr>
                <td><label><b>Top Number:</b></label></td>
				<td>
					<select class="browser-default" name="srch.tpNum">
	                    <option value="" disabled selected>Choose your option</option>					
	                    <option value="100" selected="selected">Only top 100
	                	<option value="200">Only top 200
	                	<option value="500">Only top 500
	                </select>
				</td>
				</tr>
				
				<tr>
				</tr>				
				
				<tr>
				<td><label><b>Document Type:</b></label></td>
				<td>
				<select class="browser-default" name="srch.docTp">
                	<option value="" disabled selected>Choose your option</option>
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
      		
  	
  	</center>
  <!--

  	
  <footer class="page-footer">
	<center>
 	Copyright © 2016 - 2066 Efilebee. &nbsp; All Rights Reserved.
 	</center>
  </footer> 
  
   	
  -->
  </body>
</html>
