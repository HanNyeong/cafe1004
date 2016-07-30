package com.cafe24.seoje1004.claim.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.contract.model.Contract;
import com.cafe24.seoje1004.contract.model.ContractSearch;

@Controller
public class ClaimController {
	/**
	 * 최종수정일 2016-07-30 오성현
	 * 컨트롤러
	 */
	
	//본사가 전체 클래임리스트 조회
		@RequestMapping(value = "/headViewClaimList", method=RequestMethod.GET)
		public String headViewClaimList() {
			System.out.println("contractController headViewClaimList 실행!!");
			
			
			return "/shared/claim/headViewClaimList";
		}
	
	//가맹이 해당점의 클래임리스트 조회
		@RequestMapping(value = "/subViewClaimList", method=RequestMethod.GET)
		public String subViewClaimList() {
			System.out.println("contractController subViewClaimList 실행!!");
			
			
			return "/shared/claim/subViewClaimList";
		}

	//고객이 자신의 클래임을 조회 및 새로운 클래임 등록
		@RequestMapping(value = "/customerViewClaimList", method=RequestMethod.GET)
		public String customerViewClaimList() {
			System.out.println("contractController customerViewClaimList 실행!!");
			
			
			return "/shared/claim/customerViewClaimList";
		}		
}
