package com.cafe24.seoje1004.claim.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cafe24.seoje1004.claim.model.Claim;
import com.cafe24.seoje1004.claim.model.ClaimSearch;

public interface ClaimService {
	/**
	 * 최종수정일 2016-07-30 오성현
	 * ClaimService 인터페이스
	 */
	
	public List<Claim> headViewClaimList(ClaimSearch claimSearch);		//본사가 전체클래임리스트 조회
	public Map<String,Object> viewClaimContent(String ClaimCode);	//claimCode에 해당하는 클래임 상세정보출력
	

	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	
	
	
	public List<Claim> customerViewClaimList(Claim claim, ClaimSearch claimSearch);	//고객이 자신의 클래임을 조회, 검색 및 정렬기능 추가
	public void customerAddClaim(Claim claim, HttpServletRequest request);	//고객이 클래임 등록을 처리, 파일처리를 위해서 request가져오자
	public void customerDeleteClaim(String claimCode); 		//고객이 클래임 삭제 처리
}
