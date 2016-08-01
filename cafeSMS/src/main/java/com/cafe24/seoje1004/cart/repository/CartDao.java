package com.cafe24.seoje1004.cart.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.cart.model.Cart;

public interface CartDao {
	/**
	 * 장바구니를 등록하는 dao 메서드
	 * 매개변수 map(subLogin,headItem)을 받아서 Mapper에 접근해서 쿼리 실행합니다. 
	 * @param map
	 */
	int addCart(Map<String, Object> map);
	/**
	 * 장바구니 리스트를 조회하는 dao 메서드 입니다.
	 * 매개변수로 검색조건(Search)와 Cart를 받음
	 * @param map
	 * @return
	 */
	List<Cart> viewCartList(Map<String, Object> map);
	/**
	 * 장바구니 수정 GET 방식
	 * @param cart
	 * @return
	 */
	Cart selectCart(Cart cart);
	/**
	 * 장바구니 수정 POST 방식
	 * @param cart
	 * @return
	 */
	int modifyCart(Cart cart);

}
