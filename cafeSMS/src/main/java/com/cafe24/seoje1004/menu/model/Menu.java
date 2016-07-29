package com.cafe24.seoje1004.menu.model;

public class Menu {
	private String menuCode;
	private String menu_name;
	private String menuIngrePrice;
	private String menuSellingPrice;
	private String menuRegitDate;
	private String eventCode;
	private String headStaffId;
	
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenuIngrePrice() {
		return menuIngrePrice;
	}
	public void setMenuIngrePrice(String menuIngrePrice) {
		this.menuIngrePrice = menuIngrePrice;
	}
	public String getMenuSellingPrice() {
		return menuSellingPrice;
	}
	public void setMenuSellingPrice(String menuSellingPrice) {
		this.menuSellingPrice = menuSellingPrice;
	}
	public String getMenuRegitDate() {
		return menuRegitDate;
	}
	public void setMenuRegitDate(String menuRegitDate) {
		this.menuRegitDate = menuRegitDate;
	}
	public String getEventCode() {
		return eventCode;
	}
	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	@Override
	public String toString() {
		return "Menu [menuCode=" + menuCode + ", menu_name=" + menu_name + ", menuIngrePrice=" + menuIngrePrice
				+ ", menuSellingPrice=" + menuSellingPrice + ", menuRegitDate=" + menuRegitDate + ", eventCode="
				+ eventCode + ", headStaffId=" + headStaffId + "]";
	}
	
}
