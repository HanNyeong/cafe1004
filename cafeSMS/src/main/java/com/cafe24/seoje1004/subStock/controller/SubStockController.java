package com.cafe24.seoje1004.subStock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SubStockController {
	/**
	 * 최종 수정일 2016-08-06 오성현
	 * 가맹재고컨트롤러
	 */
	
	//가맹재고리스트
	@RequestMapping(value="/subViewSubStockList")
	public String subViewSubStockList(Model model, @RequestParam(value="subCode")String subCode){
		System.out.println("SubStockController subViewSubStockList 실행");
		System.out.println("subCode : "+subCode);
		return "/sub/subStock/subViewSubStockList";
	}
}
