package com.efilebee.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;

import com.efilebee.db.User;
import com.efilebee.db.user.UserDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private UserDao userOpr;
	private User userPrm;
	public UserDao getUserOpr() {
		return userOpr;
	}
	public void setUserOpr(UserDao userOpr) {
		this.userOpr = userOpr;
	}
	public User getUserPrm() {
		return userPrm;
	}
	public void setUserPrm(User userPrm) {
		this.userPrm = userPrm;
	}
	
	public String UserLogin() throws Exception {
		//System.out.println("UserLogin");
		ActionContext actx=ActionContext.getContext();
		SessionMap smp=(SessionMap)actx.getSession();
		
		User current_user = (User)smp.get("current_user_token");
		if(current_user != null)
			smp.remove("current_user_token");
		current_user = userOpr.seltNmPw(userPrm.getName(), userPrm.getPassword());
		if(current_user != null) {			
			smp.put("current_user_token", current_user);
			//System.out.println("UserLoginSuccess");
			return "UserLoginSuccess";
		} else {
			//System.out.println("UserLoginFailure");
			return "UserLoginFailure";
		}		
	}	
	

	public String UserLogout() throws Exception {
		//System.out.println("UserLogout");
		ActionContext actx=ActionContext.getContext();
		SessionMap smp=(SessionMap)actx.getSession();	
		smp.remove("current_user_token");
		return "UserLogout";
	}
		

	public String DeleteUser() throws Exception {
		//System.out.println("DeleteUser");
		ActionContext actx=ActionContext.getContext();
		SessionMap smp=(SessionMap)actx.getSession();	
		
		User current_user = (User)smp.get("current_user_token");
		User user_checked = (User)smp.get("user_checked_token");
		
		if(current_user.getId() == user_checked.getId()) {
			//System.out.println("DeleteUserFailure");
			return "DeleteUserFailure";				
		} else {
			int num = userOpr.deltId(user_checked.getId());
			if(num == 0) {
				//System.out.println("DeleteUserFailure");
				return "DeleteUserFailure";					
			} else {
				//System.out.println("DeleteUserSuccess");
				
				ArrayList<User> users_retrieved = (ArrayList<User>)smp.get("users_retrieved_token");
				if(users_retrieved != null)
					smp.remove("users_retrieved_token");
				
				if(user_checked != null)
					smp.remove("user_checked_token");					
				
				return "DeleteUserSuccess";					
			}		
			
		}
	}
	
	
	
	public String RetrieveUser() throws Exception {
		//System.out.println("RetrieveUser");
		ActionContext actx=ActionContext.getContext();
		SessionMap smp=(SessionMap)actx.getSession();
		
		ArrayList<User> users_retrieved = (ArrayList<User>)smp.get("users_retrieved_token");
		if(users_retrieved != null)
			smp.remove("users_retrieved_token");
		
		users_retrieved = userOpr.seltNmRl(userPrm.getName(), userPrm.getRole());
		
		if(users_retrieved == null) {
			//System.out.println("RetrieveUserFailure");
			return "RetrieveUserFailure";				
		} else {
			smp.put("users_retrieved_token", users_retrieved);
			//System.out.println("RetrieveUserSuccess");
			return "RetrieveUserSuccess";				
		}
				
		
	}
	
	
	public String CreateUser() throws Exception {
		//System.out.println("CreateUser");
		
		User user_created = userOpr.inst(userPrm);
		
		if(user_created == null) {
			//System.out.println("CreateUserFailure");
			return "CreateUserFailure";			
		} else {
			//System.out.println("CreateUserSuccess");
			return "CreateUserSuccess";				
		}
		
	}
	
	
	
	public String UpdateUser() throws Exception {
		//System.out.println("UpdateUser");
		ActionContext actx=ActionContext.getContext();
		SessionMap smp=(SessionMap)actx.getSession();		
		
		User current_user = (User)smp.get("current_user_token");
		User user_checked = (User)smp.get("user_checked_token");
		
		if(current_user.getId() == user_checked.getId()) {
			//System.out.println("UpdateUserFailure");
			return "UpdateUserFailure";		
		} else {
			int num = userOpr.updtId(userPrm);
			if(num == 0) {
				//System.out.println("UpdateUserFailure");
				return "UpdateUserFailure";					
			} else {
				//System.out.println("UpdateUserSuccess");
				
				ArrayList<User> users_retrieved = (ArrayList<User>)smp.get("users_retrieved_token");
				if(users_retrieved != null)
					smp.remove("users_retrieved_token");
				
				if(user_checked != null)
					smp.remove("user_checked_token");				
				
				return "UpdateUserSuccess";
			}
		}
		
	}	
	
	
	
	public String CheckUser() throws Exception {
		//System.out.println("CheckUser");
		ActionContext actx=ActionContext.getContext();
		SessionMap smp=(SessionMap)actx.getSession();	
		
		HttpServletRequest http_request = ServletActionContext.getRequest();	
		int user_id_checked = Integer.parseInt(http_request.getParameter("user_id_checked_token"));
		
		User user_checked = (User)smp.get("user_checked_token");
		if(user_checked != null)
			smp.remove("user_checked_token");
		user_checked = userOpr.seltId(user_id_checked);
		if(user_checked == null) {
			//System.out.println("CheckUserFailure");
			return "CheckUserFailure";					
		} else {
			smp.put("user_checked_token", user_checked);
			//System.out.println("CheckUserSuccess");
			return "CheckUserSuccess";
		}

	}
	
	
	
}
