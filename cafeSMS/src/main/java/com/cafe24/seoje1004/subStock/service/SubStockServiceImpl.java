package com.cafe24.seoje1004.subStock.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.subStock.model.SubStock;
import com.cafe24.seoje1004.subStock.model.SubStockSearch;
import com.cafe24.seoje1004.subStock.repository.SubStockDao;

@Service
public class SubStockServiceImpl implements SubStockService{
	/**
	 * 최종수정일 2016-08-06 오성현
	 * SubStockService
	 * 
	 */
	
	@Autowired
	SubStockDao subStockDao;
	
	
	//가맹재고리스트
	@Override
	public List<SubStock> subViewSubStockList(String subCode, SubStockSearch subStockSearch) {
		System.out.println("SubStockServiceImpl subViewSubStockList 실행");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subCode", subCode);
		map.put("subStockSearch", subStockSearch);
		
		return subStockDao.subViewSubStockList(map);
	}
	
	
}
