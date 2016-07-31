package com.cafe24.seoje1004.cart.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.repository.CartDao;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;
	/**
	 * 가맹 장바구니를 등록하는 서비스 메서드입니다.
	 */
	@Override
	public void addSubCartService(Cart cart) {
		System.out.println("CartServiceImpl addSubCartService실행");
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("cart", cart);
		cartDao.addCart(map);
		
	}

}
