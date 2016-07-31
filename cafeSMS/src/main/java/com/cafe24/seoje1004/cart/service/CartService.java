package com.cafe24.seoje1004.cart.service;

import com.cafe24.seoje1004.cart.model.Cart;

public interface CartService {
	/**
	 * 가맹 장바구니 등록하는 서비스 메서드 입니다.
	 * 등록하고 로그인과 본사아이템코드를 리턴합니다.
	 * @param subLogin
	 * @param headItem
	 */
	void addSubCartService(Cart cart);

}
