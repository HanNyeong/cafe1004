package com.cafe24.seoje1004.subSell.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.subSell.model.SubSell;
import com.cafe24.seoje1004.subSell.model.SubSellSearch;
import com.cafe24.seoje1004.subSell.service.SubSellService;
import com.cafe24.seoje1004.util.Search;


@Controller
public class SubSellController {
	/**
	 * 최종수정일 2016-08-08	오성현
	 * SubSellController
	 */
	
	@Autowired
	SubSellService subSellService;
	
	//가맹 판매 조회[승인처리리스트]
	@RequestMapping(value="/subViewSubSellList")
	public String subViewSubSellList(Model model, Search search
			,@RequestParam(value="subCode")String subCode
			,@RequestParam(value="YN", required = false)String YN){
		System.out.println("SubSellController subViewSubSellList 실행");
		
		List<SubSell> subSellList = subSellService.subViewSubSellList(search,subCode);
		
		System.out.println("subSellList : " + subSellList);
		System.out.println("search : "+search);
		System.out.println("YN : "+YN);
		
		
		
		model.addAttribute("YN", YN);
		model.addAttribute("subCode", subCode);
		model.addAttribute("subSellSearch", search);
		model.addAttribute("subSellList", subSellList);
		
		return "/sub/subSell/subViewSubSellList";
	}
	

	
	//가맹 판매 마감처리
	@RequestMapping(value="/subSellFinal")
	public String subSellFinal(@RequestParam(value="subCode")String subCode,
								@RequestParam(value="subSellCode")String subSellCode){
		System.out.println("SubSellController subSellFinal 실행");

		subSellService.subSellFinal(subSellCode);
		
		return "redirect:/subViewSubSellList?subCode="+subCode;
	}
	
}
