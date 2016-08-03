package com.cafe24.seoje1004.returns.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Returns {
	/**
	 * 2016-08-02 오성현
	 * Returns 객체 생성
	 */
	
	private String returnCode;	//반품코드
	private String returnReason;	//반품내용
	private int returnPrice;	//반품가격
	private String returnReportDate;	//가맹보고날짜
	private String returnHeadCheck;	//본사확인
	private String returnHeadCheckDate;	//본사확인날짜
	private String totalAccountGroup;	//통합회계그룹
	private String returnReDelivery;	//재배송 요청 유무
	private String returnCancel;	//반품취소여부
	private List<MultipartFile> returnFile; //반품첨부파일
	private String ordersCode;	//주문코드
	private String specificItemCode;	//개별상품코드
	private String headStaffId;	//본사 확인자 아이디
	private String headReturnsConfirm;	//본사확인여부
	private String subCode;		//가맹대표코드
	
	public String getReturnCode() {
		return returnCode;
	}
	public void setReturnCode(String returnCode) {
		this.returnCode = returnCode;
	}
	public String getReturnReason() {
		return returnReason;
	}
	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}
	public int getReturnPrice() {
		return returnPrice;
	}
	public void setReturnPrice(int returnPrice) {
		this.returnPrice = returnPrice;
	}
	public String getReturnReportDate() {
		return returnReportDate;
	}
	public void setReturnReportDate(String returnReportDate) {
		this.returnReportDate = returnReportDate;
	}
	public String getReturnHeadCheck() {
		return returnHeadCheck;
	}
	public void setReturnHeadCheck(String returnHeadCheck) {
		this.returnHeadCheck = returnHeadCheck;
	}
	public String getReturnHeadCheckDate() {
		return returnHeadCheckDate;
	}
	public void setReturnHeadCheckDate(String returnHeadCheckDate) {
		this.returnHeadCheckDate = returnHeadCheckDate;
	}
	public String getTotalAccountGroup() {
		return totalAccountGroup;
	}
	public void setTotalAccountGroup(String totalAccountGroup) {
		this.totalAccountGroup = totalAccountGroup;
	}
	public String getReturnReDelivery() {
		return returnReDelivery;
	}
	public void setReturnReDelivery(String returnReDelivery) {
		this.returnReDelivery = returnReDelivery;
	}
	public String getReturnCancel() {
		return returnCancel;
	}
	public void setReturnCancel(String returnCancel) {
		this.returnCancel = returnCancel;
	}
	public List<MultipartFile> getReturnFile() {
		return returnFile;
	}
	public void setReturnFile(List<MultipartFile> returnFile) {
		this.returnFile = returnFile;
	}
	public String getOrdersCode() {
		return ordersCode;
	}
	public void setOrdersCode(String ordersCode) {
		this.ordersCode = ordersCode;
	}
	public String getSpecificItemCode() {
		return specificItemCode;
	}
	public void setSpecificItemCode(String specificItemCode) {
		this.specificItemCode = specificItemCode;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getHeadReturnsConfirm() {
		return headReturnsConfirm;
	}
	public void setHeadReturnsConfirm(String headReturnsConfirm) {
		this.headReturnsConfirm = headReturnsConfirm;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	@Override
	public String toString() {
		return "Returns [returnCode=" + returnCode + ", returnReason=" + returnReason + ", returnPrice=" + returnPrice
				+ ", returnReportDate=" + returnReportDate + ", returnHeadCheck=" + returnHeadCheck
				+ ", returnHeadCheckDate=" + returnHeadCheckDate + ", totalAccountGroup=" + totalAccountGroup
				+ ", returnReDelivery=" + returnReDelivery + ", returnCancel=" + returnCancel + ", returnFile="
				+ returnFile + ", ordersCode=" + ordersCode + ", specificItemCode=" + specificItemCode
				+ ", headStaffId=" + headStaffId + ", headReturnsConfirm=" + headReturnsConfirm + ", subCode=" + subCode
				+ "]";
	}
	
	
	
	
}
