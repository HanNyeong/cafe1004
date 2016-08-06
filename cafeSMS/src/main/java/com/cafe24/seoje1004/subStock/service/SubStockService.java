package com.cafe24.seoje1004.subStock.service;

import java.util.List;

import com.cafe24.seoje1004.subStock.model.SubStock;
import com.cafe24.seoje1004.subStock.model.SubStockSearch;

public interface SubStockService {
	/**
	 * 최종수정일 2016-08-06 오성현
	 * SubStockService 인터페이스
	 * 
	 * 
	 */
	
	public List<SubStock> subViewSubStockList(String subCode, SubStockSearch subStockSearch);		//가맹재고리스트
	public void subWarehousing(String subStockCode,String ordersCode);		//가맹이 본사로부터 받은 제품을 입고
}
