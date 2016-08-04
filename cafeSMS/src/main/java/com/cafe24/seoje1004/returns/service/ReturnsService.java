package com.cafe24.seoje1004.returns.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cafe24.seoje1004.returns.model.AddReturns;
import com.cafe24.seoje1004.returns.model.Returns;
import com.cafe24.seoje1004.returns.model.ReturnsSearch;
import com.cafe24.seoje1004.returns.model.SubStock;
import com.cafe24.seoje1004.returns.model.SubStockSearch;

public interface ReturnsService {
	/**
	 * 2016-08-02 오성현
	 * ReturnsService 인터페이스
	 */
	
	public List<Returns> subViewReturnsList(String subCode, ReturnsSearch returnsSearch);		//가맹측 반품상품관리 조회
	public List<SubStock> subAddReturnsForm(String subCode, SubStockSearch subStockSearch);		//출고상태가 N, 가맹이확인하고 입고한날짜 not null
	public AddReturns subAddReturnsForm2(String subStockCode);			//해당재고를 기준으로 반품등록에 필요한 정보를 가져오자
	public void subAddReturns(Returns returns, HttpServletRequest request);	//returns테이블에 새로운 환불 등록,해당 재고상품의 출고여부(판매여부)를 N->Y로 변경
	
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	
	public List<Returns> headViewReturnsList(ReturnsSearch returnsSearch);		//본사측 반품상품관리 조회
	public Map<String,Object> viewReturnsContent(String returnCode);		//반품상품 상세보기
	public void approvalReturns(String returnCode);		//본사에서 환불 승인
	
}
