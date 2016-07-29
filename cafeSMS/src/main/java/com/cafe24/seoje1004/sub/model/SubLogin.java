package com.cafe24.seoje1004.sub.model;

public class SubLogin {
	private String subCode;
	private String subName;
	private String subKeeper;
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
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
	@Override
	public String toString() {
		return "SubLogin [subCode=" + subCode + ", subName=" + subName + ", subKeeper=" + subKeeper + "]";
	}
	
}
