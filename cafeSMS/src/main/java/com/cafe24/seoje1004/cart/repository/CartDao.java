package com.cafe24.seoje1004.cart.repository;

import java.util.Map;

public interface CartDao {
	/**
	 * 장바구니를 등록하는 dao 메서드
	 * 매개변수 map(subLogin,headItem)을 받아서 Mapper에 접근해서 쿼리 실행합니다. 
	 * @param map
	 */
	void addCart(Map<String, Object> map);

}
