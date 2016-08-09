package com.cafe24.seoje1004.delivery.service;

import java.util.List;

import com.cafe24.seoje1004.delivery.model.Delivery;
import com.cafe24.seoje1004.delivery.model.DeliverySearch;
import com.cafe24.seoje1004.util.Search;

public interface DeliveryService {
	/**
	 * 2016-08-02 오성현
	 * DeleveryService 인터페이스
	 */
	public List<Delivery> subViewDeliveryList(String subCode, Search search);		//가맹이 해당점의 배송 리스트를 조회
	
	public List<Delivery> headViewDeliveryList(Search search);		//본사가 전체 배송리스트를 조회
}
