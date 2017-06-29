package com.efilebee.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;

import com.efilebee.search.AdvancedSearch;
import com.efilebee.search.FileEntity;
import com.efilebee.search.PageEntity;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SearchIndexAction extends ActionSupport {
	

	private static final long serialVersionUID = -1054157450526721928L;
	
	private AdvancedSearch srch;
	

	public AdvancedSearch getSrch() {
		return srch;
	}


	public void setSrch(AdvancedSearch srch) {
		this.srch = srch;
	}


	@Override
	public String execute() throws Exception {
		ActionContext actx=ActionContext.getContext();
		SessionMap smp=(SessionMap)actx.getSession();
		
		HttpServletRequest http_request = ServletActionContext.getRequest();
		String page_tmp = http_request.getParameter("index_page_token");
		if(page_tmp == null)
			page_tmp = "1";
		
		int page = Integer.parseInt(page_tmp);
		
		//Access Control
		//role == "*" : administrator		
		srch.setRole("*");

		List<FileEntity> list = srch.doRetrieve(page);
		
		PageEntity page_entity = null;
		//page_entity = (PageEntity)http_request.getAttribute("page_entity_token");
		page_entity = (PageEntity)smp.get("index_page_entity_token");
		if(page_entity == null) {
			page_entity = new PageEntity();			
		}
		
		final int page_num = srch.getPgNum();
		int record_sum = srch.getRsNum();
		int page_sum = PageEntity.countTotalPage(page_num, record_sum);

		//final int offset = PageEntity.countOffset(page_num, current_page);
		
		page_entity.setPageNum(page_num);
		page_entity.setCurrentPage(page);
		page_entity.setRecordSum(record_sum);
		page_entity.setPageSum(page_sum);
		page_entity.setResultList(list);
		page_entity.init();		

		
		//http_request.setAttribute("page_entity_token", page_entity);
		smp.put("index_page_entity_token", page_entity);
		
		return super.execute();
	}

}
