package com.cafe24.seoje1004.contract.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.contract.model.Contract;
import com.cafe24.seoje1004.contract.model.ContractSearch;
import com.cafe24.seoje1004.contract.repository.ContractDao;

/**
 * 최종수정일 2016-07-28 오성현
 * contractService 생성
 */


@Service
public class ContractServiceImpl implements ContractService {
	
	@Autowired
	ContractDao contractDao;
	
	
	//가맹점이 해당가맹점의 계약리스트를 리뷰
	@Override
	public List<Contract> subViewContractList(String subCode, ContractSearch contractSearch) {
			System.out.println("ContractServiceImpl subViewContractList실행");
			
			//맵안에 검색 및 컬럼정렬 정보와 subCode를 담아주자
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("subCode", subCode);
			map.put("contractSearch", contractSearch);
			
			
		return contractDao.subViewContractList(map);
	}

}
