package com.cafe24.seoje1004.subAccount.model;

import java.util.List;

public class SubAccounts {
	private List<String> subAccountCode;
	private List<String> subAccountFlow;
	private List<String> totalAccountGroup;
	private List<Integer> subAccountPrice;
	private List<String> subAccountRequestDate;
	private List<String> subAccountDetail;
	private List<String> subjectCode;
	private List<String> subClientCode;
	private List<String> subCode;
	
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
	public List<Integer> getSubAccountPrice() {
		return subAccountPrice;
	}
	public void setSubAccountPrice(List<Integer> subAccountPrice) {
		this.subAccountPrice = subAccountPrice;
	}
	public List<String> getSubAccountRequestDate() {
		return subAccountRequestDate;
	}
	public void setSubAccountRequestDate(List<String> subAccountRequestDate) {
		this.subAccountRequestDate = subAccountRequestDate;
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
	

	@Override
	public String toString() {
		return "SubAccounts [subAccountCode=" + subAccountCode + ", subAccountFlow=" + subAccountFlow
				+ ", totalAccountGroup=" + totalAccountGroup + ", subAccountPrice=" + subAccountPrice
				+ ", subAccountRequestDate=" + subAccountRequestDate + ", subAccountDetail=" + subAccountDetail
				+ ", subjectCode=" + subjectCode + ", subClientCode=" + subClientCode + ", subCode=" + subCode
				;
	}
	
	
}
