package com.cafe24.seoje1004.subSell.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.subSell.model.SubSellSearch;

@Controller
public class SubSellController {
	/**
	 * 최종수정일 2016-08-08	오성현
	 * SubSellController
	 */
	
	
	@RequestMapping(value="/subViewSubSellList")
	public String subViewSubSellList(Model model, SubSellSearch subSellSearch, @RequestParam(value="subCode")String subCode){
		System.out.println("SubSellController subViewSubSellList 실행");
		
		return "/sub/subSell/subViewSubSellList";
	}
}
