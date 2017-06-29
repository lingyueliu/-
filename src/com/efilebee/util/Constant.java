package com.efilebee.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class Constant {
	//public static String basedir="\\";
	public static String contfld="CONTENT";
	public static String context="efilebee";
	public static String basedir=System.getProperty("user.dir");//C:\apache-tomcat-6.0.33\bin
	public static String contextdir="\\"+context;
	
	public static String indexdir=basedir+"\\indexdir\\";
	public static String filedir=basedir+"\\filedir\\";
	
	public static String getRealPath(String str) {
		//C:\apache-tomcat-6.0.33\webapps\efilebee
		HttpServletRequest request = ServletActionContext.getRequest();
		if("file".equals(str)) {
			//filedir = request.getRealPath("filedir");
			filedir = request.getSession().getServletContext().getRealPath("filedir");
			return filedir;		
		}
		if("index".equals(str)) {
			//indexdir = request.getRealPath("indexdir");
			indexdir = request.getSession().getServletContext().getRealPath("indexdir");
			return indexdir;		
		}		
		
		return basedir;
	}
	
	

}
