package com.cafe24.seoje1004.contract.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.contract.model.Contract;
/**
 * 최종수정일 2016-07-28 오성현
 * contractDao 생성
 */
@Repository
public class ContractDaoImpl implements ContractDao {
	private final String NS ="com.cafe24.seoje1004.contract.repository.ContractMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionContract;
	
	//가맹점이 해당가맹점의 계약리스트를 리뷰
	@Override
	public List<Contract> subViewContractList(Map<String, Object> map) {
		System.out.println("ContractDaoImpl subViewContractList실행");
		return sqlSessionContract.selectList(NS+".subViewContractList", map);	
	}
	
}
