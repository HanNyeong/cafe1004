package com.cafe24.seoje1004.orders.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.model.CartDetail;
import com.cafe24.seoje1004.cart.model.CartsDetail;
import com.cafe24.seoje1004.cart.model.Carts;
import com.cafe24.seoje1004.delivery.model.Delivery;
import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.orders.model.OrderGroup;
import com.cafe24.seoje1004.orders.model.Orders;
import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subAccount.model.SubAccounts;
import com.cafe24.seoje1004.subject.model.Subject;

import com.cafe24.seoje1004.util.Search;

@Service
public interface OrdersService {

	List<CartDetail> viewOrdersInCartService(CartsDetail cartsDetail);

	List<Orders> viewOrdersListService(Search ordersSearch, SubLogin subLogin);

	void addOrdersService(CartsDetail cartDetail, Delivery delivery, Orders orders,SubLogin subLogin);

	void modifyOrdersPayService(OrderGroup orderGroup,SubLogin subLogin,SubAccounts subAccounts);

	List<Orders> subOrdersPayConfirmService(Search ordersSearch, SubLogin subLogin);

	void subDeleteOrdersCancelService(OrderGroup orderGroup);

	List<Orders> viewOrdersListByHeadService(Search ordersSearch);

	void modifyOrdersConfirmService(OrderGroup orderGroup);

}
