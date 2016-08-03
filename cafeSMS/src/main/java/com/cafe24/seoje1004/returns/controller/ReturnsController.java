package com.cafe24.seoje1004.returns.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.returns.model.Returns;
import com.cafe24.seoje1004.returns.model.ReturnsSearch;
import com.cafe24.seoje1004.returns.service.ReturnsService;

@Controller
public class ReturnsController {
	/**
	 * 2016-08-02 오성현
	 * Returns 컨트롤러
	 */

	@Autowired
	ReturnsService returnsService;
	
	
	//가맹측 반품상품관리 조회
	@RequestMapping(value="/subViewReturnsList")
	public String subViewReturnsList(Model model, @RequestParam(value="subCode")String subCode,ReturnsSearch returnsSearch){
		System.out.println("ReturnsController subViewReturnsList 실행");
		
		List<Returns> returnsList = returnsService.subViewReturnsList(subCode, returnsSearch);
		System.out.println("returnsList : "+ returnsList);
		
		model.addAttribute("subCode", subCode);
		model.addAttribute("returnsSearch", returnsSearch);
		model.addAttribute("returnsList", returnsList);
		
		return "/shared/returns/subViewReturnsList";
	}
	
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	
	//본사측 반품상품관리 조회
	@RequestMapping(value="/headViewReturnsList")
	public String headViewReturnsList(Model model,ReturnsSearch returnsSearch){
		System.out.println("ReturnsController headViewReturnsList 실행");
		
		List<Returns> returnsList = returnsService.headViewReturnsList(returnsSearch);
		System.out.println("returnsList : "+ returnsList);
		
		
		model.addAttribute("returnsSearch", returnsSearch);
		model.addAttribute("returnsList", returnsList);
		
		
		return "/shared/returns/headViewReturnsList";
	}
	
	//반품상품 상세보기
	@RequestMapping(value="/viewReturnsContent", method=RequestMethod.GET)
	public String viewReturnsContent(Model model,@RequestParam(value="returnCode")String returnCode){
		System.out.println("ReturnsController viewReturnsContent 실행");
		System.out.println("returnCode : "+returnCode);
		
		//해당 반품상품정보와 해당반품상품의 파일리스트를 가져와야하므로
		Map<String,Object> map = returnsService.viewReturnsContent(returnCode);
		System.out.println("map : "+map);
		
		model.addAttribute("map", map);
		return "/shared/returns/viewReturnsContent";
	}
	
}
