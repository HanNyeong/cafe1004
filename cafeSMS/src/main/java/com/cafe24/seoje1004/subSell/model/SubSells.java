package com.cafe24.seoje1004.subSell.model;

import java.util.List;

public class SubSells {
	private List<String> subSellCode;
	private List<String> subCode;
	
	public List<String> getSubSellCode() {
		return subSellCode;
	}
	public void setSubSellCode(List<String> subSellCode) {
		this.subSellCode = subSellCode;
	}
	public List<String> getSubCode() {
		return subCode;
	}
	public void setSubCode(List<String> subCode) {
		this.subCode = subCode;
	}
	@Override
	public String toString() {
		return "SubSells [subSellCode=" + subSellCode + ", subCode=" + subCode + "]";
	}
	
	

}
