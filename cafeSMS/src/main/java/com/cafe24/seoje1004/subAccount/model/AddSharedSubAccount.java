package com.cafe24.seoje1004.subAccount.model;

public class AddSharedSubAccount {
	private String subAccountFlow;
	private String totalAccountGroup;
	private String subAccountTable;
	private int subAccountSum;
	private String subAccountDetail;
	private String subCode;
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
	public String getSubAccountDetail() {
		return subAccountDetail;
	}
	public void setSubAccountDetail(String subAccountDetail) {
		this.subAccountDetail = subAccountDetail;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	@Override
	public String toString() {
		return "AddSubAccount [subAccountFlow=" + subAccountFlow + ", totalAccountGroup=" + totalAccountGroup
				+ ", subAccountTable=" + subAccountTable + ", subAccountSum=" + subAccountSum + ", subAccountDetail="
				+ subAccountDetail + ", subCode=" + subCode + "]";
	}
	
}
