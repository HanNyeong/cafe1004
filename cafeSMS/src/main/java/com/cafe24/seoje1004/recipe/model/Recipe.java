package com.cafe24.seoje1004.recipe.model;

public class Recipe {
	private String recipeCode;
	private int	recipeOrder;
	private String recipeAct;
	private String recipeRegitDate;
	private String menuCode;
	private String headStaffId;
	public String getRecipeCode() {
		return recipeCode;
	}
	public void setRecipeCode(String recipeCode) {
		this.recipeCode = recipeCode;
	}
	public int getRecipeOrder() {
		return recipeOrder;
	}
	public void setRecipeOrder(int recipeOrder) {
		this.recipeOrder = recipeOrder;
	}
	public String getRecipeAct() {
		return recipeAct;
	}
	public void setRecipeAct(String recipeAct) {
		this.recipeAct = recipeAct;
	}
	public String getRecipeRegitDate() {
		return recipeRegitDate;
	}
	public void setRecipeRegitDate(String recipeRegitDate) {
		this.recipeRegitDate = recipeRegitDate;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	@Override
	public String toString() {
		return "Recipe [recipeCode=" + recipeCode + ", recipeOrder=" + recipeOrder + ", recipeAct=" + recipeAct
				+ ", recipeRegitDate=" + recipeRegitDate + ", menuCode=" + menuCode + ", headStaffId=" + headStaffId
				+ "]";
	}
	
}
	
