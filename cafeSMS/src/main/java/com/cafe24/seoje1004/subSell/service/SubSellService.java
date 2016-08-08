package com.cafe24.seoje1004.subSell.service;

import java.util.List;

import com.cafe24.seoje1004.subSell.model.SubSell;
import com.cafe24.seoje1004.util.Search;

public interface SubSellService {
	/**
	 * 최종수정일 2016-08-08 오성현
	 * SubSellService 인터페이스
	 */
	
	public List<SubSell> subViewSubSellList(Search search,String subCode); 	//가맹 판매 조회[승인처리리스트]
	public void subSellFinal(String subSellCode);		//가맹 판매 마감처리
	
	public List<SubSell> subViewSubSellListN(Search search,String subCode);			//가맹 판매 조회[승인대기리스트]
}
