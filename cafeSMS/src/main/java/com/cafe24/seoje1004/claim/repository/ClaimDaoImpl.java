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
	
	//해당클레임에 대한 정보를 가져와서 수정해야하므로 해당정보를 가져와주자
	@Override
	public Claim headAnswerClaimForm(String claimCode) {
		System.out.println("ClaimDaoImpl headAnswerClaimForm 실행");
		return sqlSessionClaim.selectOne(NS+".headAnswerClaimForm", claimCode);
	}
		
	
	//답변처리 업데이트 하기
	@Override
	public void headAnswerClaim(Claim claim) {
		System.out.println("ClaimDaoImpl headAnswerClaim 실행");
		sqlSessionClaim.update(NS+".headAnswerClaim", claim);
	}
	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	
	//가맹이 해당점의 클래임리스트 조회
	@Override
	public List<Claim> subViewClaimList(Map<String,Object> map) {
		System.out.println("ClaimDaoImpl subViewClaimList 실행");
		return sqlSessionClaim.selectList(NS+".subViewClaimList", map);
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

	//고객이 클래임 등록을 처리
	@Override
	public void customerAddClaim(Claim claim) {
		System.out.println("ClaimDaoImpl customerViewClaimList 실행");
		sqlSessionClaim.insert(NS+".customerAddClaim", claim);
		
	}

	//랜덤네임이 중복되는 이름이 있으면 다시 새로운 랜덤네임으로 저장
	@Override
	public ClaimFile selectClaimFileByRandomName(String randomName) {
		System.out.println("ClaimDaoImpl selectClaimFileByRandomName 실행");
		return sqlSessionClaim.selectOne(NS+".selectClaimFileByRandomName", randomName);
	}

	//고객이 클래임 파일을 등록
	@Override
	public void customerAddClaimFile(ClaimFile claimFile) {
		System.out.println("ClaimDaoImpl customerAddClaimFile 실행");
		sqlSessionClaim.insert(NS+".customerAddClaimFile", claimFile);
		
	}

	//고객이 클래임 삭제처리
	@Override
	public void customerDeleteClaim(String claimCode) {
		System.out.println("ClaimDaoImpl customerDeleteClaim 실행");
		sqlSessionClaim.delete(NS+".customerDeleteClaim", claimCode);
		
	}

	//고객이 해당클래임에 관련된 파일 삭제처리
	@Override
	public void customerDeleteClaimFile(String claimCode) {
		System.out.println("ClaimDaoImpl customerDeleteClaimFile 실행");
		sqlSessionClaim.delete(NS+".customerDeleteClaimFile", claimCode);
	}

	
	
}
