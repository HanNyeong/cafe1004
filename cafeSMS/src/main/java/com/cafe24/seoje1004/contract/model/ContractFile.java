package com.cafe24.seoje1004.contract.model;

public class ContractFile {
	/**
	 * 최종수정일 2016-07-28 오성현
	 * contractFile 객체 생성
	 */
	
	private String contractFileCode;	//파일코드넘버
	private String contractCode;		//계약코드
	private String contractFile;		//파일경로+파일랜덤이름+확장자
	private String fileName;			//원본파일이름+확장자
	private String randomName;			//랜덤이름(실제저장될이름)
	private String fileStatus;			//파기파일사유서 인지여부 ( 기본값은 N이고 파기파일 업로드시 Y로 업데이트할것)
	
	public String getContractFileCode() {
		return contractFileCode;
	}
	public void setContractFileCode(String contractFileCode) {
		this.contractFileCode = contractFileCode;
	}
	public String getContractCode() {
		return contractCode;
	}
	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	public String getContractFile() {
		return contractFile;
	}
	public void setContractFile(String contractFile) {
		this.contractFile = contractFile;
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
	public String getFileStatus() {
		return fileStatus;
	}
	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}
	@Override
	public String toString() {
		return "contractFile [contractFileCode=" + contractFileCode + ", contractCode=" + contractCode
				+ ", contractFile=" + contractFile + ", fileName=" + fileName + ", randomName=" + randomName
				+ ", fileStatus=" + fileStatus + "]";
	}
	
	
}
