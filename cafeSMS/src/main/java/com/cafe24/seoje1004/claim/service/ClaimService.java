package com.cafe24.seoje1004.claim.service;

import java.util.List;

import com.cafe24.seoje1004.claim.model.Claim;
import com.cafe24.seoje1004.claim.model.ClaimSearch;

public interface ClaimService {
	/**
	 * 최종수정일 2016-07-30 오성현
	 * ClaimService 인터페이스
	 */
	
	public List<Claim> headViewClaimList(ClaimSearch claimSearch);		//본사가 전체클래임리스트 조회
		
}
