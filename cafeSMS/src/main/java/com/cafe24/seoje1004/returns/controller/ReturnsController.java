package com.cafe24.seoje1004.returns.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
		
		return "/shared/returns/subViewReturnsList";
	}
	
	
	//본사측 반품상품관리 조회
	@RequestMapping(value="/headViewReturnsList")
	public String headViewReturnsList(Model model){
		System.out.println("ReturnsController headViewReturnsList 실행");
		return "/shared/returns/headViewReturnsList";
	}
	
}
