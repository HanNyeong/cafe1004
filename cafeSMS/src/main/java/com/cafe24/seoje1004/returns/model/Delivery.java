package com.cafe24.seoje1004.returns.model;

public class Delivery {
	/**
	 * 2016-08-02 오성현
	 * Delevery 객체
	 */
	
	private String deliveryCode;	//배송코드	x
	private String deliveryDate;	//배송출발날짜	Now
	private String deliveryReceive;	//배송수령여부	N
	private String deliveryLocation;	//배송현재위치	
	private String deliveryReturn;	//반송해당여부	N
	private String deliveryPerson;	//배송담당자	
	private String ordersCode;	//주문코드	
	private String subOrdersGroup;	//가맹 주문 그룹 코드
	private String headStaffId;	//본사 배송 담당 직원
	private String subCode;	//오더랑 innerjoin을 통해 구할 subCode 오더테이블에있음
	
	public String getDeliveryCode() {
		return deliveryCode;
	}
	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getDeliveryReceive() {
		return deliveryReceive;
	}
	public void setDeliveryReceive(String deliveryReceive) {
		this.deliveryReceive = deliveryReceive;
	}
	public String getDeliveryLocation() {
		return deliveryLocation;
	}
	public void setDeliveryLocation(String deliveryLocation) {
		this.deliveryLocation = deliveryLocation;
	}
	public String getDeliveryReturn() {
		return deliveryReturn;
	}
	public void setDeliveryReturn(String deliveryReturn) {
		this.deliveryReturn = deliveryReturn;
	}
	public String getDeliveryPerson() {
		return deliveryPerson;
	}
	public void setDeliveryPerson(String deliveryPerson) {
		this.deliveryPerson = deliveryPerson;
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
	@Override
	public String toString() {
		return "Delivery [deliveryCode=" + deliveryCode + ", deliveryDate=" + deliveryDate + ", deliveryReceive="
				+ deliveryReceive + ", deliveryLocation=" + deliveryLocation + ", deliveryReturn=" + deliveryReturn
				+ ", deliveryPerson=" + deliveryPerson + ", ordersCode=" + ordersCode + ", subOrdersGroup="
				+ subOrdersGroup + ", headStaffId=" + headStaffId + ", subCode=" + subCode + "]";
	}
	
		
	
	
}
