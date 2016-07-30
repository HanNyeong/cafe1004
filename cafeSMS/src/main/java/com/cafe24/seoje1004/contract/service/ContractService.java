package com.cafe24.seoje1004.contract.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cafe24.seoje1004.contract.model.Contract;
import com.cafe24.seoje1004.contract.model.ContractSearch;

public interface ContractService {
	/**
	 * 최종수정일 2016-07-28 오성현
	 * contractService 인터페이스 생성
	 */
	public List<Contract> subViewContractList(String subCode, ContractSearch contractSearch);	// 가맹에서 계약조회
	public void subAddContract(Contract contract, HttpServletRequest request);	//가맹이 계약등록을 신청
	public int subCodeCheck(String subCode);	//subCode가 있는지 중복체크
	public Map<String,Object> subViewContractContent(String contractCode);	//가맹이 계약상세정보를 리뷰
	public Contract subSelectContract(String contractCode);	//해당 contractCode에 해당하는 계약정보를 재계약 신청폼으로
	public void subAddRecharterContract(Contract contract, HttpServletRequest request);			//재계약 신청 등록 처리
	public void subExpireContract(Contract contract, HttpServletRequest request);	//가맹 계약파기

	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	
	
	public List<Contract> headViewContract(ContractSearch contractSearch);	//본사에서 전체 계약진행 리스트 조회
	public void headApproveContract(String contractCode);	//본사에서 계약 승인처리
	
}
