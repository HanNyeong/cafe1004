package com.cafe24.seoje1004.contract.model;

import java.sql.Timestamp;
import java.time.DateTimeException;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Contract {
	/**
	 * 최종수정일 2016-07-28	오성현
	 * contract객체생성
	 * 
	 */
	
	private String contractCode;					//계약코드
	private String contractName;					//계약자 이름(점주 이름)
	private String contractRegitDate;				//테이블에 데이터 등록 날짜
	private String contractActualDate;				//실 계약 날짜
	private String contractExpiryDate;				//계약 만료일
	private int contractDeposit;					//가맹 금액
	private int contractProfitPercent;				//이익 배분율
	private List<MultipartFile> contractFile;			//계약서 첨부 파일
	private int contractN;							//계약 차수
	private Timestamp contractExpireDate;				//계약 파기일
	private List<MultipartFile> contractExpireFile;		//계약 파기 사유서
	private String headStaffId;						//본사 계약 담당 직원
	private String subCode;							//가맹 대표 코드
	private String reContractStatus;				//재계약을했는지 안했는지(했으면 Y)
	private String headContractConfirm;				//본사확인여부 (기본값 N 승인하면 Y)				
	public String getContractCode() {
		return contractCode;
	}
	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	public String getContractName() {
		return contractName;
	}
	public void setContractName(String contractName) {
		this.contractName = contractName;
	}
	public String getContractRegitDate() {
		return contractRegitDate;
	}
	public void setContractRegitDate(String contractRegitDate) {
		this.contractRegitDate = contractRegitDate;
	}
	public String getContractActualDate() {
		return contractActualDate;
	}
	public void setContractActualDate(String contractActualDate) {
		this.contractActualDate = contractActualDate;
	}
	public String getContractExpiryDate() {
		return contractExpiryDate;
	}
	public void setContractExpiryDate(String contractExpiryDate) {
		this.contractExpiryDate = contractExpiryDate;
	}
	public int getContractDeposit() {
		return contractDeposit;
	}
	public void setContractDeposit(int contractDeposit) {
		this.contractDeposit = contractDeposit;
	}
	public int getContractProfitPercent() {
		return contractProfitPercent;
	}
	public void setContractProfitPercent(int contractProfitPercent) {
		this.contractProfitPercent = contractProfitPercent;
	}
	public List<MultipartFile> getContractFile() {
		return contractFile;
	}
	public void setContractFile(List<MultipartFile> contractFile) {
		this.contractFile = contractFile;
	}
	public int getContractN() {
		return contractN;
	}
	public void setContractN(int contractN) {
		this.contractN = contractN;
	}
	public Timestamp getContractExpireDate() {
		return contractExpireDate;
	}
	public void setContractExpireDate(Timestamp contractExpireDate) {
		this.contractExpireDate = contractExpireDate;
	}
	public List<MultipartFile> getContractExpireFile() {
		return contractExpireFile;
	}
	public void setContractExpireFile(List<MultipartFile> contractExpireFile) {
		this.contractExpireFile = contractExpireFile;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getReContractStatus() {
		return reContractStatus;
	}
	public void setReContractStatus(String reContractStatus) {
		this.reContractStatus = reContractStatus;
	}
	public String getHeadContractConfirm() {
		return headContractConfirm;
	}
	public void setHeadContractConfirm(String headContractConfirm) {
		this.headContractConfirm = headContractConfirm;
	}
	@Override
	public String toString() {
		return "Contract [contractCode=" + contractCode + ", contractName=" + contractName + ", contractRegitDate="
				+ contractRegitDate + ", contractActualDate=" + contractActualDate + ", contractExpiryDate="
				+ contractExpiryDate + ", contractDeposit=" + contractDeposit + ", contractProfitPercent="
				+ contractProfitPercent + ", contractFile=" + contractFile + ", contractN=" + contractN
				+ ", contractExpireDate=" + contractExpireDate + ", contractExpireFile=" + contractExpireFile
				+ ", headStaffId=" + headStaffId + ", subCode=" + subCode + ", reContractStatus=" + reContractStatus
				+ ", headContractConfirm=" + headContractConfirm + "]";
	}
	
	
}
