package com.cafe24.seoje1004.claim.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.claim.model.Claim;

public interface ClaimDao {
	/**
	 * 최종수정일 2016-07-30 오성현
	 * ClaimDao 인터페이스
	 */
	public List<Claim> headViewClaimList(Map<String,Object> map);		//본사가 전체클래임리스트 조회
}
