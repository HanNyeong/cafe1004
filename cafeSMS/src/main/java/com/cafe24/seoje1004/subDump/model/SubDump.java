package com.cafe24.seoje1004.subDump.model;

public class SubDump {
	private String subDumpCode;
	private String subDumpReason;
	private String subDumpDate;
	private String headItemCode;
	private String specificItemCode;
	private String subStaffCode;
	private String subCode;
	private String subStockCode;
	public String getSubDumpCode() {
		return subDumpCode;
	}
	public void setSubDumpCode(String subDumpCode) {
		this.subDumpCode = subDumpCode;
	}
	public String getSubDumpReason() {
		return subDumpReason;
	}
	public void setSubDumpReason(String subDumpReason) {
		this.subDumpReason = subDumpReason;
	}
	public String getSubDumpDate() {
		return subDumpDate;
	}
	public void setSubDumpDate(String subDumpDate) {
		this.subDumpDate = subDumpDate;
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
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getSubStockCode() {
		return subStockCode;
	}
	public void setSubStockCode(String subStockCode) {
		this.subStockCode = subStockCode;
	}
	@Override
	public String toString() {
		return "SubDump [subDumpCode=" + subDumpCode + ", subDumpReason=" + subDumpReason + ", subDumpDate="
				+ subDumpDate + ", headItemCode=" + headItemCode + ", specificItemCode=" + specificItemCode
				+ ", subStaffCode=" + subStaffCode + ", subCode=" + subCode + ", subStockCode=" + subStockCode + "]";
	}
	
	
	
}
