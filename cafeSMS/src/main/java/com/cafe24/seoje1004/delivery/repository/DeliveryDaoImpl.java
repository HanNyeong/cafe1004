package com.cafe24.seoje1004.delivery.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.delivery.model.Delivery;


@Repository
public class DeliveryDaoImpl implements DeliveryDao {
	/**
	 * 2016-08-02 오성현
	 * DeleveryDao 
	 */
	
	private final String NS ="com.cafe24.seoje1004.delivery.repository.DeliveryMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionDelivery;
	
	//가맹이 해당점의 배송 리스트를 조회
	@Override
	public List<Delivery> subViewDeliveryList(Map<String, Object> map) {
		System.out.println("DeliveryDaoImpl subViewDeliveryList 실행");
		return sqlSessionDelivery.selectList(NS+".subViewDeliveryList", map);
	}

	//본사가 전체 배송리스트를 조회
	@Override
	public List<Delivery> headViewDeliveryList(Map<String,Object> map) {
		System.out.println("DeliveryDaoImpl headViewDeliveryList 실행");
		return sqlSessionDelivery.selectList(NS+".headViewDeliveryList", map);
	}
	
}
