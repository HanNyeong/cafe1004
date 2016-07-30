package com.cafe24.seoje1004.claim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.claim.model.Claim;
import com.cafe24.seoje1004.claim.model.ClaimSearch;
import com.cafe24.seoje1004.claim.service.ClaimService;
import com.cafe24.seoje1004.contract.model.Contract;
import com.cafe24.seoje1004.contract.model.ContractSearch;

@Controller
public class ClaimController {
	/**
	 * 최종수정일 2016-07-30 오성현
	 * 컨트롤러
	 */
	
	@Autowired
	ClaimService claimService;
	
	
	//본사가 전체 클래임리스트 조회
	@RequestMapping(value = "/headViewClaimList")
	public String headViewClaimList(Model model, ClaimSearch claimSearch) {
		System.out.println("contractController headViewClaimList 실행!!");
		//1.전체클래임리스트 조회
		//2.status가 N,Y인거 구별
		//3.클래임에 답변
		
		System.out.println("claimSearch : "+claimSearch);
		
		//본사가 전체클래임리스트 조회
		List<Claim> claimList = claimService.headViewClaimList(claimSearch);
		model.addAttribute("claimSearch", claimSearch);
		model.addAttribute("claimList", claimList);
		
		return "/shared/claim/headViewClaimList";
	}
	
	
	
	
	
	
	
	
	
	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	
	
	
	
	
	
	
	
	
	//가맹이 해당점의 클래임리스트 조회
	@RequestMapping(value = "/subViewClaimList", method=RequestMethod.GET)
	public String subViewClaimList() {
		System.out.println("contractController subViewClaimList 실행!!");
		//1.해당가맹의 클래임리스트 조회
		
		
		return "/shared/claim/subViewClaimList";
	}
	
	
	
	
	
	
	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/

	
	
	
	
	
	
	//고객이 자신의 클래임을 조회 및 새로운 클래임 등록
	@RequestMapping(value = "/customerViewClaimList", method=RequestMethod.GET)
	public String customerViewClaimList() {
		System.out.println("contractController customerViewClaimList 실행!!");
		//1.고객이 클래임등록
		//2.고객이 자신의 불만리스트 조회 및 수정
		
		
		return "/shared/claim/customerViewClaimList";
	}		
}
