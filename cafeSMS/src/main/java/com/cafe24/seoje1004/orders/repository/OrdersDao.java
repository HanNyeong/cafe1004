package com.cafe24.seoje1004.orders.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.cart.model.CartDetail;
import com.cafe24.seoje1004.cart.model.CartsDetail;
import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.orders.model.Orders;

public interface OrdersDao {

	CartDetail viewOrdersInCart(Map<String, Object> map);

	List<Orders> viewOrdersList(Map<String, Object> map);

	void addOrders(Map<String, Object> map);

	void addDelivery(Map<String, Object> map);

	void delCart(Map<String, Object> map);

	void selectspecific(Map<String, Object> map);


}
