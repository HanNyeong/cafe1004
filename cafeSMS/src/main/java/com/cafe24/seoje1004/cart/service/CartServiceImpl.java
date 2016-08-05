package com.cafe24.seoje1004.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.model.CartDetail;
import com.cafe24.seoje1004.cart.model.CartsDetail;
import com.cafe24.seoje1004.cart.model.CartSearch;
import com.cafe24.seoje1004.cart.model.Carts;
import com.cafe24.seoje1004.cart.repository.CartDao;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;
	/**
	 * 가맹 장바구니를 등록하는 서비스 메서드입니다.
	 */
	@Override
	public int addSubCartService(Carts carts) {
		System.out.println("CartServiceImpl addSubCartService실행");
		for(int i = 0; i<carts.getSubCode().size(); i++){
			Cart cart = new Cart();
			cart.setCartQuantity(carts.getCartQuantity().get(i));
			cart.sethItemCode(carts.gethItemCode().get(i));
			cart.setSubCode(carts.getSubCode().get(i));
			cartDao.addCart(cart);
		}
		
		return 0;
		
	}
	/**
	 * 장바구니 리스트를 리턴하는 서비스 메서드입니다.
	 */
	@Override
	public List<CartsDetail> viewCartListService(CartSearch cartSearch, CartDetail cartDetail) {
		System.out.println("CartServiceImpl viewCartListService실행");
		System.out.println("CartServiceImpl viewCartListService. 조회 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cartSearch", cartSearch);
		map.put("cartDetail", cartDetail);
		return cartDao.viewCartList(map);
	}
	/**
	 * 장바구니 삭제하는 서비스 메서드 입니다.
	 */
	@Override
	public void subDeleteCartService(Carts carts) {
		System.out.println("CartServiceImpl subDeleteCartService실행");
		System.out.println(carts);
		for(int i = 0; i<carts.getCartCode().size(); i++){
			Cart cart = new Cart();
			cart.setCartCode(carts.getCartCode().get(i));
			cart.setCartQuantity(carts.getCartQuantity().get(i));
			cart.sethItemCode(carts.gethItemCode().get(i));
			cart.setSubCode(carts.getSubCode().get(i));
			cartDao.subDeleteCartService(cart);
		}
	}
	/**
	 * 장바구니 수정을 보여주는 서비스메서드 (GET) 입니다.
	 */
	@Override
	public Cart selectCartService(Cart cart) {
		 System.out.println("CartServiceImpl selectCartService실행");
	     System.out.println(cart);
		return cartDao.selectCart(cart);
	}
	/**
	 * 장바구니 수정을 보여주는 서비스 메서드(POST)입니다.
	 */
	@Override
	public int modifySubCartService(Cart cart) {
		System.out.println("CartServiceImpl modifySubCartService실행");
		return cartDao.modifyCart(cart);
	}
	

}
