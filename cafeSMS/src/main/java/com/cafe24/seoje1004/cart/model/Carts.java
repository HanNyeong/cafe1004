package com.cafe24.seoje1004.cart.model;

import java.util.List;

public class Carts {
	private List<String> cartCode;
	private List<Integer> cartQuantity;
	private List<String> hItemCode;
	private List<String> subCode;
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
	@Override
	public String toString() {
		return "Carts [cartCode=" + cartCode + ", cartQuantity=" + cartQuantity + ", hItemCode=" + hItemCode
				+ ", subCode=" + subCode + "]";
	}
	

	
			
}
