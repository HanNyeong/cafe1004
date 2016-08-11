package com.cafe24.seoje1004.subSell.model;

public class SubSell {
	/**
	 * 최종수정일 2016-08-08 오성현
	 * SubSell객체 생성
	 */
	
	private String subSellCode;		//가맹판매코드
	private String menuCode;		//상품메뉴통합코드
	private	String subSellGroup;	//가맹판매그룹코드
	private String subSellDate;		//판매날짜
	private int	subSellPracticalSellingPrice;	//실제 판매 금액
	private	String totalAccountGroup;	//통합회계 그룹코드
	private String subSellFinal;	//마감유무
	private String subSellFinalDate;	//마감일자
	private String payMethod;		//결제방식
	private String subCode;		//가맹대표코드
	private String eventCode;	//행사코드
	private String subStaffCode;	//판매담당직원아이디
	private String subSellFinalStaff;	//마감담당자아이디
	private int subSellCost;		//원가
	
	public String getSubSellCode() {
		return subSellCode;
	}
	public void setSubSellCode(String subSellCode) {
		this.subSellCode = subSellCode;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getSubSellGroup() {
		return subSellGroup;
	}
	public void setSubSellGroup(String subSellGroup) {
		this.subSellGroup = subSellGroup;
	}
	public String getSubSellDate() {
		return subSellDate;
	}
	public void setSubSellDate(String subSellDate) {
		this.subSellDate = subSellDate;
	}
	public int getSubSellPracticalSellingPrice() {
		return subSellPracticalSellingPrice;
	}
	public void setSubSellPracticalSellingPrice(int subSellPracticalSellingPrice) {
		this.subSellPracticalSellingPrice = subSellPracticalSellingPrice;
	}
	public String getTotalAccountGroup() {
		return totalAccountGroup;
	}
	public void setTotalAccountGroup(String totalAccountGroup) {
		this.totalAccountGroup = totalAccountGroup;
	}
	public String getSubSellFinal() {
		return subSellFinal;
	}
	public void setSubSellFinal(String subSellFinal) {
		this.subSellFinal = subSellFinal;
	}
	public String getSubSellFinalDate() {
		return subSellFinalDate;
	}
	public void setSubSellFinalDate(String subSellFinalDate) {
		this.subSellFinalDate = subSellFinalDate;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getEventCode() {
		return eventCode;
	}
	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}
	public String getSubStaffCode() {
		return subStaffCode;
	}
	public void setSubStaffCode(String subStaffCode) {
		this.subStaffCode = subStaffCode;
	}
	public String getSubSellFinalStaff() {
		return subSellFinalStaff;
	}
	public void setSubSellFinalStaff(String subSellFinalStaff) {
		this.subSellFinalStaff = subSellFinalStaff;
	}
	public int getSubSellCost() {
		return subSellCost;
	}
	public void setSubSellCost(int subSellCost) {
		this.subSellCost = subSellCost;
	}
	@Override
	public String toString() {
		return "SubSell [subSellCode=" + subSellCode + ", menuCode=" + menuCode + ", subSellGroup=" + subSellGroup
				+ ", subSellDate=" + subSellDate + ", subSellPracticalSellingPrice=" + subSellPracticalSellingPrice
				+ ", totalAccountGroup=" + totalAccountGroup + ", subSellFinal=" + subSellFinal + ", subSellFinalDate="
				+ subSellFinalDate + ", payMethod=" + payMethod + ", subCode=" + subCode + ", eventCode=" + eventCode
				+ ", subStaffCode=" + subStaffCode + ", subSellFinalStaff=" + subSellFinalStaff + ", subSellCost="
				+ subSellCost + "]";
	}
	
	
	
	
}
