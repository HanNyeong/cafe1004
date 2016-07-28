package com.cafe24.seoje1004.sub.model;

public class SubSearch {
	private String upAndDown;
	private String column;
	private String regitDateStart;
	private String regitDateEnd;
	private String searchKey;
	private String searchSub;
	
	public String getUpAndDown() {
		return upAndDown;
	}
	public void setUpAndDown(String upAndDown) {
		this.upAndDown = upAndDown;
	}

	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
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
	public String getSearchSub() {
		return searchSub;
	}
	public void setSearchSub(String searchSub) {
		this.searchSub = searchSub;
	}
	@Override
	public String toString() {
		return "subSearch [upAndDown=" + upAndDown + ", column=" + column + ", regitDateStart=" + regitDateStart
				+ ", regitDateEnd=" + regitDateEnd + ", searchKey=" + searchKey + ", searchSub=" + searchSub + "]";
	}
	
	
}
