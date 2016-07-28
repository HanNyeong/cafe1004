package com.cafe24.seoje1004.contract.service;

import java.util.List;

import com.cafe24.seoje1004.contract.model.Contract;
import com.cafe24.seoje1004.contract.model.ContractSearch;

public interface ContractService {
	/**
	 * 최종수정일 2016-07-28 오성현
	 * contractService 인터페이스 생성
	 */
	public List<Contract> subViewContractList(String subCode, ContractSearch contractSearch);	// 가맹에서 계약조회
	
}
