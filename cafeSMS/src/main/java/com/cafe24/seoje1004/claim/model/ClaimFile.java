package com.cafe24.seoje1004.claim.model;


/**
 * 최종수정일 2016-07-30 오성현
 * ClaimFile 객체
 */

public class ClaimFile {
	
	private String claimFileCode;		//클래임파일코드
	private String claimCode;			//클래임코드
	private String claimFile;			//파일경로+파일랜덤이름+확장자
	private String fileName;			//원본파일이름+확장자
	private String randomName;			//랜덤이름(실제저장될이름)
	
	public String getClaimFileCode() {
		return claimFileCode;
	}
	public void setClaimFileCode(String claimFileCode) {
		this.claimFileCode = claimFileCode;
	}
	public String getClaimCode() {
		return claimCode;
	}
	public void setClaimCode(String claimCode) {
		this.claimCode = claimCode;
	}
	public String getClaimFile() {
		return claimFile;
	}
	public void setClaimFile(String claimFile) {
		this.claimFile = claimFile;
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
		return "ClaimFile [claimFileCode=" + claimFileCode + ", claimCode=" + claimCode + ", claimFile=" + claimFile
				+ ", fileName=" + fileName + ", randomName=" + randomName + "]";
	}
	
	
	
	
}
