package com.cafe24.seoje1004.subStock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.subStock.model.SubStock;
import com.cafe24.seoje1004.subStock.model.SubStockSearch;
import com.cafe24.seoje1004.subStock.service.SubStockService;

@Controller
public class SubStockController {
	/**
	 * 최종 수정일 2016-08-06 오성현
	 * 가맹재고컨트롤러
	 */
	
	@Autowired
	SubStockService subStockService;
	
	//가맹재고리스트
	@RequestMapping(value="/subViewSubStockList")
	public String subViewSubStockList(Model model, @RequestParam(value="subCode")String subCode, SubStockSearch subStockSearch){
		System.out.println("SubStockController subViewSubStockList 실행");
		System.out.println("subCode : "+subCode);
		
		List<SubStock> subStockList = subStockService.subViewSubStockList(subCode, subStockSearch);
		System.out.println("subStockList : "+ subStockList);
		
		
		model.addAttribute("subCode", subCode);
		model.addAttribute("subStockSearch", subStockSearch);
		model.addAttribute("subStockList", subStockList);
		
		return "/sub/subStock/subViewSubStockList";
	}
}
