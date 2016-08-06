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
}
