package com.cafe24.seoje1004.sub.model;

public class Sub {
	private String subCode;
	private String subRegitDate;
	private String subName;
	private String subKeeper;
	private String subPassword;
	private String subTelephone;
	private String subAddr;
	private String headStaffId;
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getSubRegitDate() {
		return subRegitDate;
	}
	public void setSubRegitDate(String subRegitDate) {
		this.subRegitDate = subRegitDate;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getSubKeeper() {
		return subKeeper;
	}
	public void setSubKeeper(String subKeeper) {
		this.subKeeper = subKeeper;
	}
	public String getSubPassword() {
		return subPassword;
	}
	public void setSubPassword(String subPassword) {
		this.subPassword = subPassword;
	}
	public String getSubTelephone() {
		return subTelephone;
	}
	public void setSubTelephone(String subTelephone) {
		this.subTelephone = subTelephone;
	}
	public String getSubAddr() {
		return subAddr;
	}
	public void setSubAddr(String subAddr) {
		this.subAddr = subAddr;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	@Override
	public String toString() {
		return "Sub [subCode=" + subCode + ", subRegitDate=" + subRegitDate + ", subName=" + subName + ", subKeeper="
				+ subKeeper + ", subPassword=" + subPassword + ", subTelephone=" + subTelephone + ", subAddr=" + subAddr
				+ ", headStaffId=" + headStaffId + "]";
	}

}
