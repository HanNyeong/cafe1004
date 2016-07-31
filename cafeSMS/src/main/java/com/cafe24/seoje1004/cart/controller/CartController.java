package com.cafe24.seoje1004.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.seoje1004.cart.service.CartService;
import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.sub.model.SubLogin;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	/**
	 * 가맹 장바구니 등록을 처리하는 컨트롤러 입니다.
	 * 매개변수로 로그인과 아이템 코드를 받아서 서비스 로직으로 보내줍니다.
	 * @param model
	 * @param subLogin
	 * @param headItem
	 * @return
	 */
	@RequestMapping(value="/subAddCart",method=RequestMethod.POST)
	public String addSubCart(Model model, SubLogin subLogin,HeadItem headItem){
		System.out.println("CartController addSubCart .POST 실행");
		System.out.println(subLogin);
		System.out.println(headItem);
		cartService.addSubCartService(subLogin,headItem);
		System.out.println(subLogin);
		System.out.println(headItem);
		
		return "/sub/cart/subViewCartList";
	}
}
