package com.cafe24.seoje1004.contract.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.contract.model.Contract;
import com.cafe24.seoje1004.contract.model.ContractFile;

public interface ContractDao {
	/**
	 * 최종수정일 2016-07-28 오성현
	 * contractDao 인터페이스 생성
	 */
	
	public List<Contract> subViewContractList(Map<String,Object> map);	//가맹의 계약리스트출력
	public void subAddContract(Contract contract);	//가맹이 계약등록을 신청
	public int subCodeCheck(String subCode);	//subCode가 중복인지 체크
	public ContractFile selectContractFileByRandomName(String randomName);	//랜덤네임 중복확인
	public void subAddContractFile(ContractFile contractFile);	//계약파일정보 등록
	public Contract subViewContractContent(String contractCode);	//가맹이 계약상세정보를 리뷰
	public List<ContractFile> subViewContractFile(String contractCode);	//가맹의 파일리리스트리뷰
	public List<ContractFile> subViewContractExpireFile(String contractCode);	//가맹의 파기사유서파일리스트 리뷰
	public Contract subSelectContract(String contractCode);	//해당 contractCode에 해당하는 계약정보를 재계약 신청폼으로
	public void subAddRecharterContract(Contract contract); 	//재계약 신청 등록 처리
	public void subUpdatePreContract(String contractCode);		//이전계약 상태 Y로 update	
	public void expireContract(Contract contract);	//파기일 업데이트
	public void subAddContractExpireFile(ContractFile contractFile);	//파기사유서 파일 업로드
	

	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	
	
	public List<Contract> headViewContract(Map<String,Object> map);			//본사에서 전체 계약진행 리스트 조회
	public void headApproveContract(String contractCode);	//본사에서 계약 승인처리
	
}
