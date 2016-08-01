package com.cafe24.seoje1004.cart.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.cart.model.Cart;

@Repository
public class CartDaoImpl implements CartDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionCart;
	private final String NS = "com.cafe24.seoje1004.cart.repository.CartMapper";
	
	/**
	 * 장바구니 등록 메서드 입니다.
	 */
	@Override
	public void addCart(Map<String, Object> map) {
		System.out.println("CartDaoImpl addCart실행");
		sqlSessionCart.insert(NS+".addCart", map);
	}

	@Override
	public List<Cart> viewCartList(Map<String, Object> map) {
		System.out.println("CartDaoImpl viewCartList실행");
		return sqlSessionCart.selectList(NS+".viewCartList",map);
	}

}
