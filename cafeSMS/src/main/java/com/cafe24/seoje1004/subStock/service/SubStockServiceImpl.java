package com.cafe24.seoje1004.subStock.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.seoje1004.subSell.model.SubSell;
import com.cafe24.seoje1004.subStock.model.SubStock;
import com.cafe24.seoje1004.subStock.model.SubStocks;
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
	public void subWarehousing(SubStocks subStocks) {
		System.out.println("SubStockServiceImpl subWarehousing 실행");
		for(int i=0; i<subStocks.getSubStockCode().size(); i++){
		
			//1.비어있는 입고날짜를 오늘로 업데이트
			subStockDao.subWarehousing(subStocks.getOrdersCode().get(i));
		
			//2.배송테이블의 배송수령여부 컬럼을 Y로 업데이트
			subStockDao.deliveryReceiveY(subStocks.getOrdersCode().get(i));
			
			//3.orders쪽 status 업데이트
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("ordersCode", subStocks.getOrdersCode().get(i));
			map.put("subOrdersStatus", "배송완료");
			
			subStockDao.ordersStatus(map);
		}
		
		
	}

	//가맹 재고 출하
	@Override
	public void subStockOutY(String subStockCode) {
		System.out.println("SubStockServiceImpl subStockOutY 실행");
		subStockDao.subStockOutY(subStockCode);
	}
	
	
}
