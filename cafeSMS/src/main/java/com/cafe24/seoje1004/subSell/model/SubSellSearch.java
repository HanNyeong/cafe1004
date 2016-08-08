package com.cafe24.seoje1004.subSell.model;

public class SubSellSearch {
	/**
	 * 최종수정일 2016-08-08 오성현
	 * 검색 및 컬럼별조회를 위한 객체
	 */
	
	private String upDown;
	private String criteria;
	private String regitDateStart;
	private String regitDateEnd;
	private String searchKey;
	private String searchSubSell;

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
	public String getSearchSubSell() {
		return searchSubSell;
	}
	public void setSearchSubSell(String searchSubSell) {
		this.searchSubSell = searchSubSell;
	}
	@Override
	public String toString() {
		return "SubSellSearch [upDown=" + upDown + ", criteria=" + criteria + ", regitDateStart=" + regitDateStart
				+ ", regitDateEnd=" + regitDateEnd + ", searchKey=" + searchKey + ", searchSubSell=" + searchSubSell
				+ "]";
	}
	
	
}
