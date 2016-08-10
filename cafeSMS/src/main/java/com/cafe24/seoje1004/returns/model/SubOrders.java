package com.cafe24.seoje1004.returns.model;

public class SubOrders {
	private String ordersCode;		//가맹발주코드
	private String subOrdersGroup;	//가맹주문그룹코드
	private int subOrdersQuantity;	//가맹주문수량
	private String subOrdersDate;	//가맹주문날짜
	private String subOrdersHeadCheck;	//본사확인날짜
	private String subOrdersStatus;		//배송상태
	private String totalAccountGroup;	//통합회계그룹코드
	private String ordersPay;		//결제유무
	private String ordersPayDate;	//결제날짜
	private String headItemCode;	//본사 상품코드
	private String subCode;			//가맹 대표코드
	private String subStaffCode;	//가맹주문한직원
	private String headStaffId;		//확인한 본사직원
	private String headOrdersConfirm;	//본사확인여부
	private int subOrdersPrice; //가격
	private int hItemPrice; //상품하나의 가격
	
	
	public int gethItemPrice() {
		return hItemPrice;
	}
	public void sethItemPrice(int hItemPrice) {
		this.hItemPrice = hItemPrice;
	}
	public int getSubOrdersPrice() {
		return subOrdersPrice;
	}
	public void setSubOrdersPrice(int subOrdersPrice) {
		this.subOrdersPrice = subOrdersPrice;
	}
	public String getOrdersCode() {
		return ordersCode;
	}
	public void setOrdersCode(String ordersCode) {
		this.ordersCode = ordersCode;
	}
	public String getSubOrdersGroup() {
		return subOrdersGroup;
	}
	public void setSubOrdersGroup(String subOrdersGroup) {
		this.subOrdersGroup = subOrdersGroup;
	}
	public int getSubOrdersQuantity() {
		return subOrdersQuantity;
	}
	public void setSubOrdersQuantity(int subOrdersQuantity) {
		this.subOrdersQuantity = subOrdersQuantity;
	}
	public String getSubOrdersDate() {
		return subOrdersDate;
	}
	public void setSubOrdersDate(String subOrdersDate) {
		this.subOrdersDate = subOrdersDate;
	}
	public String getSubOrdersHeadCheck() {
		return subOrdersHeadCheck;
	}
	public void setSubOrdersHeadCheck(String subOrdersHeadCheck) {
		this.subOrdersHeadCheck = subOrdersHeadCheck;
	}
	public String getSubOrdersStatus() {
		return subOrdersStatus;
	}
	public void setSubOrdersStatus(String subOrdersStatus) {
		this.subOrdersStatus = subOrdersStatus;
	}
	public String getTotalAccountGroup() {
		return totalAccountGroup;
	}
	public void setTotalAccountGroup(String totalAccountGroup) {
		this.totalAccountGroup = totalAccountGroup;
	}
	public String getOrdersPay() {
		return ordersPay;
	}
	public void setOrdersPay(String ordersPay) {
		this.ordersPay = ordersPay;
	}
	public String getOrdersPayDate() {
		return ordersPayDate;
	}
	public void setOrdersPayDate(String ordersPayDate) {
		this.ordersPayDate = ordersPayDate;
	}
	public String getHeadItemCode() {
		return headItemCode;
	}
	public void setHeadItemCode(String headItemCode) {
		this.headItemCode = headItemCode;
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
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getHeadOrdersConfirm() {
		return headOrdersConfirm;
	}
	public void setHeadOrdersConfirm(String headOrdersConfirm) {
		this.headOrdersConfirm = headOrdersConfirm;
	}
	@Override
	public String toString() {
		return "SubOrders [ordersCode=" + ordersCode + ", subOrdersGroup=" + subOrdersGroup + ", subOrdersQuantity="
				+ subOrdersQuantity + ", subOrdersDate=" + subOrdersDate + ", subOrdersHeadCheck=" + subOrdersHeadCheck
				+ ", subOrdersStatus=" + subOrdersStatus + ", totalAccountGroup=" + totalAccountGroup + ", ordersPay="
				+ ordersPay + ", ordersPayDate=" + ordersPayDate + ", headItemCode=" + headItemCode + ", subCode="
				+ subCode + ", subStaffCode=" + subStaffCode + ", headStaffId=" + headStaffId + ", headOrdersConfirm="
				+ headOrdersConfirm + ", subOrdersPrice=" + subOrdersPrice + ", hItemPrice=" + hItemPrice + "]";
	}
	
	
}
