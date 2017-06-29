package com.efilebee.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Common {
	
	public static String Date2TikaDate(Date date) throws ParseException {
		if(date == null) {
			//System.out.println("Date2TikaDate INPUT NULL");
			date = new Date();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String tmp = sdf.format(date);
		return tmp.substring(0, 10)+"T"+tmp.substring(11, 19)+"Z";		
	}	
	
	public static Date TikaDate2Date(String date) throws ParseException {
		if(date == null) {
			//System.out.println("TikaDate2Date INPUT NULL");
			return new Date();
		}		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.parse(date.substring(0, 9)+" "+date.substring(11, 18));		
	}	

	public static Long Date2Long(Date date) {
		//second
		return date.getTime()/1000;
	}	
	public static Date Long2Date(Long date) {
		//second
		return new Date(date*1000);
	}		
	
	
	static CharSequence txtCS = "text";
	static CharSequence pdfCS = "pdf";
	static CharSequence wordCS = "word";
	static CharSequence zipCS = "zip";
	static CharSequence rarCS = "rar";
	static CharSequence othersCS = "others";
	
	public static String ExtractFileType(String rawType) {
		if(rawType.contains(txtCS)) {
			return txtCS.toString();
		}
		if(rawType.contains(pdfCS)) {
			return pdfCS.toString();
		}
		if(rawType.contains(wordCS)) {
			return wordCS.toString();
		}
		if(rawType.contains(zipCS)) {
			return zipCS.toString();
		}
		if(rawType.contains(rarCS)) {
			return rarCS.toString();
		}		
		return othersCS.toString();
	}
	
	public static String ExtractFileName(String rawName) {
		if((rawName != null) && (rawName.length() > 0)) {
			int dot = rawName.lastIndexOf('.');
			
			if((dot > -1) && (dot < rawName.length())) {
				return rawName.substring(0, dot);
			}
		}
		return rawName;
	}	
	
	
	public static String ExtractFileUri(String rawUri) {
		if((rawUri != null) && (rawUri.length() > 0)) {
			String tmps[] = rawUri.split(Constant.context);
			return Constant.contextdir+tmps[1].replaceAll("/", "\\");
		}
		return rawUri;
	}	
}
