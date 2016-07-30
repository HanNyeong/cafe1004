package com.cafe24.seoje1004.claim.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.claim.model.Claim;
import com.cafe24.seoje1004.claim.model.ClaimSearch;
import com.cafe24.seoje1004.claim.repository.ClaimDao;

/**
 * 최종수정일 2016-07-30 오성현
 * ClaimService
 */

@Service
public class ClaimServiceImpl implements ClaimService {

	@Autowired
	ClaimDao claimDao;
	
	//본사가 전체클래임리스트 조회
	@Override
	public List<Claim> headViewClaimList(ClaimSearch claimSearch) {
		System.out.println("ClaimServiceImpl headViewClaimList 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("claimSearch", claimSearch);
		return claimDao.headViewClaimList(map);
	}
	
}
