package com.cafe24.seoje1004.orders.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.model.CartDetail;
import com.cafe24.seoje1004.cart.model.Carts;
import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.orders.repository.OrdersDao;

@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired
	private OrdersDao ordersDao;
	//장바구니에서 체크된 cartList 정보확인 service
	@Override
	public List<CartDetail> viewOrdersInCartService(CartDetail cartDetail) {
		System.out.println("OrdersServiceImpl//viewviewOrdersInCartService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cartDetail", cartDetail);
		return ordersDao.viewOrdersInCart(map);
	}

}
