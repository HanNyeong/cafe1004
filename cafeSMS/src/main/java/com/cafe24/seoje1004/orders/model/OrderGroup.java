package com.cafe24.seoje1004.orders.model;

import java.util.List;

public class OrderGroup {
	private List<String> ordersCode;
	private List<String> subOrdersGroup;
	private List<Integer> subOrdersQuantity;
	private List<String> subOrdersDate;
	private List<String> subOrdersHeadCheck;
	private List<String> subOrdersStatus;
	private List<String> totalAccountGroup;
	private List<String> ordersPay;
	private List<String> ordersPayDate;
	private List<String> headItemCode;
	private List<String> subCode;
	private List<String> subStaffCode;
	private List<String> headStaffId;
	private List<String> headOrdersConfirm;
	private List<Integer> subOrdersPrice;
	
	public List<Integer> getSubOrdersPrice() {
		return subOrdersPrice;
	}
	public void setSubOrdersPrice(List<Integer> subOrdersPrice) {
		this.subOrdersPrice = subOrdersPrice;
	}
	@Override
	public String toString() {
		return "OrderGroup [ordersCode=" + ordersCode + ", subOrdersGroup=" + subOrdersGroup + ", subOrdersQuantity="
				+ subOrdersQuantity + ", subOrdersDate=" + subOrdersDate + ", subOrdersHeadCheck=" + subOrdersHeadCheck
				+ ", subOrdersStatus=" + subOrdersStatus + ", totalAccountGroup=" + totalAccountGroup + ", ordersPay="
				+ ordersPay + ", ordersPayDate=" + ordersPayDate + ", headItemCode=" + headItemCode + ", subCode="
				+ subCode + ", subStaffCode=" + subStaffCode + ", headStaffId=" + headStaffId + ", headOrdersConfirm="
				+ headOrdersConfirm + "]";
	}
	public List<String> getOrdersCode() {
		return ordersCode;
	}
	public void setOrdersCode(List<String> ordersCode) {
		this.ordersCode = ordersCode;
	}
	public List<String> getSubOrdersGroup() {
		return subOrdersGroup;
	}
	public void setSubOrdersGroup(List<String> subOrdersGroup) {
		this.subOrdersGroup = subOrdersGroup;
	}
	public List<Integer> getSubOrdersQuantity() {
		return subOrdersQuantity;
	}
	public void setSubOrdersQuantity(List<Integer> subOrdersQuantity) {
		this.subOrdersQuantity = subOrdersQuantity;
	}
	public List<String> getSubOrdersDate() {
		return subOrdersDate;
	}
	public void setSubOrdersDate(List<String> subOrdersDate) {
		this.subOrdersDate = subOrdersDate;
	}
	public List<String> getSubOrdersHeadCheck() {
		return subOrdersHeadCheck;
	}
	public void setSubOrdersHeadCheck(List<String> subOrdersHeadCheck) {
		this.subOrdersHeadCheck = subOrdersHeadCheck;
	}
	public List<String> getSubOrdersStatus() {
		return subOrdersStatus;
	}
	public void setSubOrdersStatus(List<String> subOrdersStatus) {
		this.subOrdersStatus = subOrdersStatus;
	}
	public List<String> getTotalAccountGroup() {
		return totalAccountGroup;
	}
	public void setTotalAccountGroup(List<String> totalAccountGroup) {
		this.totalAccountGroup = totalAccountGroup;
	}
	public List<String> getOrdersPay() {
		return ordersPay;
	}
	public void setOrdersPay(List<String> ordersPay) {
		this.ordersPay = ordersPay;
	}
	public List<String> getOrdersPayDate() {
		return ordersPayDate;
	}
	public void setOrdersPayDate(List<String> ordersPayDate) {
		this.ordersPayDate = ordersPayDate;
	}
	public List<String> getHeadItemCode() {
		return headItemCode;
	}
	public void setHeadItemCode(List<String> headItemCode) {
		this.headItemCode = headItemCode;
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
	public List<String> getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(List<String> headStaffId) {
		this.headStaffId = headStaffId;
	}
	public List<String> getHeadOrdersConfirm() {
		return headOrdersConfirm;
	}
	public void setHeadOrdersConfirm(List<String> headOrdersConfirm) {
		this.headOrdersConfirm = headOrdersConfirm;
	}
	
}
