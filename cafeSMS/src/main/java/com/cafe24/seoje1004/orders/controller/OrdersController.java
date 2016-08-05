package com.cafe24.seoje1004.orders.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.model.CartDetail;
import com.cafe24.seoje1004.cart.model.CartsDetail;
import com.cafe24.seoje1004.cart.model.Carts;
import com.cafe24.seoje1004.delivery.model.Delivery;
import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.orders.model.Orders;
import com.cafe24.seoje1004.orders.model.OrdersSearch;
import com.cafe24.seoje1004.orders.service.OrdersService;
import com.cafe24.seoje1004.sub.model.SubLogin;

@Controller
public class OrdersController {
	
	@Autowired
	private OrdersService ordersService;
	
	
	//주문 최종승인 폼이동 컨트롤러 by cart
	@RequestMapping(value="/viewOrdersInCart")
	public String viewOrdersInCart(Model model,CartsDetail cartsDetail) {
		System.out.println("OrdersController//viewSubOrdersCart");
		System.out.println(cartsDetail);
		List<CartDetail> ordersConfirmList = ordersService.viewOrdersInCartService(cartsDetail);
	
		model.addAttribute("ordersConfirmList",ordersConfirmList);
		
		return "/shared/orders/subAddOrdersByCart";
	}
	
	//주문내역 리스트 컨트롤러
	@RequestMapping(value="/viewOrdersList")
	public String viewOrdersList(Model model,OrdersSearch ordersSearch,SubLogin subLogin) {
		System.out.println("OrdersController//viewOrdersList실행");
		List<Orders> ordersList = ordersService.viewOrdersListService(ordersSearch,subLogin);
		model.addAttribute("ordersList",ordersList);
		return "/shared/orders/subViewOrdersList";
	}
	
	//orders추가메서드 (트랜잭션//cart삭제,delivery추가)
	@RequestMapping(value="/addOrders")
	public String addOrders(Model model,
							CartsDetail cartDetail,
							Delivery delivery,
							Orders orders,
							SubLogin subLogin) {
		System.out.println("OrdersController//addOrders실행");
		System.out.println(cartDetail);
		System.out.println(delivery);
		System.out.println(orders);
		ordersService.addOrdersService(cartDetail,delivery,orders,subLogin); 
		return "redirect:/viewOrdersList?subCode="+subLogin.getSubCode();
	}
}
