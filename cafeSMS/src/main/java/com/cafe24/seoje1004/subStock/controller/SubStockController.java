package com.cafe24.seoje1004.subStock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.subStock.model.SubStock;
import com.cafe24.seoje1004.subStock.model.SubStockSearch;
import com.cafe24.seoje1004.subStock.model.SubStocks;
import com.cafe24.seoje1004.subStock.service.SubStockService;
import com.cafe24.seoje1004.util.Search;

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
	public String subViewSubStockList(Model model
			,@RequestParam(value="subCode")String subCode
			,Search search
			,@RequestParam(value="YN", required = false)String YN){
		System.out.println("SubStockController subViewSubStockList 실행");
		System.out.println("subCode : "+subCode);
		
		List<SubStock> subStockList = subStockService.subViewSubStockList(subCode, search);
		System.out.println("subStockList : "+ subStockList);
		
		model.addAttribute("YN", YN);
		model.addAttribute("subCode", subCode);
		model.addAttribute("search", search);
		model.addAttribute("subStockList", subStockList);
		
		return "/sub/subStock/subViewSubStockList";
	}
	
	//가맹이 본사로부터 받은 제품을 입고
	@RequestMapping(value="/subWarehousing", method=RequestMethod.GET)
	public String subWarehousing(SubStocks subStocks){
		
			
			//1.subStockCode는 입고날자를 업데이트하기위해서
			//2.ordersCode는 배송테이블의 배송수령여부 컬럼을 Y로 업데이트 하기위해서
			
			//subStockService.subWarehousing(subStocks);
			
		return	"redirect:/subViewSubStockList?subCode="+subStocks.getSubCode().get(0);
	}
}
