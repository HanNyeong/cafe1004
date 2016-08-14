package com.cafe24.seoje1004.util;

public class Price {
	private int subAccountPrice;
	private String subAccountRequestDate;
	
	public int getSubAccountPrice() {
		return subAccountPrice;
	}

	public void setSubAccountPrice(int subAccountPrice) {
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
