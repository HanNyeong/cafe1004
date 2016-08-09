package com.cafe24.seoje1004.delivery.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.delivery.model.Delivery;
import com.cafe24.seoje1004.delivery.model.DeliverySearch;
import com.cafe24.seoje1004.delivery.repository.DeliveryDao;
import com.cafe24.seoje1004.util.Search;

@Service
public class DeliveryServiceImpl implements DeliveryService {
	/**
	 * 2016-08-02 오성현
	 * DeleveryService
	 */
	
	@Autowired
	DeliveryDao deliveryDao;
	
	//가맹이 해당점의 배송 리스트를 조회
	@Override
	public List<Delivery> subViewDeliveryList(String subCode, Search search) {
		System.out.println("DeliveryServiceImpl subViewDeliveryList 실행");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subCode", subCode);
		map.put("search", search);
		return deliveryDao.subViewDeliveryList(map);
	}

	//본사가 전체 배송리스트를 조회
	@Override
	public List<Delivery> headViewDeliveryList(Search search) {
		System.out.println("DeliveryServiceImpl headViewDeliveryList 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("search", search);
		
		return deliveryDao.headViewDeliveryList(map);
	}

}
