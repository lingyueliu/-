package com.efilebee.search;

import java.util.List;

public class PageEntity {
	private List resultList;
	private int recordSum;
	private int pageSum;
	private int currentPage;
	private int pageNum;
	private boolean isFirstPage;
	private boolean isLastPage;
	private boolean hasPreviousPage;
	private boolean hasNextPage;
	
	public void init() {
		this.isFirstPage = isFirstPage();
		this.isLastPage = isLastPage();
		this.hasPreviousPage = isHasPreviousPage();
		this.hasNextPage = isHasNextPage();
	}
	
	public static int countTotalPage(int pageSize,int recordSum) {
		int total_page = recordSum%pageSize==0 ? recordSum/pageSize : recordSum/pageSize+1;
		return total_page;
	}
	
//	public static int countOffset(final int pageSize, final int currentPage) {
//		final int offset = pageSize*(currentPage-1);
//		return offset;
//	}
	
	public static int countCurrentPage(int page) {
		final int current_page = (page==0 ? 1 : page);
		return current_page;
	}
	
	
	/********************Current Page Status********************/	
	public boolean isFirstPage() {
		return currentPage==1;
	}
	
	public boolean isLastPage() {
		return currentPage==pageSum;
	}

	public boolean isHasPreviousPage() {
		return currentPage!=1;
	}
	
	public boolean isHasNextPage() {
		return currentPage!=pageSum;
	}

	
	/********************Get/Set Method********************/
	public List getResultList() {
		return resultList;
	}

	public void setResultList(List resultList) {
		this.resultList = resultList;
	}

	public int getRecordSum() {
		return recordSum;
	}

	public void setRecordSum(int recordSum) {
		this.recordSum = recordSum;
	}

	public int getPageSum() {
		return pageSum;
	}

	public void setPageSum(int pageSum) {
		this.pageSum = pageSum;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setFirstPage(boolean isFirstPage) {
		this.isFirstPage = isFirstPage;
	}

	public void setLastPage(boolean isLastPage) {
		this.isLastPage = isLastPage;
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}	
	
	
}
