package com.cafe24.seoje1004.cart.model;

public class Cart {
	private String cartCode;
	private int cartQuantity;
	private String headItemCode;
	private String subCode;
	public String getCartCode() {
		return cartCode;
	}
	public void setCartCode(String cartCode) {
		this.cartCode = cartCode;
	}
	public int getCartQuantity() {
		return cartQuantity;
	}
	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	public String getHeadItemCode() {
		return headItemCode;
	}
	public void setHeadItemCode(String headItemCode) {
		this.headItemCode = headItemCode;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	@Override
	public String toString() {
		return "Cart [cartCode=" + cartCode + ", cartQuantity=" + cartQuantity + ", headItemCode=" + headItemCode
				+ ", subCode=" + subCode + "]";
	}
	
	
}
