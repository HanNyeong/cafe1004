package com.cafe24.seoje1004.orders.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.model.Carts;
import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.orders.service.OrdersService;

@Controller
public class OrdersController {
	
	@Autowired
	private OrdersService ordersService;
	
	//주문 최종승인 폼이동 컨트롤러 by head_item
	@RequestMapping(value="/viewOrdersInCart")
	public String viewOrdersInHeadItem(Model model,HeadItem headItem,Carts cart) {
		System.out.println("OrdersController//viewSubOrdersInHeadItem");
		System.out.println(cart);
		System.out.println(headItem);
		
		List<HeadItem> ordersconfirmList = ordersService.viewOrdersInHeadItemService(headItem,cart);
		model.addAttribute("ordersconfirmList",ordersconfirmList);
		System.out.println(ordersconfirmList);
		return "/shared/orders/subAddOrdersByCart";
	}
}
