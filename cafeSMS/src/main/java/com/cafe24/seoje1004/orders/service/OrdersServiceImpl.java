package com.cafe24.seoje1004.orders.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.model.CartDetail;
import com.cafe24.seoje1004.cart.model.CartsDetail;
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
	public List<CartDetail> viewOrdersInCartService(CartsDetail cartsDetail) {
		System.out.println("OrdersServiceImpl//viewviewOrdersInCartService실행");
		List<CartDetail> ordersConfirmList = new ArrayList<CartDetail>();
		Map<String,Object> map = new HashMap<String,Object>();
		for(int i = 0; i<cartsDetail.getCartCode().size(); i++) {
			map.put("cartCode",cartsDetail.getCartCode().get(i));
			ordersConfirmList.add(ordersDao.viewOrdersInCart(map));
		}
		return ordersConfirmList;
	}
	//주문내역 뿌려주는 List Service 0804 박효민
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
					rollbackFor = Exception.class)
	@Override
	public void addOrdersService(CartsDetail cartDetail, Delivery delivery, Orders orders,SubLogin subLogin) {
		System.out.println("OrdersServiceImpl//addOrdersService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		
/*		//delivery insert test 를위한임의값
	
		//orders insert test 를위한임의값
		*/
		
		//여러개 객체가 왔을경우를 대비한 리스트 생성
//		List<Orders> ordersList = new ArrayList<Orders>();
//		List<Delivery> deliveryList = new ArrayList<Delivery>();
		orders.setSubOrdersGroup(ordersDao.selectOrdersGroupCode());
		System.out.println("맵퍼딱지를 떄는중 이제는 코더로"+orders.getSubOrdersQuantity());
		//for문으로 리스트에 들어오는 해당 객체 각각 집어넣어주기 
		for(int i = 0; i<cartDetail.getCartCode().size() ; i++) {
			CartDetail c = new CartDetail();
			c.setCartCode(cartDetail.getCartCode().get(i));
			c.setCartQuantity(cartDetail.getCartQuantity().get(i));
			c.sethItemCode(cartDetail.gethItemCode().get(i));
			c.sethItemName(cartDetail.gethItemName().get(i));
			c.sethItemSellingPrice(cartDetail.gethItemSellingPrice().get(i));
			c.setSubCode(cartDetail.getSubCode().get(i));
			orders.setSubOrdersQuantity(cartDetail.getCartQuantity().get(i));
			orders.setSubStaffCode("sub_staff_code1000");
			orders.setOrdersCode(ordersDao.selectOrdersCode());
			map.put("cartDetail", c);
			map.put("orders", orders);
			map.put("delivery", delivery);
			map.put("subLogin", subLogin);

			ordersDao.addOrders(map);
			ordersDao.addDelivery(map);
			ordersDao.delCart(map);
			
		}
		//맵에 집어넣자
		
		/*ordersDao.selectspecific(map);*/
	}

}
