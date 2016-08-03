package com.cafe24.seoje1004.returns.model;

public class ReturnsFile {
	/**
	 * 2016-08-02 오성현
	 * ReturnsFile 객체 생성
	 */
	private String returnFileCode;	//반품파일코드
	private String returnCode;	//반품코드
	private String returnFile;	//반품파일
	private String fileName;	//반품파일이름
	private String randomName;	//랜덤이름
	
	public String getReturnFileCode() {
		return returnFileCode;
	}
	public void setReturnFileCode(String returnFileCode) {
		this.returnFileCode = returnFileCode;
	}
	public String getReturnCode() {
		return returnCode;
	}
	public void setReturnCode(String returnCode) {
		this.returnCode = returnCode;
	}
	public String getReturnFile() {
		return returnFile;
	}
	public void setReturnFile(String returnFile) {
		this.returnFile = returnFile;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getRandomName() {
		return randomName;
	}
	public void setRandomName(String randomName) {
		this.randomName = randomName;
	}
	@Override
	public String toString() {
		return "ReturnsFile [returnFileCode=" + returnFileCode + ", returnCode=" + returnCode + ", returnFile="
				+ returnFile + ", fileName=" + fileName + ", randomName=" + randomName + "]";
	}
	
	
	
}
