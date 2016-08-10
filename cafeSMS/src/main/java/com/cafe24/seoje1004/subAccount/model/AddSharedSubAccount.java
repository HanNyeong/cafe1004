package com.cafe24.seoje1004.subAccount.model;

public class AddSharedSubAccount {
	private String subAccountFlow;	//출금입금
	private String totalAccountGroup;	//통합 출/입금 관련 그룹 코드
	private int subAccountSum;		//금액 (합계일수도 아닐수도 그냥 금액)
	private String subAccountDetail;	//상세내역 (환불에서 왔음 환불!! 뭐 요런식으로)
	private String subCode;			//가맹 대표코드당	알았띠?
	private String subjectCode;		//계정과목코드
	
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
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	@Override
	public String toString() {
		return "AddSharedSubAccount [subAccountFlow=" + subAccountFlow + ", totalAccountGroup=" + totalAccountGroup
				+ ", subAccountSum=" + subAccountSum + ", subAccountDetail=" + subAccountDetail + ", subCode=" + subCode
				+ ", subjectCode=" + subjectCode + "]";
	}
	
	
	
}
