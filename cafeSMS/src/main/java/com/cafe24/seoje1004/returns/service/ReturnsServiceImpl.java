package com.cafe24.seoje1004.returns.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.returns.model.Returns;
import com.cafe24.seoje1004.returns.model.ReturnsSearch;
import com.cafe24.seoje1004.returns.repository.ReturnsDao;

@Service
public class ReturnsServiceImpl implements ReturnsService {

	@Autowired
	ReturnsDao returnsDao;
	
	//가맹측 반품상품관리 조회
	@Override
	public List<Returns> subViewReturnsList(String subCode, ReturnsSearch returnsSearch) {
		System.out.println("ReturnsServiceImpl subViewReturnsList 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subCode", subCode);
		map.put("returnsSearch", returnsSearch);
		return returnsDao.subViewReturnsList(map);
	}

	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	
	//본사측 반품상품관리 조회
	@Override
	public List<Returns> headViewReturnsList(ReturnsSearch returnsSearch) {
		System.out.println("ReturnsServiceImpl headViewReturnsList 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("returnsSearch", returnsSearch);
		return returnsDao.headViewReturnsList(map);
	}

}
