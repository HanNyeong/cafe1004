package com.cafe24.seoje1004.headItem.model;

public class HeadItem {
	private String hItemCode;
	private String hItemName;
	private String inteCode;
	private int hItemQuantity;
	private String hItemUnit;
	private int hItemSellingPrice;
	private String hItemRegitDate;
	private String headStaffId;
	private int hItemRetailPrice;
	public String gethItemCode() {
		return hItemCode;
	}
	public void sethItemCode(String hItemCode) {
		this.hItemCode = hItemCode;
	}
	public String gethItemName() {
		return hItemName;
	}
	public void sethItemName(String hItemName) {
		this.hItemName = hItemName;
	}
	public String getInteCode() {
		return inteCode;
	}
	public void setInteCode(String inteCode) {
		this.inteCode = inteCode;
	}
	public int gethItemQuantity() {
		return hItemQuantity;
	}
	public void sethItemQuantity(int hItemQuantity) {
		this.hItemQuantity = hItemQuantity;
	}
	public String gethItemUnit() {
		return hItemUnit;
	}
	public void sethItemUnit(String hItemUnit) {
		this.hItemUnit = hItemUnit;
	}
	public int gethItemSellingPrice() {
		return hItemSellingPrice;
	}
	public void sethItemSellingPrice(int hItemSellingPrice) {
		this.hItemSellingPrice = hItemSellingPrice;
	}
	public String gethItemRegitDate() {
		return hItemRegitDate;
	}
	public void sethItemRegitDate(String hItemRegitDate) {
		this.hItemRegitDate = hItemRegitDate;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public int gethItemRetailPrice() {
		return hItemRetailPrice;
	}
	public void sethItemRetailPrice(int hItemRetailPrice) {
		this.hItemRetailPrice = hItemRetailPrice;
	}
	@Override
	public String toString() {
		return "HeadItem [hItemCode=" + hItemCode + ", hItemName=" + hItemName + ", inteCode=" + inteCode
				+ ", hItemQuantity=" + hItemQuantity + ", hItemUnit=" + hItemUnit + ", hItemSellingPrice="
				+ hItemSellingPrice + ", hItemRegitDate=" + hItemRegitDate + ", headStaffId=" + headStaffId
				+ ", hItemRetailPrice=" + hItemRetailPrice + "]";
	}
}
