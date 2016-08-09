package com.cafe24.seoje1004.subSell.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.subSell.model.SubSell;

public interface SubSellDao {
	/**
	 * 최종수정일 2016-08-08 오성현
	 * SubSellDao 인터페이스
	 */
	
	
	public List<SubSell> subViewSubSellList(Map<String,Object> map); 	//가맹 판매 조회
	
	public void subSellFinals(SubSell subSell);	//가맹 판매 마감처리s
}
