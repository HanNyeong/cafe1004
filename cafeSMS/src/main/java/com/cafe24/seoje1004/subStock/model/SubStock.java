package com.cafe24.seoje1004.subStock.model;

public class SubStock {
	/**
	 * 최종수정일 2016-08-06	오성현
	 * 가맹재고 객체
	 * 
	 */
	private String subStockCode; 	//가맹재고코드
	private String headStockInDate;		//본사가 가맹에 입고한 날짜
	private String subStockInDate;		//가맹이 화인하고 입고한 날짜
	private String subStockOut;		//판매여부
	private String subStockConfirmDate;		//배송확인날짜
	private String ordersCode;		//주문코드
	private String subCode;		//가맹대표코드
	private String headItemCode;	//본사상품코드
	private String specificItemCode;	//개별상품코드
	private String subStaffCode;	//가맹확인담당직원
	
	public String getSubStockCode() {
		return subStockCode;
	}
	public void setSubStockCode(String subStockCode) {
		this.subStockCode = subStockCode;
	}
	public String getHeadStockInDate() {
		return headStockInDate;
	}
	public void setHeadStockInDate(String headStockInDate) {
		this.headStockInDate = headStockInDate;
	}
	public String getSubStockInDate() {
		return subStockInDate;
	}
	public void setSubStockInDate(String subStockInDate) {
		this.subStockInDate = subStockInDate;
	}
	public String getSubStockOut() {
		return subStockOut;
	}
	public void setSubStockOut(String subStockOut) {
		this.subStockOut = subStockOut;
	}
	public String getSubStockConfirmDate() {
		return subStockConfirmDate;
	}
	public void setSubStockConfirmDate(String subStockConfirmDate) {
		this.subStockConfirmDate = subStockConfirmDate;
	}
	public String getOrdersCode() {
		return ordersCode;
	}
	public void setOrdersCode(String ordersCode) {
		this.ordersCode = ordersCode;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getHeadItemCode() {
		return headItemCode;
	}
	public void setHeadItemCode(String headItemCode) {
		this.headItemCode = headItemCode;
	}
	public String getSpecificItemCode() {
		return specificItemCode;
	}
	public void setSpecificItemCode(String specificItemCode) {
		this.specificItemCode = specificItemCode;
	}
	public String getSubStaffCode() {
		return subStaffCode;
	}
	public void setSubStaffCode(String subStaffCode) {
		this.subStaffCode = subStaffCode;
	}
	@Override
	public String toString() {
		return "SubStock [subStockCode=" + subStockCode + ", headStockInDate=" + headStockInDate + ", subStockInDate="
				+ subStockInDate + ", subStockOut=" + subStockOut + ", subStockConfirmDate=" + subStockConfirmDate
				+ ", ordersCode=" + ordersCode + ", subCode=" + subCode + ", headItemCode=" + headItemCode
				+ ", specificItemCode=" + specificItemCode + ", subStaffCode=" + subStaffCode + "]";
	}
	
	
	
}
