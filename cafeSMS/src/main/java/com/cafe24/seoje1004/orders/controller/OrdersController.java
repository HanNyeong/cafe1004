package com.cafe24.seoje1004.orders.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.seoje1004.cart.model.CartDetail;
import com.cafe24.seoje1004.cart.model.CartsDetail;
import com.cafe24.seoje1004.delivery.model.Delivery;
import com.cafe24.seoje1004.orders.model.OrderGroup;
import com.cafe24.seoje1004.orders.model.Orders;
import com.cafe24.seoje1004.orders.service.OrdersService;
import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subAccount.model.SubAccounts;
import com.cafe24.seoje1004.util.Search;



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
	public String viewOrdersList(Model model,Search ordersSearch,SubLogin subLogin) {
		System.out.println("OrdersController//viewOrdersList실행");
		List<Orders> ordersList = ordersService.viewOrdersListService(ordersSearch,subLogin);
		System.out.println(subLogin.getSubCode());
		model.addAttribute("ordersList",ordersList);
		model.addAttribute("ordersSearch",ordersSearch);
		return "/shared/orders/subViewOrdersList";
	}
	
	//orders추가메서드 (트랜잭션//cart삭제,delivery추가)
	@RequestMapping(value="/addOrders")
	public String addOrders(Model model,
							SubLogin subLogin,
							CartsDetail cartDetail,
							Delivery delivery,
							Orders orders
							) {
		System.out.println("OrdersController//addOrders실행");
		System.out.println(cartDetail);
		System.out.println(delivery);
		System.out.println(orders);
		System.out.println(subLogin.getSubCode()+"1번");
		ordersService.addOrdersService(cartDetail,delivery,orders,subLogin);
		System.out.println(subLogin.getSubCode());
		return "redirect:/viewOrdersList?subCode="+cartDetail.getSubCode().get(0);
	}
	
	//본사측 결제 Y인상품 리스트 뿌려주기
	@RequestMapping(value="/headViewOrdersList")
	public String headViewOrdersList(Model model,Search ordersSearch) {
		System.out.println("본사측  ordersList//headViewOrdersList실행");
		List<Orders> ordersList = ordersService.viewOrdersListByHeadService(ordersSearch);
		model.addAttribute("ordersList",ordersList);
		return "/shared/orders/headViewOrdersList";
	}
	
	//결제 페이지로 이동
	@RequestMapping(value="/subOrdersPayConfirm")
	public String subOrdersPayConfirm(Model model,Search ordersSearch,SubLogin subLogin){
		System.out.println("OrdersController//subOrdersPayConfirm실행");
		List<Orders> ordersList = ordersService.viewOrdersListService(ordersSearch,subLogin);
		model.addAttribute("ordersList", ordersList);
		return "/shared/orders/subOrdersPayConfirm";
	}
	
	//결제 상태 update controller 
	@RequestMapping(value="/modifyOrdersPay",method=RequestMethod.POST)
	public String modifyOrdersPay(OrderGroup orderGroup, SubAccounts subAccounts,SubLogin subLogin) {
		System.out.println("OrdersController//modifyOrdersPay실행");
		System.out.println(orderGroup);
		ordersService.modifyOrdersPayService(orderGroup,subLogin,subAccounts);
		return "redirect:/subOrdersPayConfirm?subCode="+orderGroup.getSubCode().get(0);
	}
	//발주 취소
	@RequestMapping(value="/subDeleteOrdersCancel",method=RequestMethod.POST)
	public String subDeleteOrdersCancel(OrderGroup orderGroup){
		System.out.println("OrdersController//subDeleteOrdersCancel실행");
		System.out.println(orderGroup);
		ordersService.subDeleteOrdersCancelService(orderGroup);
		return "redirect:/viewOrdersList?subCode="+orderGroup.getSubCode().get(0);
	}
	
	//본사측에서 해당 orders 승인 modify head_orders_confirm
	@RequestMapping(value="/modifyOrdersConfirm")
	public String modifyOrdersConfirm(OrderGroup orderGroup) {
		System.out.println("modifyOrdersConfirm실행");
		System.out.println(orderGroup.getHeadItemCode());
		ordersService.modifyOrdersConfirmService(orderGroup);
		return "redirect:/headViewOrdersList";
	}
	
}
