package com.cafe24.seoje1004.returns.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReturnsController {
	/**
	 * 2016-08-02 오성현
	 * Returns 컨트롤러
	 */

	//가맹측 반품상품관리
	@RequestMapping(value="/subViewReturnsList")
	public String subViewReturnsList(Model model){
		System.out.println("ReturnsController subViewReturnsList 실행");
		return "/shared/returns/subViewReturnsList";
	}
	
	
	//본사측 반품상품관리
	@RequestMapping(value="/headViewReturnsList")
	public String headViewReturnsList(Model model){
		System.out.println("ReturnsController headViewReturnsList 실행");
		return "/shared/returns/headViewReturnsList";
	}
	
}
