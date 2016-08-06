package com.cafe24.seoje1004.subStock.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.subStock.model.SubStock;

public interface SubStockDao {
	/**
	 * 최종수정일 2016-08-06 오성현
	 * SubStockDao 인터페이스
	 */
	
	public List<SubStock> subViewSubStockList(Map<String,Object> map);		//가맹재고리스트
}
