package com.cafe24.seoje1004.subStock.model;

import java.util.List;

public class SubStocks {
	
	private List<String> subCode;
	private List<String> subStockCode;
	private List<String> ordersCode;
	private List<String> specificItemCode;
	
	public List<String> getSubCode() {
		return subCode;
	}
	public void setSubCode(List<String> subCode) {
		this.subCode = subCode;
	}
	public List<String> getSubStockCode() {
		return subStockCode;
	}
	public void setSubStockCode(List<String> subStockCode) {
		this.subStockCode = subStockCode;
	}
	public List<String> getOrdersCode() {
		return ordersCode;
	}
	public void setOrdersCode(List<String> ordersCode) {
		this.ordersCode = ordersCode;
	}
	public List<String> getSpecificItemCode() {
		return specificItemCode;
	}
	public void setSpecificItemCode(List<String> specificItemCode) {
		this.specificItemCode = specificItemCode;
	}
	
	@Override
	public String toString() {
		return "SubStocks [subCode=" + subCode + ", subStockCode=" + subStockCode + ", ordersCode=" + ordersCode
				+ ", specificItemCode=" + specificItemCode + "]";
	}
	
	
}
