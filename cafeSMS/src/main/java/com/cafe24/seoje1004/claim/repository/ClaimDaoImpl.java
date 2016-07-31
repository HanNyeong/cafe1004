package com.cafe24.seoje1004.claim.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.claim.model.Claim;
import com.cafe24.seoje1004.claim.model.ClaimFile;

/**
 * 최종수정일 2016-07-30 오성현
 * ClaimDao
 */

@Repository
public class ClaimDaoImpl implements ClaimDao {
	
	private final String NS ="com.cafe24.seoje1004.claim.repository.ClaimMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionClaim;
	                           
	
	
	//본사가 전체클래임리스트 조회
	@Override
	public List<Claim> headViewClaimList(Map<String,Object> map) {
		System.out.println("ClaimDaoImpl headViewClaimList실행");
		return sqlSessionClaim.selectList(NS+".headViewClaimList", map);
	}


	//claimCode에 해당하는 클래임 상세정보출력
	@Override
	public Claim viewClaimContent(String claimCode) {
		System.out.println("ClaimDaoImpl viewClaimContent 실행");
		return sqlSessionClaim.selectOne(NS+".viewClaimContent", claimCode);
	}

	//해당클래임의 파일리스트
	@Override
	public List<ClaimFile> viewClaimFile(String claimCode) {
		System.out.println("ClaimDaoImpl viewClaimFile 실행");
		return sqlSessionClaim.selectList(NS+".viewClaimFile", claimCode);
	}

	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	
	
	//고객이 자신의 클래임을 조회
	@Override
	public List<Claim> customerViewClaimList(Map<String,Object> map) {
		System.out.println("ClaimDaoImpl customerViewClaimList 실행");
		System.out.println("map : "+map);
		return sqlSessionClaim.selectList(NS+".customerViewClaimList", map);
	}
	
}
