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
	public void subWarehousing(String ordersCode);	//비어있는 입고날짜를 오늘로 업데이트
	public void deliveryReceiveY(String ordersCode);	//배송테이블의 배송수령여부 컬럼을 Y로 업데이트
	public void ordersStatus(Map<String,Object> map); //
	
	public void subStockOutY(String subStockCode);			//가맹 재고 출하
}
