package com.cafe24.seoje1004.orders.model;

public class Orders {
	private String ordersCode;
	private String subOrdersGroup;
	private int subOrdersQuantity;
	private String subOrdersDate;
	private String subOrdersHeadCheck;
	private String subOrdersStatus;
	private String totalAccountGroup;
	private String ordersPay;
	private String ordersPayDate;
	private String headItemCode;
	private String subCode;
	private String subStaffCode;
	private String headStaffId;
	private String headOrdersConfirm;
	
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
		return "Orders [ordersCode=" + ordersCode + ", subOrdersGroup=" + subOrdersGroup + ", subOrdersQuantity="
				+ subOrdersQuantity + ", subOrdersDate=" + subOrdersDate + ", subOrdersHeadCheck=" + subOrdersHeadCheck
				+ ", subOrdersStatus=" + subOrdersStatus + ", totalAccountGroup=" + totalAccountGroup + ", ordersPay="
				+ ordersPay + ", ordersPayDate=" + ordersPayDate + ", headItemCode=" + headItemCode + ", subCode="
				+ subCode + ", subStaffCode=" + subStaffCode + ", headStaffId=" + headStaffId + ", headOrdersConfirm="
				+ headOrdersConfirm + "]";
	}
	
	
}
