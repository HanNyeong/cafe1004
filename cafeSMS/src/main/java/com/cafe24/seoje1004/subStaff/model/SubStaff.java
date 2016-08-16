package com.cafe24.seoje1004.subStaff.model;

import java.util.Date;

public class SubStaff {


private String subStaffCode;
private String subStaffPw;
private String subStaffName;
private String subStaffLevel;
private String subStaffJoin;
private String subStaffResign;
private String subStaffRegitDate;
private int subStaffSalary;
private String totalAccountGroup;
private String subStaffPermitDate;
private String subCode;
private String headStaffId;
private String subFinalSalaryDate;
private int diffDate;

public String getSubStaffCode() {
	return subStaffCode;
}
public void setSubStaffCode(String subStaffCode) {
	this.subStaffCode = subStaffCode;
}
public String getSubStaffPw() {
	return subStaffPw;
}
public void setSubStaffPw(String subStaffPw) {
	this.subStaffPw = subStaffPw;
}
public String getSubStaffName() {
	return subStaffName;
}
public void setSubStaffName(String subStaffName) {
	this.subStaffName = subStaffName;
}
public String getSubStaffLevel() {
	return subStaffLevel;
}
public void setSubStaffLevel(String subStaffLevel) {
	this.subStaffLevel = subStaffLevel;
}
public String getSubStaffJoin() {
	return subStaffJoin;
}
public void setSubStaffJoin(String subStaffJoin) {
	this.subStaffJoin = subStaffJoin;
}
public String getSubStaffResign() {
	return subStaffResign;
}
public void setSubStaffResign(String subStaffResign) {
	this.subStaffResign = subStaffResign;
}
public String getSubStaffRegitDate() {
	return subStaffRegitDate;
}
public void setSubStaffRegitDate(String subStaffRegitDate) {
	this.subStaffRegitDate = subStaffRegitDate;
}
public int getSubStaffSalary() {
	return subStaffSalary;
}
public void setSubStaffSalary(int subStaffSalary) {
	this.subStaffSalary = subStaffSalary;
}
public String getTotalAccountGroup() {
	return totalAccountGroup;
}
public void setTotalAccountGroup(String totalAccountGroup) {
	this.totalAccountGroup = totalAccountGroup;
}
public String getSubStaffPermitDate() {
	return subStaffPermitDate;
}
public void setSubStaffPermitDate(String subStaffPermitDate) {
	this.subStaffPermitDate = subStaffPermitDate;
}
public String getSubCode() {
	return subCode;
}
public void setSubCode(String subCode) {
	this.subCode = subCode;
}
public String getHeadStaffId() {
	return headStaffId;
}
public void setHeadStaffId(String headStaffId) {
	this.headStaffId = headStaffId;
}
public String getSubFinalSalaryDate() {
	return subFinalSalaryDate;
}
public void setSubFinalSalaryDate(String subFinalSalaryDate) {
	this.subFinalSalaryDate = subFinalSalaryDate;
}
public int getDiffDate() {
	return diffDate;
}
public void setDiffDate(int diffDate) {
	this.diffDate = diffDate;
}
@Override
public String toString() {
	return "SubStaff [subStaffCode=" + subStaffCode + ", subStaffPw=" + subStaffPw + ", subStaffName=" + subStaffName
			+ ", subStaffLevel=" + subStaffLevel + ", subStaffJoin=" + subStaffJoin + ", subStaffResign="
			+ subStaffResign + ", subStaffRegitDate=" + subStaffRegitDate + ", subStaffSalary=" + subStaffSalary
			+ ", totalAccountGroup=" + totalAccountGroup + ", subStaffPermitDate=" + subStaffPermitDate + ", subCode="
			+ subCode + ", headStaffId=" + headStaffId + ", subFinalSalaryDate=" + subFinalSalaryDate + ", diffDate="
			+ diffDate + "]";
}



}
