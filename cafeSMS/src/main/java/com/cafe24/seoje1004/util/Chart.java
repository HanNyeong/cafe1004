package com.cafe24.seoje1004.util;

public class Chart {
	private String menuName;
	private int counts;
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	@Override
	public String toString() {
		return "Chart [menuName=" + menuName + ", counts=" + counts + "]";
	}
	

}
