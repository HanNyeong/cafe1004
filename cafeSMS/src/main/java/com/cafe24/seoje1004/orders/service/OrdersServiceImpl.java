package com.cafe24.seoje1004.orders.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.model.CartDetail;
import com.cafe24.seoje1004.cart.model.Carts;
import com.cafe24.seoje1004.delivery.model.Delivery;
import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.orders.model.Orders;
import com.cafe24.seoje1004.orders.model.OrdersSearch;
import com.cafe24.seoje1004.orders.repository.OrdersDao;
import com.cafe24.seoje1004.sub.model.SubLogin;

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
	//주문내역 뿌려주는 List SErvice 0804 박효민
	@Override
	public List<Orders> viewOrdersListService(OrdersSearch ordersSearch, SubLogin subLogin) {
		System.out.println("OrdersServiceImpl//viewOrdersListService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("ordersSearch", ordersSearch);
		map.put("subLogin", subLogin);
		return ordersDao.viewOrdersList(map);
	}
	//orders Add, cart Del, delivery Add transactional Service
	@Transactional(propagation = Propagation.REQUIRES_NEW,
					rollbackFor = {Exception.class,SQLException.class})
	@Override
	public void addOrdersService(CartDetail CartDetail, Delivery delivery, Orders orders,SubLogin subLogin) {
		System.out.println("OrdersServiceImpl//addOrdersService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		
		//delivery insert test 를위한임의값
		String deliveryCode = "delivery_code1000";
		String deliveryReceive = "delivery_receive1000";
		String deliveryLocation = "전주시";
		String deliveryPerson = "headStaffId1000";
		String headStaffId = "headStaffId1000";
		delivery.setDeliveryCode(deliveryCode);
		delivery.setDeliveryReceive(deliveryReceive);
		delivery.setDeliveryLocation(deliveryLocation);
		delivery.setDeliveryPerson(deliveryPerson);
		delivery.setHeadStaffId(headStaffId);
		
		//orders insert test 를위한임의값
		String ordersCode = "orders_code1000";
		String subOrdersGroup = "sub_orders_group1000";
		String subOrdersStatus = "배송전";
		String totalAccountGroup = "total_account_group1000";
		String subStaffCode =  "sub_staff_code1000";
		orders.setOrdersCode(ordersCode);
		orders.setSubOrdersGroup(subOrdersGroup);
		orders.setSubOrdersStatus(subOrdersStatus);
		orders.setTotalAccountGroup(totalAccountGroup);
		orders.setSubStaffCode(subStaffCode);
		orders.setHeadStaffId(headStaffId);
		
		//맵에 집어넣자
		map.put("CartDetail", CartDetail);
		map.put("delivery", delivery);
		map.put("orders", orders);
		map.put("subLogin", subLogin);
		ordersDao.addOrders(map);
		ordersDao.addDelivery(map);
		ordersDao.delCart(map);
	}

}
