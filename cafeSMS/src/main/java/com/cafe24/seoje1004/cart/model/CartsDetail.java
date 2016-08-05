package com.cafe24.seoje1004.cart.model;

import java.util.List;

public class CartsDetail {
	private List<String> cartCode;
	private List<Integer> cartQuantity;
	private List<String> hItemCode;
	private List<String> subCode;
	private List<String> hItemName;
	private List<String> hItemSellingPrice;
	public List<String> getCartCode() {
		return cartCode;
	}
	public void setCartCode(List<String> cartCode) {
		this.cartCode = cartCode;
	}
	public List<Integer> getCartQuantity() {
		return cartQuantity;
	}
	public void setCartQuantity(List<Integer> cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	public List<String> gethItemCode() {
		return hItemCode;
	}
	public void sethItemCode(List<String> hItemCode) {
		this.hItemCode = hItemCode;
	}
	public List<String> getSubCode() {
		return subCode;
	}
	public void setSubCode(List<String> subCode) {
		this.subCode = subCode;
	}
	public List<String> gethItemName() {
		return hItemName;
	}
	public void sethItemName(List<String> hItemName) {
		this.hItemName = hItemName;
	}
	public List<String> gethItemSellingPrice() {
		return hItemSellingPrice;
	}
	public void sethItemSellingPrice(List<String> hItemSellingPrice) {
		this.hItemSellingPrice = hItemSellingPrice;
	}
	@Override
	public String toString() {
		return "CartDetail [cartCode=" + cartCode + ", cartQuantity=" + cartQuantity + ", hItemCode=" + hItemCode
				+ ", subCode=" + subCode + ", hItemName=" + hItemName + ", hItemSellingPrice=" + hItemSellingPrice
				+ "]";
	}
	
	
}
