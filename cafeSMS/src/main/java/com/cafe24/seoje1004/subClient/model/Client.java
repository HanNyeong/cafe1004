package com.cafe24.seoje1004.subClient.model;

public class Client {
	private String subClientCode;
	private String subClientName;
	private String subClientRegitDate;
	private String subClientInCharge;
	private String subClientContract;
	private String subClientPhone;
	private String subClientAddr;
	private String totalAccountGroup;	
	private String subCode;
	
	public String getTotalAccountGroup() {
		return totalAccountGroup;
	}
	public void setTotalAccountGroup(String totalAccountGroup) {
		this.totalAccountGroup = totalAccountGroup;
	}
	public String getSubClientCode() {
		return subClientCode;
	}
	public void setSubClientCode(String subClientCode) {
		this.subClientCode = subClientCode;
	}
	public String getSubClientName() {
		return subClientName;
	}
	public void setSubClientName(String subClientName) {
		this.subClientName = subClientName;
	}
	public String getSubClientRegitDate() {
		return subClientRegitDate;
	}
	public void setSubClientRegitDate(String subClientRegitDate) {
		this.subClientRegitDate = subClientRegitDate;
	}
	
	public String getSubClientInCharge() {
		return subClientInCharge;
	}
	public void setSubClientInCharge(String subClientInCharge) {
		this.subClientInCharge = subClientInCharge;
	}
	public String getSubClientContract() {
		return subClientContract;
	}
	public void setSubClientContract(String subClientContract) {
		this.subClientContract = subClientContract;
	}
	public String getSubClientPhone() {
		return subClientPhone;
	}
	public void setSubClientPhone(String subClientPhone) {
		this.subClientPhone = subClientPhone;
	}
	public String getSubClientAddr() {
		return subClientAddr;
	}
	public void setSubClientAddr(String subClientAddr) {
		this.subClientAddr = subClientAddr;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	
	@Override
	public String toString() {
		return "Client [subClientCode=" + subClientCode + ", subClientName=" + subClientName + ", subClientRegitDate="
				+ subClientRegitDate + ", subClientInCharge=" + subClientInCharge + ", subClientContract="
				+ subClientContract + ", subClientPhone=" + subClientPhone + ", subClientAddr=" + subClientAddr
				+ ", totalAccountGroup=" + totalAccountGroup + ", subCode=" + subCode + "]";
	}
	
}
