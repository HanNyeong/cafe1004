package com.cafe24.seoje1004.returns.model;

public class AddReturns {
	/**
	 * 2016-08-04 오성현
	 * 환불등록을 위한 객체생성
	 * 
	 */
	private String subStockCode;	//가맹재고코드	(판매여부를 N->Y로 업데이트하기 위해서 필요)
	private int hItemSellingPrice;	//가맹에 파는 가격(반품가격)
	private String totalAccountGroup;	//통합회계 그룹코드
	private String ordersCode;	//주문코드
	private String specificItemCode;	//개별상품코드
	private String subCode;	//가맹대표코드
	
	public String getSubStockCode() {
		return subStockCode;
	}
	public void setSubStockCode(String subStockCode) {
		this.subStockCode = subStockCode;
	}
	public int gethItemSellingPrice() {
		return hItemSellingPrice;
	}
	public void sethItemSellingPrice(int hItemSellingPrice) {
		this.hItemSellingPrice = hItemSellingPrice;
	}
	public String getTotalAccountGroup() {
		return totalAccountGroup;
	}
	public void setTotalAccountGroup(String totalAccountGroup) {
		this.totalAccountGroup = totalAccountGroup;
	}
	public String getOrdersCode() {
		return ordersCode;
	}
	public void setOrdersCode(String ordersCode) {
		this.ordersCode = ordersCode;
	}
	public String getSpecificItemCode() {
		return specificItemCode;
	}
	public void setSpecificItemCode(String specificItemCode) {
		this.specificItemCode = specificItemCode;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	@Override
	public String toString() {
		return "AddReturns [subStockCode=" + subStockCode + ", hItemSellingPrice=" + hItemSellingPrice
				+ ", totalAccountGroup=" + totalAccountGroup + ", ordersCode=" + ordersCode + ", specificItemCode="
				+ specificItemCode + ", subCode=" + subCode + "]";
	}
	
	
	
	/*
	SELECT
	head_item.h_item_selling_price,
	sub_orders.total_account_group,
	sub_stock.orders_code,
	sub_stock.specific_item_code,
	sub_stock.sub_code
		
	FROM	
		sub_stock
	INNER JOIN
		head_item 
	ON 
		sub_stock.head_item_code = head_item.h_item_code
	INNER JOIN
		sub_orders
	ON	
		sub_stock.orders_code = sub_orders.orders_code	
	WHERE
		sub_stock.sub_stock_code = "sub_stock_code1"
		*/
				
}
