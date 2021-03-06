package com.cafe24.seoje1004.subStock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.subStock.model.SubStock;
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
		
		List<SubStock> subStockList = subStockService.subViewSubStockList(subCode, search, YN);
		System.out.println("subStockList : "+ subStockList);
		
		model.addAttribute("YN", YN);
		model.addAttribute("subCode", subCode);
		model.addAttribute("search", search);
		model.addAttribute("subStockList", subStockList);
		
		return "/sub/subStock/subViewSubStockList";
	}
	
	//가맹이 본사로부터 받은 제품을 입고
	@RequestMapping(value="/subWarehousing")
	public String subWarehousing(SubStocks subStocks){
			System.out.println("SubStockController subWarehousing 싱행");
			
			//1.subStockCode는 입고날자를 업데이트하기위해서
			//2.ordersCode는 배송테이블의 배송수령여부 컬럼을 Y로 업데이트 하기위해서
			
			System.out.println("subStocks : "+subStocks);
		
			subStockService.subWarehousing(subStocks);
			
		return	"redirect:/subViewSubStockList?subCode="+subStocks.getSubCode().get(0);
	}
	
	//가맹 재고 출하
	@RequestMapping(value="/subStockOutY")
	public String subStockOutY(@RequestParam(value="subCode")String subCode
							,@RequestParam(value="subStockCode")String subStockCode
							,@RequestParam(value="YN", required = false)String YN){
		System.out.println("SubStockController subStockOutY 실행");
		System.out.println("subCode : "+subCode);
		System.out.println("subStockCode : "+subStockCode);
		
		subStockService.subStockOutY(subStockCode);
		
		
		return "redirect:/subViewSubStockOutList?subCode="+subCode;
	}
	
	//가맹재고출하가능리스트
	@RequestMapping(value="/subViewSubStockOutList")
	public String subViewSubStockOutList(Model model
			,@RequestParam(value="subCode")String subCode
			,Search search
			,@RequestParam(value="YN", required = false)String YN){
		System.out.println("SubStockController subViewSubStockOutList 실행");
		System.out.println("subCode : "+subCode);
		
		List<SubStock> subStockList = subStockService.subViewSubStockOutList(subCode, search, YN);
		
		System.out.println("subStockList : "+ subStockList);
		
		model.addAttribute("YN", YN);
		model.addAttribute("subCode", subCode);
		model.addAttribute("search", search);
		model.addAttribute("subStockList", subStockList);
		
		return "/sub/subStock/subViewSubStockOutList";
	}
	
}
