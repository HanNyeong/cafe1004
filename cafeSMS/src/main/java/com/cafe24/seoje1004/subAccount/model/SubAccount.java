package com.cafe24.seoje1004.subAccount.model;

public class SubAccount {
	private String subAccountCode;
	private String subAccountFlow;
	private String totalAccountGroup;
	private int subAccountPrice;
	private String subAccountRequestDate;
	private String subAccountDetail;
	private String subjectCode;
	private String subClientCode;
	private String subCode;
	private String subStaffCode;
	
	public String getSubAccountCode() {
		return subAccountCode;
	}
	public void setSubAccountCode(String subAccountCode) {
		this.subAccountCode = subAccountCode;
	}
	public String getSubAccountFlow() {
		return subAccountFlow;
	}
	public void setSubAccountFlow(String subAccountFlow) {
		this.subAccountFlow = subAccountFlow;
	}
	public String getTotalAccountGroup() {
		return totalAccountGroup;
	}
	public void setTotalAccountGroup(String totalAccountGroup) {
		this.totalAccountGroup = totalAccountGroup;
	}
	public int getSubAccountPrice() {
		return subAccountPrice;
	}
	public void setSubAccountPrice(int subAccountPrice) {
		this.subAccountPrice = subAccountPrice;
	}
	public String getSubAccountRequestDate() {
		return subAccountRequestDate;
	}
	public void setSubAccountRequestDate(String subAccountRequestDate) {
		this.subAccountRequestDate = subAccountRequestDate;
	}

	public String getSubAccountDetail() {
		return subAccountDetail;
	}
	public void setSubAccountDetail(String subAccountDetail) {
		this.subAccountDetail = subAccountDetail;
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getSubClientCode() {
		return subClientCode;
	}
	public void setSubClientCode(String subClientCode) {
		this.subClientCode = subClientCode;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getSubStaffCode() {
		return subStaffCode;
	}
	public void setSubStaffCode(String subStaffCode) {
		this.subStaffCode = subStaffCode;
	}

	
	@Override
	public String toString() {
		return "SubAccount [subAccountCode=" + subAccountCode + ", subAccountFlow=" + subAccountFlow
				+ ", totalAccountGroup=" + totalAccountGroup + ", subAccountPrice=" + subAccountPrice
				+ ", subAccountRequestDate=" + subAccountRequestDate + ", subAccountDetail=" + subAccountDetail
				+ ", subjectCode=" + subjectCode + ", subClientCode=" + subClientCode + ", subCode=" + subCode
				+ ", subStaffCode=" + subStaffCode + "]";
	}
	
}
