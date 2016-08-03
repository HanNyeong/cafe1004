package com.cafe24.seoje1004.orders.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.model.CartDetail;
import com.cafe24.seoje1004.cart.model.Carts;
import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.orders.service.OrdersService;

@Controller
public class OrdersController {
	
	@Autowired
	private OrdersService ordersService;
	
	//주문 최종승인 폼이동 컨트롤러 by cart
	@RequestMapping(value="/viewOrdersInCart")
	public String viewOrdersInHeadItem(Model model,CartDetail cartDetail) {
		System.out.println("OrdersController//viewSubOrdersCart");
		System.out.println(cartDetail);
		
		List<CartDetail> ordersConfirmList = ordersService.viewOrdersInCartService(cartDetail);
		model.addAttribute("ordersConfirmList",ordersConfirmList);
		
		return "/shared/orders/subAddOrdersByCart";
	}
}
