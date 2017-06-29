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
    
    <title>Edit Index</title>
    
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
 
	
	<script>
	function checkAll() {
		var check_list = document.getElementsByName("chkbxs");
		if(document.getElementById("chkAll").checked)
		{
			for(var i=0; i<check_list.length; i++)
			{
				check_list[i].checked = 1;
			}
		} else {
			for(var j=0; j<check_list.length; j++)
			{
				check_list[j].checked = 0;
			}
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
<div class="container">
	
	<s:form action="" name="main_form" theme="simple">	
	

   <div class="row">
     <div class="col s12 m6">
       <div class="card blue-grey darken-1">
         <div class="card-content white-text">
           <span class="card-title">Results:</span>
             <p>
             	There are <s:property value="#session.index_page_entity_token.recordSum"/> records and <s:property value="#session.index_page_entity_token.pageSum"/> pages. 
				This is Page <s:property value="#session.index_page_entity_token.currentPage"/>.
			 </p>
         </div>
         <div class="card-action">
			<s:if test="%{#session.index_page_entity_token.currentPage <= 1}">
				<a href='#'>First</a>
				<a href='#'>Previous</a>
			</s:if>
			<s:else>
				<s:a href="SearchIndex.action?index_page_token=1">First</s:a>
				<s:a href="SearchIndex.action?index_page_token=%{#session.index_page_entity_token.currentPage - 1}">Previous</s:a>
			</s:else> 
			
			<s:if test="%{#session.index_page_entity_token.currentPage >= #session.index_page_entity_token.pageSum}">
				<a href='#'>Next</a>
				<a href='#'>Last</a>				
			</s:if>
			<s:else>
				<s:a href="SearchIndex.action?index_page_token=%{#session.index_page_entity_token.currentPage + 1}">Next</s:a>
				<s:a href="SearchIndex.action?index_page_token=%{#session.index_page_entity_token.pageSum}">Last</s:a> 
			</s:else> 	
         </div>
       </div>
     </div>
   </div>
		
	
	<table class="striped hoverable" border="" width="600" height="10">
	<tr>
		<td>Update/Delete: </td>
		<td>
				  <button class="btn waves-effect waves-light" type="submit" name="btn_delete" onclick="main_form.action='DeleteIndex.action';main_form.submit();">Delete
				    <i class="mdi-content-send right"></i>
				  </button>  						
		</td>
		<td>			
			<input type="text" name="role" id="txtfld_role" placeholder="Please Enter Role" value="" size="15" maxlength="50" required="true"/>
			
		</td>		
		<td>
				  <button class="btn waves-effect waves-light" type="submit" name="btn_update" onclick="main_form.action='UpdateIndex.action';main_form.submit();">Update
				    <i class="mdi-content-send right"></i>
				  </button> 				  			
		</td>	
	</tr>		
	<tr>
		<td>&nbsp;<input onclick="checkAll()" type="checkbox" name="chkAll" id="chkAll"/><label for="chkAll">All</label></td>
		<td>ID</td>
		<td>Name</td>
		<td>Role</td>
	
	</tr>
	<s:iterator value="#session.index_page_entity_token.resultList" id="file">
		<tr>
			<td>&nbsp;<input type="checkbox" name="chkbxs" id="<s:property value="#file.id"/>" value="<s:property value="#file.id"/>"><label for="<s:property value="#file.id"/>"><s:property value="#file.id"/></label></td>
			<td>&nbsp;<s:property value="#file.id"/></td>
			<td>&nbsp;<s:property value="#file.name"/></td>
			<td>&nbsp;<s:property value="#file.role"/></td>
		</tr>
	</s:iterator>
	</table>

	
	</s:form>
	
<!--	must both have-->
<!--	checkbox label-->
        	
</div>
	
  </body>
</html>
