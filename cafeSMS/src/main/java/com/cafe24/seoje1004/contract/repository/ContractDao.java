package com.cafe24.seoje1004.contract.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.contract.model.Contract;

public interface ContractDao {
	/**
	 * 최종수정일 2016-07-28 오성현
	 * contractDao 인터페이스 생성
	 */
	
	public List<Contract> subViewContractList(Map<String,Object> map);	//가맹의 계약리스트출력
}
