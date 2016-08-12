package com.cafe24.seoje1004.delivery.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.delivery.model.Delivery;


public interface DeliveryDao {
	/**
	 * 2016-08-02 오성현
	 * DeleveryDao 인터페이스
	 */
	
	public List<Delivery> subViewDeliveryList(Map<String,Object> map);		//가맹이 해당점의 배송 리스트를 조회
	
	public List<Delivery> headViewDeliveryList(Map<String,Object> map);	//본사가 전체 배송리스트를 조회
}
