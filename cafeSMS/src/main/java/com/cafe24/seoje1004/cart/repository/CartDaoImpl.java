package com.cafe24.seoje1004.cart.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.model.CartsDetail;
import com.cafe24.seoje1004.cart.model.Carts;

@Repository
public class CartDaoImpl implements CartDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionCart;
	private final String NS = "com.cafe24.seoje1004.cart.repository.CartMapper";
	
	/**
	 * 장바구니 등록 메서드 입니다.
	 */
	@Override
	public int addCart(Cart cart) {
		System.out.println("CartDaoImpl addCart실행");
		return sqlSessionCart.insert(NS+".addCart", cart);
	}
	/**
	 * 장바구니 리스트 보여주는 메서드입니다.
	 */
	@Override
	public List<CartsDetail> viewCartList(Map<String, Object> map) {
		System.out.println("CartDaoImpl viewCartList실행");
		return sqlSessionCart.selectList(NS+".viewCartList",map);
	}
	/**
	 * 장바구니 정보 받아오기
	 */
	@Override
	public Cart selectCart(Cart cart) {		
		System.out.println("CartDaoImpl selectCart실행");
		return sqlSessionCart.selectOne(NS+".selectCart", cart);
	}
	/**
	 * 장바구니 정보 수정하기
	 */
	@Override
	public int modifyCart(Cart cart) {
		return sqlSessionCart.update(NS+".modifyCart",cart);
	}
	@Override
	public int subDeleteCartService(Cart cart) {
		System.out.println("CartDaoImpl subDeleteCartService실행");
		return sqlSessionCart.delete(NS+".deleteCart", cart);
	}

}
