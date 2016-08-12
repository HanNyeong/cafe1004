package com.cafe24.seoje1004.subSell.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafe24.seoje1004.menu.model.Menu;
import com.cafe24.seoje1004.subSell.model.SubSell;
import com.cafe24.seoje1004.subSell.model.SubSellSearch;
import com.cafe24.seoje1004.subSell.model.SubSells;
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
		model.addAttribute("search", search);
		model.addAttribute("subSellList", subSellList);
		
		return "/sub/subSell/subViewSubSellList";
	}
	


	

	//가맹 판매 마감처리s
	@RequestMapping(value="/subSellFinals")
	public String subSellFinals(RedirectAttributes redirectAttributes 
								,SubSells subSells, Search search
								,@RequestParam(value="YN", required = false)String YN){
		System.out.println("SubSellController subSellFinals 실행");
		System.out.println("YN : "+ YN);	
		System.out.println("subSells : "+subSells);
		subSellService.subSellFinals(subSells);
		
		//redirectAttributes.addFlashAttribute("YN", YN);
		//redirectAttributes.addFlashAttribute("subCode", subSells.getSubCode().get(0));
		redirectAttributes.addFlashAttribute("search", search);
		
		
		return "redirect:/subViewSubSellList?subCode="+subSells.getSubCode().get(0)+"&YN="+YN;
		
	}
	
	//가맹 판매 등록
	
	@RequestMapping(value="/subSellSignUp",method=RequestMethod.GET)
	public String subSellSignUp(Model model
					,@RequestParam(value="subCode")String subCode){
		System.out.println("SubSellController subSellSignUp 실행");
		System.out.println("subCode : "+subCode);
		
		//메뉴리스트를 가져오자
		List<Menu> menuList =  subSellService.viewMenuList();
		System.out.println("menuList :" +menuList);
		
		model.addAttribute("menuList", menuList);
		
		return "/sub/subSell/subSellSignUp";
	}
	
}
