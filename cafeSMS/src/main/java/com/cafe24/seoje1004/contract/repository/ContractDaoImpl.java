package com.cafe24.seoje1004.contract.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.contract.model.Contract;
import com.cafe24.seoje1004.contract.model.ContractFile;
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

	//가맹이 계약등록을 신청
	@Override
	public void subAddContract(Contract contract) {
		System.out.println("ContractDaoImpl subAddContract실행");
		
		sqlSessionContract.insert(NS+".subAddContract", contract);
		
		
	}

	//subCode가 중복인지 체크
	@Override
	public int subCodeCheck(String subCode) {
		System.out.println("ContractDaoImpl subCodeCheck실행");
		System.out.println("subCode : "+subCode);
		int result = 0;
		List<Contract> list = sqlSessionContract.selectList(NS+".subCodeCheck",subCode);
		
		//해당하는 subcode가 존재한다면 result에 1대입
		if(list.get(0).getContractCode() != null){
			System.out.println("list.get(0).getContractCode() : "+list.get(0).getContractCode());
			result = 1;
		}
		System.out.println("result : " + result);
		
		return result;
	}
	
	//랜덤네임 중복확인 
	@Override
	public ContractFile selectContractFileByRandomName(String randomName) {
		System.out.println("ContractDaoImpl selectContractFileByRandomName 실행");
		return sqlSessionContract.selectOne(NS+".selectContractFileByRandomName", randomName);
	}
	
	//계약파일정보 등록
	@Override
	public void subAddContractFile(ContractFile contractFile) {
		System.out.println("ContractDaoImpl subAddContractFile 실행");
		sqlSessionContract.insert(NS+".subAddContractFile", contractFile);
	}
	
	//가맹이 계약상세정보를 리뷰
	@Override
	public Contract subViewContractContent(String contractCode) {
		System.out.println("ContractDaoImpl subViewContractContent 실행");
		
		return sqlSessionContract.selectOne(NS+".subViewContractContent", contractCode);
	}
	
	//가맹의 파일리리스트리뷰
	@Override
	public List<ContractFile> subViewContractFile(String contractCode) {
		System.out.println("ContractDaoImpl subViewContractFile 실행");
		
		return sqlSessionContract.selectList(NS+".subViewContractFile", contractCode);
	}
	
	//가맹의 파기사유서파일리스트 리뷰
	@Override
	public List<ContractFile> subViewContractExpireFile(String contractCode) {
		System.out.println("ContractDaoImpl subViewContractExpireFile 실행");
		return sqlSessionContract.selectList(NS+".subViewContractExpireFile", contractCode);
	}
	
	//해당 contractCode에 해당하는 계약정보를 재계약 신청폼으로
	@Override
	public Contract subSelectContract(String contractCode) {
		System.out.println("ContractDaoImpl subSelectContract 실행");
		return sqlSessionContract.selectOne(NS+".subSelectContract", contractCode);
	}

	//재계약 신청 등록 처리
	@Override
	public void subAddRecharterContract(Contract contract) {
		System.out.println("ContractDaoImpl subAddRecharterContract 실행");
		sqlSessionContract.insert(NS+".subAddRecharterContract", contract);
	}
	
	//이전계약 상태 Y로 update
	@Override
	public void subUpdatePreContract(String contractCode) {
		System.out.println("ContractDaoImpl subUpdatePreContract 실행");
		sqlSessionContract.update(NS+".subUpdatePreContract", contractCode);
	}

	//파기일 업데이트	
	@Override
	public void expireContract(Contract contract) {
		System.out.println("ContractDaoImpl expireContract 실행");
		sqlSessionContract.update(NS+".expireContract", contract);
	}

	//파기사유서 파일 업로드
	@Override
	public void subAddContractExpireFile(ContractFile contractFile) {
		System.out.println("ContractDaoImpl subAddContractExpireFile 실행");
		sqlSessionContract.insert(NS+".subAddContractExpireFile", contractFile);
	}
	
}
