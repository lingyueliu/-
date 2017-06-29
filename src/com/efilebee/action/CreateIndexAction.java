package com.efilebee.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.efilebee.index.InitIndex;
import com.efilebee.index.InstIndex;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class CreateIndexAction extends ActionSupport {
	
	private static final long serialVersionUID = 3880858366342293016L;
	
	private InitIndex initIdx;
	private InstIndex instIdx;
	
	
	@Override
	public String execute() throws Exception {
		HttpServletRequest http_request = ServletActionContext.getRequest();	
		String index_option = http_request.getParameter("index_option_token");
	
		if("init".equals(index_option)) {
			Date from = new Date();
			this.initIdx.init();
			Date to = new Date();
			long diff = to.getTime() - from.getTime();
			System.out.println(diff/(1000.0*60.0));
			return Action.SUCCESS;
		}
		else if("inst".equals(index_option)) {
			Date from = new Date();
			this.instIdx.inst();
			Date to = new Date();
			long diff = to.getTime() - from.getTime();
			System.out.println(diff/(1000.0*60.0));
			return Action.SUCCESS;
		}
		else {
			return Action.ERROR;
		}
		
	}

	
	public InitIndex getInitIdx() {
		return initIdx;
	}


	public void setInitIdx(InitIndex initIdx) {
		this.initIdx = initIdx;
	}


	public InstIndex getInstIdx() {
		return instIdx;
	}


	public void setInstIdx(InstIndex instIdx) {
		this.instIdx = instIdx;
	}	
}
