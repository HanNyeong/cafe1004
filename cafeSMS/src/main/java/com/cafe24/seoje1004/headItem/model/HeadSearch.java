package com.cafe24.seoje1004.headItem.model;

public class HeadSearch {
	private String upDown;
	private String criteria;
	private String regitDateStart;
	private String regitDateEnd;
	private String searchKey;
	private String searchHeadItem;
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
	public String getSearchHeadItem() {
		return searchHeadItem;
	}
	public void setSearchHeadItem(String searchHeadItem) {
		this.searchHeadItem = searchHeadItem;
	}
	@Override
	public String toString() {
		return "HeadSearch [upDown=" + upDown + ", criteria=" + criteria + ", regitDateStart=" + regitDateStart
				+ ", regitDateEnd=" + regitDateEnd + ", searchKey=" + searchKey + ", searchHeadItem=" + searchHeadItem
				+ "]";
	}
	
}
