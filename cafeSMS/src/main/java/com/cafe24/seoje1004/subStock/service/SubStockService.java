package com.cafe24.seoje1004.subStock.service;

import java.util.List;

import com.cafe24.seoje1004.subStock.model.SubStock;
import com.cafe24.seoje1004.subStock.model.SubStocks;
import com.cafe24.seoje1004.util.Search;

public interface SubStockService {
	/**
	 * 최종수정일 2016-08-06 오성현
	 * SubStockService 인터페이스
	 * 
	 * 
	 */
	
	public List<SubStock> subViewSubStockList(String subCode, Search search, String YN);		//가맹재고리스트
	public void subWarehousing(SubStocks subStocks);		//가맹이 본사로부터 받은 제품을 입고
	public void subStockOutY(String subStockCode);		//가맹 재고 출하
	public List<SubStock >subViewSubStockOutList(String subCode,Search search, String YN);		//가맹재고출하가능리스트
}
