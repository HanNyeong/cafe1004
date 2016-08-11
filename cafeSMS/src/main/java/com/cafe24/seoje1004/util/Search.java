package com.cafe24.seoje1004.util;

public class Search {

	private String upDown;
	private String criteria;
	private String regitDateStart;
	private String regitDateEnd;
	private String searchKey;
	private String search;
	private Integer viewMore = 25;
	public String getUpDown() {
		return upDown;
	}
	public void setUpDown(String upDown) {
		this.upDown = upDown;
	}
	public String getCriteria() {
		return criteria;
	}
	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	public String getRegitDateStart() {
		return regitDateStart;
	}
	public void setRegitDateStart(String regitDateStart) {
		this.regitDateStart = regitDateStart;
	}
	public String getRegitDateEnd() {
		return regitDateEnd;
	}
	public void setRegitDateEnd(String regitDateEnd) {
		this.regitDateEnd = regitDateEnd;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public Integer getViewMore() {
		return viewMore;
	}
	public void setViewMore(Integer viewMore) {
		this.viewMore = viewMore;
	}
	@Override
	public String toString() {
		return "Search [upDown=" + upDown + ", criteria=" + criteria + ", regitDateStart=" + regitDateStart
				+ ", regitDateEnd=" + regitDateEnd + ", searchKey=" + searchKey + ", search=" + search + ", viewMore="
				+ viewMore + "]";
	}
		

}


