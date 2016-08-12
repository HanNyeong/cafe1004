package com.cafe24.seoje1004.subSell.model;

import java.util.List;

public class SubSellGroup {

	private List<Integer> quantity;
	private List<Integer> menuIngrePrice;
	private List<Double> menuSellingPrice;
	private List<Double> soonPrice;
	private List<String> eventCode;
	private List<String> menuCode;
	private List<String> subCode;
	
	private String payMethod;
//	

	public List<Integer> getQuantity() {
		return quantity;
	}

	public void setQuantity(List<Integer> quantity) {
		this.quantity = quantity;
	}

	public List<Integer> getMenuIngrePrice() {
		return menuIngrePrice;
	}

	public void setMenuIngrePrice(List<Integer> menuIngrePrice) {
		this.menuIngrePrice = menuIngrePrice;
	}

	public List<Double> getMenuSellingPrice() {
		return menuSellingPrice;
	}

	public void setMenuSellingPrice(List<Double> menuSellingPrice) {
		this.menuSellingPrice = menuSellingPrice;
	}

	public List<Double> getSoonPrice() {
		return soonPrice;
	}

	public void setSoonPrice(List<Double> soonPrice) {
		this.soonPrice = soonPrice;
	}

	public List<String> getEventCode() {
		return eventCode;
	}

	public void setEventCode(List<String> eventCode) {
		this.eventCode = eventCode;
	}

	public List<String> getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(List<String> menuCode) {
		this.menuCode = menuCode;
	}

	public List<String> getSubCode() {
		return subCode;
	}

	public void setSubCode(List<String> subCode) {
		this.subCode = subCode;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	@Override
	public String toString() {
		return "SubSellGroup [quantity=" + quantity + ", menuIngrePrice=" + menuIngrePrice + ", menuSellingPrice="
				+ menuSellingPrice + ", soonPrice=" + soonPrice + ", eventCode=" + eventCode + ", menuCode=" + menuCode
				+ ", subCode=" + subCode + ", payMethod=" + payMethod + "]";
	}
	
}
