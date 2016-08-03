package com.cafe24.seoje1004.returns.service;

import java.util.List;

import com.cafe24.seoje1004.returns.model.Returns;
import com.cafe24.seoje1004.returns.model.ReturnsSearch;

public interface ReturnsService {
	/**
	 * 2016-08-02 오성현
	 * ReturnsService 인터페이스
	 */
	
	public List<Returns> subViewReturnsList(String subCode, ReturnsSearch returnsSearch);		//가맹측 반품상품관리 조회
	
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	
	public List<Returns> headViewReturnsList(ReturnsSearch returnsSearch);		//본사측 반품상품관리 조회
}
