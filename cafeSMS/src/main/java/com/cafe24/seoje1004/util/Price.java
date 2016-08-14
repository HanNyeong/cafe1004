package com.cafe24.seoje1004.util;

public class Price {
	private Integer subAccountPrice;
	private String subAccountRequestDate;
	
	public Integer getSubAccountPrice() {
		return subAccountPrice;
	}

	public void setSubAccountPrice(Integer subAccountPrice) {
		this.subAccountPrice = subAccountPrice;
	}

	public String getSubAccountRequestDate() {
		return subAccountRequestDate;
	}

	public void setSubAccountRequestDate(String subAccountRequestDate) {
		this.subAccountRequestDate = subAccountRequestDate;
	}

	@Override
	public String toString() {
		return "Price [subAccountPrice=" + subAccountPrice + ", subAccountRequestDate=" + subAccountRequestDate + "]";
	}
}
