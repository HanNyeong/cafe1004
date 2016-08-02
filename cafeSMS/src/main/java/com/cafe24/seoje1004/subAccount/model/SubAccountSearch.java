package com.cafe24.seoje1004.subAccount.model;

public class SubAccountSearch {
	
	private String regitDateStart;
	private String regitDateEnd;
	private String searchKey;
	private String searchSubAccount;
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
	public String getSearchSubAccount() {
		return searchSubAccount;
	}
	public void setSearchSubAccount(String searchSubAccount) {
		this.searchSubAccount = searchSubAccount;
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
		return "SubAccountSearch [regitDateStart=" + regitDateStart + ", regitDateEnd=" + regitDateEnd + ", searchKey="
				+ searchKey + ", searchSubAccount=" + searchSubAccount + ", criteria=" + criteria + ", upDown=" + upDown
				+ "]";
	}
}
