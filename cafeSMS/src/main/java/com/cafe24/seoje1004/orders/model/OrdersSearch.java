package com.cafe24.seoje1004.orders.model;

public class OrdersSearch {
	private String regitDateStart;
	private String regitDateEnd;
	private String searchKey;
	private String searchContract;
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
	public String getSearchContract() {
		return searchContract;
	}
	public void setSearchContract(String searchContract) {
		this.searchContract = searchContract;
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
		return "OrdersSearch [regitDateStart=" + regitDateStart + ", regitDateEnd=" + regitDateEnd + ", searchKey="
				+ searchKey + ", searchContract=" + searchContract + ", criteria=" + criteria + ", upDown=" + upDown
				+ "]";
	}
	
	
}
