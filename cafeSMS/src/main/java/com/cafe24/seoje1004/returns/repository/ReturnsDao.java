package com.cafe24.seoje1004.returns.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.returns.model.Returns;

public interface ReturnsDao {
	/**
	 * 2016-08-02 오성현
	 * ReturnsDao 인터페이스
	 */
	
	public List<Returns> subViewReturnsList(Map<String, Object> map); //가맹측 반품상품관리 조회
}
