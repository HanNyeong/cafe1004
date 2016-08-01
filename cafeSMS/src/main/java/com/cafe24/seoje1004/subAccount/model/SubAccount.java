package com.cafe24.seoje1004.subAccount.model;

public class SubAccount {
	private String subAccountCode;
	private String subAccountFlow;
	private String subAccountGroupCode;
	private String subAccountTable;
	private int subAccountSum;
	private String subAccountRequestDate;
	private String subAccountCheck;
	private String subAccountDetail;
	private String subjectCode;
	private String subClientCode;
	private String subCode;
	private String subStaffCode;
	private String subStaffKeeper;
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
	public String getSubAccountGroupCode() {
		return subAccountGroupCode;
	}
	public void setSubAccountGroupCode(String subAccountGroupCode) {
		this.subAccountGroupCode = subAccountGroupCode;
	}
	public String getSubAccountTable() {
		return subAccountTable;
	}
	public void setSubAccountTable(String subAccountTable) {
		this.subAccountTable = subAccountTable;
	}
	public int getSubAccountSum() {
		return subAccountSum;
	}
	public void setSubAccountSum(int subAccountSum) {
		this.subAccountSum = subAccountSum;
	}
	public String getSubAccountRequestDate() {
		return subAccountRequestDate;
	}
	public void setSubAccountRequestDate(String subAccountRequestDate) {
		this.subAccountRequestDate = subAccountRequestDate;
	}
	public String getSubAccountCheck() {
		return subAccountCheck;
	}
	public void setSubAccountCheck(String subAccountCheck) {
		this.subAccountCheck = subAccountCheck;
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
	public String getSubStaffKeeper() {
		return subStaffKeeper;
	}
	public void setSubStaffKeeper(String subStaffKeeper) {
		this.subStaffKeeper = subStaffKeeper;
	}
	@Override
	public String toString() {
		return "SubAccount [subAccountCode=" + subAccountCode + ", subAccountFlow=" + subAccountFlow
				+ ", subAccountGroupCode=" + subAccountGroupCode + ", subAccountTable=" + subAccountTable
				+ ", subAccountSum=" + subAccountSum + ", subAccountRequestDate=" + subAccountRequestDate
				+ ", subAccountCheck=" + subAccountCheck + ", subAccountDetail=" + subAccountDetail + ", subjectCode="
				+ subjectCode + ", subClientCode=" + subClientCode + ", subCode=" + subCode + ", subStaffCode="
				+ subStaffCode + ", subStaffKeeper=" + subStaffKeeper + "]";
	}
	
}
