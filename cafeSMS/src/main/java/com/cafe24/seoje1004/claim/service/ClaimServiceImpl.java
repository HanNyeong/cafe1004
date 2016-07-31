package com.cafe24.seoje1004.claim.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.claim.model.Claim;
import com.cafe24.seoje1004.claim.model.ClaimFile;
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

	//claimCode에 해당하는 클래임 상세정보출력
	@Override
	public Map<String, Object> viewClaimContent(String claimCode) {
		System.out.println("ClaimServiceImpl viewClaimContent");
		//1.클래임 상세정보  
		Claim claimContent = claimDao.viewClaimContent(claimCode);
		
		//2.해당클래임의 파일리스트
		List<ClaimFile>	claimFile = claimDao.viewClaimFile(claimCode);
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("claimContent", claimContent);
		map.put("claimFile", claimFile);
		return map;
	}


	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	
	
	
	
	//고객이 자신의 클래임을 조회
	@Override
	public List<Claim> customerViewClaimList(Claim claim,ClaimSearch claimSearch) {
		System.out.println("ClaimServiceImpl customerViewClaimList");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("claim", claim);
		map.put("claimSearch", claimSearch);
		System.out.println("map : "+map);
		return claimDao.customerViewClaimList(map);
	}
	
}
