package com.cafe24.seoje1004.orders.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.model.CartDetail;
import com.cafe24.seoje1004.cart.model.CartsDetail;
import com.cafe24.seoje1004.cart.model.Carts;
import com.cafe24.seoje1004.delivery.model.Delivery;
import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.orders.model.Orders;
import com.cafe24.seoje1004.orders.model.OrdersSearch;
import com.cafe24.seoje1004.sub.model.SubLogin;

@Service
public interface OrdersService {

	List<CartDetail> viewOrdersInCartService(CartsDetail cartsDetail);

	List<Orders> viewOrdersListService(OrdersSearch ordersSearch, SubLogin subLogin);

	void addOrdersService(CartsDetail cartDetail, Delivery delivery, Orders orders,SubLogin subLogin);

}
