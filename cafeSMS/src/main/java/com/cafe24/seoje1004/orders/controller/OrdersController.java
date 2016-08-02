package com.cafe24.seoje1004.orders.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.orders.service.OrdersService;

@Controller
public class OrdersController {
	
	@Autowired
	private OrdersService ordersService;
	
	//주문 최종승인 폼이동 컨트롤러 by head_item
	@RequestMapping(value="/viewOrdersInHeadItem")
	public String viewOrdersInHeadItem(Model model,@RequestParam("hItemCode")String hItemCode) {
		System.out.println("OrdersController//viewSubOrdersInHeadItem");
		model.addAttribute("headItemList",ordersService.viewOrdersInHeadItemService(hItemCode));
		return "/shared/orders/subAddOrdersByHeadItem";
	}
}
