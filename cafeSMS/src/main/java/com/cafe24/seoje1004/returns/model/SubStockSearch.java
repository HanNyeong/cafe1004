package com.cafe24.seoje1004.returns.model;

public class SubStockSearch {
	/**
	 * 2016-08-04	오성현
	 * 가맹재고의 검색 및 컬럼별조회를 위한 객체
	 */
	
	private String regitDateStart;
	private String regitDateEnd;
	private String searchKey;
	private String searchSubStock;
	private String criteria;
	private String upDown;
	
	
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
	public String getSearchSubStock() {
		return searchSubStock;
	}
	public void setSearchSubStock(String searchSubStock) {
		this.searchSubStock = searchSubStock;
	}
	public String getCriteria() {
		return criteria;
	}
	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	public String getUpDown() {
		return upDown;
	}
	public void setUpDown(String upDown) {
		this.upDown = upDown;
	}
	@Override
	public String toString() {
		return "SubStockSearch [regitDateStart=" + regitDateStart + ", regitDateEnd=" + regitDateEnd + ", searchKey="
				+ searchKey + ", searchSubStock=" + searchSubStock + ", criteria=" + criteria + ", upDown=" + upDown
				+ "]";
	}
	
	
}
