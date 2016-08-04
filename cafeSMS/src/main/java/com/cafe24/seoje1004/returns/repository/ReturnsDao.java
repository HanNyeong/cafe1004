package com.cafe24.seoje1004.returns.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.returns.model.AddReturns;
import com.cafe24.seoje1004.returns.model.Returns;
import com.cafe24.seoje1004.returns.model.ReturnsFile;
import com.cafe24.seoje1004.returns.model.SubStock;

public interface ReturnsDao {
	/**
	 * 2016-08-02 오성현
	 * ReturnsDao 인터페이스
	 */
	
	public List<Returns> subViewReturnsList(Map<String, Object> map); //가맹측 반품상품관리 조회
	public List<SubStock> subAddReturnsForm(Map<String, Object> map);		//출고상태가 N, 가맹이확인하고 입고한날짜 not null
	public AddReturns subAddReturnsForm2(String subStockCode);		//해당재고를 기준으로 반품등록에 필요한 정보를 가져오자
	public void updateSubStockOut(String subStockCode);			//환불 신청시 해당 재고상품의 출고여부(판매여부)를 N->Y로 변경
	public void subAddReturns(Returns returns); 	//returns테이블에 새로운 환불 등록
	public ReturnsFile selectReturnFileByRandomName(String randomName);	//랜덤네임이 중복되는 이름이 있으면 다시 새로운 랜덤네임으로 저장
	public void subAddReturnsFile(ReturnsFile returnsFile);		//반품첨부파일 정보 등록
	
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	
	public List<Returns> headViewReturnsList(Map<String, Object> map);	//본사측 반품상품관리 조회
	public Returns viewReturnsContent(String returnCode);			//해당 반품상품의 상세정보
	public List<ReturnsFile> viewReturnsFile(String returnCode);		//해당반품상품의 파일 리스트
	public void approvalReturns(String returnCode);		//본사에서 환불 승인
	
}
