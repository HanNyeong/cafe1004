package com.cafe24.seoje1004.subAccount.model;

import java.util.List;

public class SubAccounts {
	private List<String> subAccountCode;
	private List<String> subAccountFlow;
	private List<String> totalAccountGroup;
	private List<String> subAccountTable;
	private List<Integer> subAccountSum;
	private List<String> subAccountRequestDate;
	private List<String> subAccountCheck;
	private List<String> subAccountDetail;
	private List<String> subjectCode;
	private List<String> subClientCode;
	private List<String> subCode;
	private List<String> subStaffCode;
	private List<String> subStaffKeeper;
	public List<String> getSubAccountCode() {
		return subAccountCode;
	}
	public void setSubAccountCode(List<String> subAccountCode) {
		this.subAccountCode = subAccountCode;
	}
	public List<String> getSubAccountFlow() {
		return subAccountFlow;
	}
	public void setSubAccountFlow(List<String> subAccountFlow) {
		this.subAccountFlow = subAccountFlow;
	}
	public List<String> getTotalAccountGroup() {
		return totalAccountGroup;
	}
	public void setTotalAccountGroup(List<String> totalAccountGroup) {
		this.totalAccountGroup = totalAccountGroup;
	}
	public List<String> getSubAccountTable() {
		return subAccountTable;
	}
	public void setSubAccountTable(List<String> subAccountTable) {
		this.subAccountTable = subAccountTable;
	}
	public List<Integer> getSubAccountSum() {
		return subAccountSum;
	}
	public void setSubAccountSum(List<Integer> subAccountSum) {
		this.subAccountSum = subAccountSum;
	}
	public List<String> getSubAccountRequestDate() {
		return subAccountRequestDate;
	}
	public void setSubAccountRequestDate(List<String> subAccountRequestDate) {
		this.subAccountRequestDate = subAccountRequestDate;
	}
	public List<String> getSubAccountCheck() {
		return subAccountCheck;
	}
	public void setSubAccountCheck(List<String> subAccountCheck) {
		this.subAccountCheck = subAccountCheck;
	}
	public List<String> getSubAccountDetail() {
		return subAccountDetail;
	}
	public void setSubAccountDetail(List<String> subAccountDetail) {
		this.subAccountDetail = subAccountDetail;
	}
	public List<String> getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(List<String> subjectCode) {
		this.subjectCode = subjectCode;
	}
	public List<String> getSubClientCode() {
		return subClientCode;
	}
	public void setSubClientCode(List<String> subClientCode) {
		this.subClientCode = subClientCode;
	}
	public List<String> getSubCode() {
		return subCode;
	}
	public void setSubCode(List<String> subCode) {
		this.subCode = subCode;
	}
	public List<String> getSubStaffCode() {
		return subStaffCode;
	}
	public void setSubStaffCode(List<String> subStaffCode) {
		this.subStaffCode = subStaffCode;
	}
	public List<String> getSubStaffKeeper() {
		return subStaffKeeper;
	}
	public void setSubStaffKeeper(List<String> subStaffKeeper) {
		this.subStaffKeeper = subStaffKeeper;
	}
	@Override
	public String toString() {
		return "SubAccounts [subAccountCode=" + subAccountCode + ", subAccountFlow=" + subAccountFlow
				+ ", totalAccountGroup=" + totalAccountGroup + ", subAccountTable=" + subAccountTable
				+ ", subAccountSum=" + subAccountSum + ", subAccountRequestDate=" + subAccountRequestDate
				+ ", subAccountCheck=" + subAccountCheck + ", subAccountDetail=" + subAccountDetail + ", subjectCode="
				+ subjectCode + ", subClientCode=" + subClientCode + ", subCode=" + subCode + ", subStaffCode="
				+ subStaffCode + ", subStaffKeeper=" + subStaffKeeper + "]";
	}
	
	
}
