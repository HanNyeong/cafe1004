package com.cafe24.seoje1004.claim.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.claim.model.Claim;
import com.cafe24.seoje1004.claim.model.ClaimFile;
import com.cafe24.seoje1004.claim.model.ClaimSearch;

public interface ClaimDao {
	/**
	 * 최종수정일 2016-07-30 오성현
	 * ClaimDao 인터페이스
	 */
	public List<Claim> headViewClaimList(Map<String,Object> map);		//본사가 전체클래임리스트 조회
	public Claim viewClaimContent(String claimCode);	//claimCode에 해당하는 클래임 상세정보출력
	public List<ClaimFile> viewClaimFile(String claimCode);	//해당클래임의 파일리스트
	public Claim headAnswerClaimForm(String claimCode);	//해당클레임에 대한 정보를 가져와서 수정해야하므로 해당정보를 가져와주자
	public void headAnswerClaim(Claim claim);			//답변처리 업데이트 하기
	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	
	public List<Claim> subViewClaimList(Map<String,Object> map);		//가맹이 해당점의 클래임리스트 조회
	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	
	public List<Claim> customerViewClaimList(Map<String,Object> map);	//고객이 자신의 클래임을 조회
	public void customerAddClaim(Claim claim);		//고객이 클래임 등록을 처리
	public ClaimFile selectClaimFileByRandomName(String randomName);		//랜덤네임이 중복되는 이름이 있으면 다시 새로운 랜덤네임으로 저장	
	public void customerAddClaimFile(ClaimFile claimFile);						//고객이 클래임 파일을 등록
	public void customerDeleteClaim(String claimCode);		//고객이 클래임 삭제처리
	public void customerDeleteClaimFile(String claimCode);		//고객이 해당클래임에 관련된 파일 삭제처리
	
	
	
	
}			
