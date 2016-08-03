package com.cafe24.seoje1004.cart.service;

import java.util.List;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.model.CartSearch;
import com.cafe24.seoje1004.cart.model.Carts;
import com.cafe24.seoje1004.headItem.model.HeadItem;

public interface CartService {
	/**
	 * 가맹 장바구니 등록하는 서비스 메서드 입니다.
	 * 등록하고 로그인과 본사아이템코드를 리턴합니다.
	 * @param subLogin
	 * @param headItem
	 */
	int addSubCartService(Carts carts);
	
	/**
	 * 장바구니 리스트를 리턴하는 서비스 메서드입니다.
	 * @param cartSearch
	 * @param cart
	 * @return
	 */
	List<Cart> viewCartListService(CartSearch cartSearch, Cart cart,HeadItem headItem);
	
	/**
	 * 장바구니 수정을 하는 서비스메서드 입니다.(GET)
	 * @param cart
	 * @return
	 */
	Cart selectCartService(Cart cart);
	/**
	 * 장바구니 수정을 하는 서비스 메서드입니다.(POST)
	 * @param cart
	 * @return
	 */
	int modifySubCartService(Cart cart);
	
	/**
	 * 장바구니를 삭제하는 서비스메서드 입니다.
	 * @param cart
	 */
	void subDeleteCartService(Carts cart);

}
