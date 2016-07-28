package com.cafe24.seoje1004.contract.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContractController {
	/**
	 * 최종수정일 2016-07-28 오성현
	 * 컨트롤러
	 */
	
	
	/**
	 * 
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/subViewContractList", method = RequestMethod.GET)
	public String subViewContractList(Model model) {
		System.out.println("contractController subViewContractList get실행!!");
		
		return "/shared/contract/subViewContractList";
	}	
}
