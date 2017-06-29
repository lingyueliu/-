package com.efilebee.action;

import org.apache.struts2.dispatcher.SessionMap;

import com.efilebee.index.DeltIndex;
import com.efilebee.search.PageEntity;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteIndexAction extends ActionSupport {


	private static final long serialVersionUID = 2203339420014433527L;

	private DeltIndex deltIdx;
	private String[] chkbxs;
	private String role;
	
	public DeltIndex getDeltIdx() {
		return deltIdx;
	}
	public void setDeltIdx(DeltIndex deltIdx) {
		this.deltIdx = deltIdx;
	}
	public String[] getChkbxs() {
		return chkbxs;
	}
	public void setChkbxs(String[] chkbxs) {
		this.chkbxs = chkbxs;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	@Override
	public String execute() throws Exception {
		deltIdx.delt(chkbxs);
		
		ActionContext actx=ActionContext.getContext();
		SessionMap smp=(SessionMap)actx.getSession();
		
		PageEntity page_entity = null;
		page_entity = (PageEntity)smp.get("index_page_entity_token");
		if(page_entity != null) {
			smp.remove("index_page_entity_token");
		}		
				
		
		return super.execute();
	}
	
	
	
	
	
}
