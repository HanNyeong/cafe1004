package com.cafe24.seoje1004.returns.repository;

import java.util.List;
import java.util.Map;

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
	
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	
	public List<Returns> headViewReturnsList(Map<String, Object> map);	//본사측 반품상품관리 조회
	public Returns viewReturnsContent(String returnCode);			//해당 반품상품의 상세정보
	public List<ReturnsFile> viewReturnsFile(String returnCode);		//해당반품상품의 파일 리스트
	
}
