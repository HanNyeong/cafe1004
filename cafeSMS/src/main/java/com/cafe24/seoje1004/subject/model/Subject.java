package com.cafe24.seoje1004.subject.model;

public class Subject {
	private String subjectCode;
	private String subjectName;
	private String subjectContent;
	private String subjectRegitDate;
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getSubjectContent() {
		return subjectContent;
	}
	public void setSubjectContent(String subjectContent) {
		this.subjectContent = subjectContent;
	}
	public String getSubjectRegitDate() {
		return subjectRegitDate;
	}
	public void setSubjectRegitDate(String subjectRegitDate) {
		this.subjectRegitDate = subjectRegitDate;
	}
	@Override
	public String toString() {
		return "Subject [subjectCode=" + subjectCode + ", subjectName=" + subjectName + ", subjectContent="
				+ subjectContent + ", subjectRegitDate=" + subjectRegitDate + "]";
	}
	
}
