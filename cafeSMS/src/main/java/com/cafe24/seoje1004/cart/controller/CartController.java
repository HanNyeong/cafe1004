package com.cafe24.seoje1004.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.seoje1004.cart.model.Cart;
import com.cafe24.seoje1004.cart.model.CartSearch;
import com.cafe24.seoje1004.cart.service.CartService;


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
	public String addSubCart(Model model,Cart cart){
		System.out.println("CartController addSubCart .POST 실행");
		System.out.println(cart);
		cartService.addSubCartService(cart);
		System.out.println(cart);
		
		return "/sub/cart/subViewCartList";
	}
	/**
	 * 장바구니를 조회하는 컨트롤러입니다.
	 * @param model
	 * @param cartSearch
	 * @param cart
	 * @return
	 */
	@RequestMapping(value="/subViewCartList")
	public String subViewCartList(Model model, CartSearch cartSearch,Cart cart){
		System.out.println("CartController subViewCartList실행");
		System.out.println(cartSearch);
		model.addAttribute("cartList", cartService.viewCartListService(cartSearch,cart));
		model.addAttribute("cartSearch", cartSearch);
		return "/sub/cart/subViewCartList";
		
	}
	
	/**
	 * 장바구니를 수정하는 컨트롤러 입니다.
	 * 매개변수로 cartCode를 받아서 해당 장바구니 정보를 꺼내와서
	 * subModifyCart.jsp로 보내줍니다.
	 * @param model
	 * @param cart
	 * @return
	 */
	@RequestMapping(value="/subModifyCart",method=RequestMethod.GET)
	public String subModifyCart(Model model,Cart cart){
		System.out.println("CartController subModifyCart.GET 실행");
	    System.out.println(cart);
	    model.addAttribute("reCart", cartService.selectCartService(cart));
		return "/sub/cart/subModifyCart";
	}
	/**
	 * 장바구니 정보를 수정하는 컨트롤러 입니다.
	 * 매개변수로 cartCode를 받아서  서비스 메서드의 매개변수로 줍니다.
	 * 결과를 int로 받아서 수정 성공 유무 별로 화면 분기를 줍니다.
	 * @param model
	 * @param cart
	 * @return
	 */
	@RequestMapping(value="subModifyCart",method=RequestMethod.POST)
	public String subModifyCartPost(Model model,Cart cart){
		System.out.println("CartController subModifyCart.POST 실행");
	    System.out.println(cart);
	    String result="";
	    //1. 서비스 메서드 실행 결과에 따른 결과값입니다.
	    //2. 성공하면 장바구니 리스트로 이동하고 실패하면 원래 수정페이지를 유지합니다.
	    if(cartService.modifySubCartService(cart) == 0){
	    	model.addAttribute("reCart",cart);
	    	result = "/sub/cart/subModifyCart";
	    }else{
	    	result="redirect:/subViewCartList?subCode="+cart.getSubCode();
	    }
		return result;
	}
	
	
}
