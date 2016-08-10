package com.cafe24.seoje1004.subStock.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.subStock.model.SubStock;

@Repository
public class SubStockDaoImpl implements SubStockDao{
	/**
	 * 최종수정일 2016-08-06 오성현
	 *	SubStockDao
	 * 
	 */
	
	@Autowired
	private SqlSessionTemplate sqlSessionSubStock;
	
	private final String NS = "com.cafe24.seoje1004.subStock.repository.SubStockMapper";
	
	
	//가맹재고리스트
	@Override
	public List<SubStock> subViewSubStockList(Map<String, Object> map) {
		System.out.println("SubStockDaoImpl subViewSubStockList 실행");
		
		return sqlSessionSubStock.selectList(NS+".subViewSubStockList", map);
	}

	//비어있는 입고날짜를 오늘로 업데이트
	@Override
	public void subWarehousing(String ordersCode) {
		System.out.println("SubStockDaoImpl subWarehousing 실행");
		sqlSessionSubStock.update(NS+".subWarehousing", ordersCode);
	}

	//배송테이블의 배송수령여부 컬럼을 Y로 업데이트
	@Override
	public void deliveryReceiveY(String ordersCode) {
		System.out.println("SubStockDaoImpl deliveryReceiveY 실행");
		sqlSessionSubStock.update(NS+".deliveryReceiveY", ordersCode);
	}
	
	//orders table status 업데이트
	@Override
	public void ordersStatus(Map<String,Object> map) {
		System.out.println("ordersStatus");
		sqlSessionSubStock.update(NS+".modifyOrders",map);
	}
	
}
