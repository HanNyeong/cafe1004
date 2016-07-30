package com.cafe24.seoje1004.claim.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.claim.model.Claim;

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
	
}
