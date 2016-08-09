package com.cafe24.seoje1004.subStock.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.seoje1004.subStock.model.SubStock;
import com.cafe24.seoje1004.subStock.model.SubStockSearch;
import com.cafe24.seoje1004.subStock.repository.SubStockDao;
import com.cafe24.seoje1004.util.Search;

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
	public List<SubStock> subViewSubStockList(String subCode, Search search) {
		System.out.println("SubStockServiceImpl subViewSubStockList 실행");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subCode", subCode);
		map.put("search", search);
		
		return subStockDao.subViewSubStockList(map);
	}

	//가맹이 본사로부터 받은 제품을 입고
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public void subWarehousing(String subStockCode, String ordersCode) {
		System.out.println("SubStockServiceImpl subWarehousing 실행");
		
		//1.비어있는 입고날짜를 오늘로 업데이트
		subStockDao.subWarehousing(subStockCode);
		//2.배송테이블의 배송수령여부 컬럼을 Y로 업데이트
		subStockDao.deliveryReceiveY(ordersCode);
		//3.orders쪽 status 업데이트
		subStockDao.ordersStatus(ordersCode);
	}
	
	
}
