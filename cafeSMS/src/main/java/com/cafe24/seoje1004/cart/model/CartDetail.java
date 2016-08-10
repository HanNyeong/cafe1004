package com.cafe24.seoje1004.cart.model;


public class CartDetail {
	private String cartCode;
	private Integer cartQuantity;
	private String hItemCode;
	private String subCode;
	private String hItemName;
	private Integer hItemSellingPrice;
	private Integer subOrdersPrice;
	
	public Integer getSubOrdersPrice() {
		return subOrdersPrice;
	}
	public void setSubOrdersPrice(Integer subOrdersPrice) {
		this.subOrdersPrice = subOrdersPrice;
	}
	
	public String getCartCode() {
		return cartCode;
	}
	
	public void setCartCode(String cartCode) {
		this.cartCode = cartCode;
	}
	
	public int getCartQuantity() {
		return cartQuantity;
	}
	
	public void setCartQuantity(Integer cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	
	public String gethItemCode() {
		return hItemCode;
	}
	public void sethItemCode(String hItemCode) {
		this.hItemCode = hItemCode;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String gethItemName() {
		return hItemName;
	}
	public void sethItemName(String hItemName) {
		this.hItemName = hItemName;
	}
	public Integer gethItemSellingPrice() {
		return hItemSellingPrice;
	}
	public void sethItemSellingPrice(Integer hItemSellingPrice) {
		this.hItemSellingPrice = hItemSellingPrice;
	}
	@Override
	public String toString() {
		return "CartDetail [cartCode=" + cartCode + ", cartQuantity=" + cartQuantity + ", hItemCode=" + hItemCode
				+ ", subCode=" + subCode + ", hItemName=" + hItemName + ", hItemSellingPrice=" + hItemSellingPrice
				+ "]";
	}
	
	
}
