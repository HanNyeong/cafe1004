package com.cafe24.seoje1004.event.model;

public class EventSearch {
	private String upDown;
	private String criteria;
	private String regitDateStart;
	private String regitDateEnd;
	private String searchKey;
	private String searchEvent;
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
	public String getSearchEvent() {
		return searchEvent;
	}
	public void setSearchEvent(String searchEvent) {
		this.searchEvent = searchEvent;
	}
	@Override
	public String toString() {
		return "EventSearch [upDown=" + upDown + ", criteria=" + criteria + ", regitDateStart=" + regitDateStart
				+ ", regitDateEnd=" + regitDateEnd + ", searchKey=" + searchKey + ", searchEvent=" + searchEvent + "]";
	}
	
}