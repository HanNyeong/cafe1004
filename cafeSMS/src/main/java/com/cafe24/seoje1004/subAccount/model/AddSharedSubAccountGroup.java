package com.cafe24.seoje1004.subAccount.model;

import java.util.List;

public class AddSharedSubAccountGroup {
	private List<String> subAccountFlow; //입출 여부
	private List<String> totalAccountGroup;	//통합회계 그룹코드
	private List<Integer> subAccountSum;
	private List<String> subAccountDetail;
	private List<String> subCode;
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
	public List<Integer> getSubAccountSum() {
		return subAccountSum;
	}
	public void setSubAccountSum(List<Integer> subAccountSum) {
		this.subAccountSum = subAccountSum;
	}
	public List<String> getSubAccountDetail() {
		return subAccountDetail;
	}
	public void setSubAccountDetail(List<String> subAccountDetail) {
		this.subAccountDetail = subAccountDetail;
	}
	public List<String> getSubCode() {
		return subCode;
	}
	public void setSubCode(List<String> subCode) {
		this.subCode = subCode;
	}
	@Override
	public String toString() {
		return "AddSharedSubAccountGroup [subAccountFlow=" + subAccountFlow + ", totalAccountGroup=" + totalAccountGroup
				+ ", subAccountSum=" + subAccountSum + ", subAccountDetail="
				+ subAccountDetail + ", subCode=" + subCode + "]";
	}
	
}	
