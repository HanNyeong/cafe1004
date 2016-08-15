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
	public Map<String,Object> viewClaimContent(String claimCode);	//claimCode에 해당하는 클래임 상세정보출력
	public Claim headAnswerClaimForm(String claimCode);				//해당클레임에 대한 정보를 가져와서 수정해야하므로 해당정보를 가져와주자
	public void headAnswerClaim(Claim claim);			//답변처리 업데이트 하기

	
	public List<Claim> subViewClaimList(String subCode, ClaimSearch claimSearch);	//가맹이 해당점의 클래임리스트 조회
	
	public List<Claim> customerViewClaimList(Claim claim, ClaimSearch claimSearch);	//고객이 자신의 클래임을 조회, 검색 및 정렬기능 추가
	public void customerAddClaim(Claim claim, HttpServletRequest request);	//고객이 클래임 등록을 처리, 파일처리를 위해서 request가져오자
	public void customerDeleteClaim(String claimCode); 		//고객이 클래임 삭제 처리
}
