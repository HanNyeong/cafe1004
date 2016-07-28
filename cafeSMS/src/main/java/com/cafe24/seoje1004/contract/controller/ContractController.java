package com.cafe24.seoje1004.contract.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.seoje1004.contract.model.Contract;
import com.cafe24.seoje1004.contract.model.ContractSearch;
import com.cafe24.seoje1004.contract.service.ContractService;

@Controller
public class ContractController {
	/**
	 * 최종수정일 2016-07-28 오성현
	 * 컨트롤러
	 */
	
	@Autowired
	ContractService contractService;	
	
	//가맹점이 해당가맹점의 계약리스트를 리뷰
	@RequestMapping(value = "/subViewContractList")
	public String subViewContractList(Model model, ContractSearch contractSearch) {
		System.out.println("contractController subViewContractList get실행!!");
		
		//가상의 sub_code
		String subCode = "sub_code2";
		
		//가맹의 계약리스트(subCode는 해당가맹, contractSearch는 검색 및 컬럼별조회기능)
		List<Contract> subContractList = contractService.subViewContractList(subCode, contractSearch);
		System.out.println("subContractList : "+ subContractList);
		System.out.println("contractSearch : "+ contractSearch);
		
		model.addAttribute("subContractList", subContractList);
		model.addAttribute("contractSearch", contractSearch);
		
		return "/shared/contract/subViewContractList";
	}	
}
