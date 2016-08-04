package com.cafe24.seoje1004.orders.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.cart.model.CartDetail;
import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.orders.model.Orders;

@Repository
public class OrdersDaoImpl implements OrdersDao{
	@Autowired
	private SqlSessionTemplate sqlSessionOrders;
	
	private final String NS = "com.cafe24.seoje1004.orders.repository.OrdersMapper";
	//장바구니에서 체크된 cartList 정보확인 Dao
	@Override
	public List<CartDetail> viewOrdersInCart(Map<String, Object> map) {
		System.out.println("OrdersDaoImpl//viewOrdersInCart");
		return sqlSessionOrders.selectList(NS+".viewOrdersInCart",map);
	}
	//orders List Dao
	@Override
	public List<Orders> viewOrdersList(Map<String, Object> map) {
		System.out.println("OrdersDaoImpl//viewOrdersList");
		return sqlSessionOrders.selectList(NS+".viewOrdersList",map);
	}

}
