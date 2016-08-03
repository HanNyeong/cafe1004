package com.cafe24.seoje1004.returns.service;

import java.util.List;

import com.cafe24.seoje1004.returns.model.Returns;
import com.cafe24.seoje1004.returns.model.ReturnsSearch;

public class ReturnsServiceImpl implements ReturnsService {

	//가맹측 반품상품관리 조회
	@Override
	public List<Returns> subViewReturnsList(String subCode, ReturnsSearch returnsSearch) {
		System.out.println("ReturnsServiceImpl subViewReturnsList 실행");
		return null;
	}

}
