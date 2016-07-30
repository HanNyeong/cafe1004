package com.cafe24.seoje1004.claim.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * 최종수정일 2016-07-30 오성현
 * Claim객체
 */
public class Claim {
	private String claimCode;				//불만접수코드
	private String claimType;				//불만종류
	private String claimAskDate;			//불만 접수 날짜
	private String claimContent;			//불만내용
	private String claimAnswerDate;			//답변일자
	private String claimAnswerContent;		//답변내용
	private String subCode;					//가맹대표코드
	private String customerName;			//고객이름
	private String customerPhone;			//고객전화번호
	private List<MultipartFile> claimFile;	//첨부파일
	private String claimStatus;				//처리상태
	
	public String getClaimCode() {
		return claimCode;
	}
	public void setClaimCode(String claimCode) {
		this.claimCode = claimCode;
	}
	public String getClaimType() {
		return claimType;
	}
	public void setClaimType(String claimType) {
		this.claimType = claimType;
	}
	public String getClaimAskDate() {
		return claimAskDate;
	}
	public void setClaimAskDate(String claimAskDate) {
		this.claimAskDate = claimAskDate;
	}
	public String getClaimContent() {
		return claimContent;
	}
	public void setClaimContent(String claimContent) {
		this.claimContent = claimContent;
	}
	public String getClaimAnswerDate() {
		return claimAnswerDate;
	}
	public void setClaimAnswerDate(String claimAnswerDate) {
		this.claimAnswerDate = claimAnswerDate;
	}
	public String getClaimAnswerContent() {
		return claimAnswerContent;
	}
	public void setClaimAnswerContent(String claimAnswerContent) {
		this.claimAnswerContent = claimAnswerContent;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	public List<MultipartFile> getClaimFile() {
		return claimFile;
	}
	public void setClaimFile(List<MultipartFile> claimFile) {
		this.claimFile = claimFile;
	}
	public String getClaimStatus() {
		return claimStatus;
	}
	public void setClaimStatus(String claimStatus) {
		this.claimStatus = claimStatus;
	}
	@Override
	public String toString() {
		return "Claim [claimCode=" + claimCode + ", claimType=" + claimType + ", claimAskDate=" + claimAskDate
				+ ", claimContent=" + claimContent + ", claimAnswerDate=" + claimAnswerDate + ", claimAnswerContent="
				+ claimAnswerContent + ", subCode=" + subCode + ", customerName=" + customerName + ", customerPhone="
				+ customerPhone + ", claimFile=" + claimFile + ", claimStatus=" + claimStatus + "]";
	}
	
	
}
