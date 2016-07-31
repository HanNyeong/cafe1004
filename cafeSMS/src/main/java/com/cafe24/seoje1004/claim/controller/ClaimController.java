package com.cafe24.seoje1004.claim.controller;

import java.util.List;
import java.util.Map;

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
	
	//해당 클래임 상세내역 조회
	@RequestMapping(value="/viewClaimContent",method=RequestMethod.GET)
	public String viewClaimContent(Model model,@RequestParam(value="claimCode")String claimCode){
		System.out.println("contractController viewClaimContent get실행");
		
		//claimCode에 해당하는 클래임 상세정보출력
		//상세정보와 클래임 파일리스트를 받으므로 map에다 넣어주자
		Map<String,Object> map = claimService.viewClaimContent(claimCode);
		
		
		System.out.println("map : "+map);
		
		model.addAttribute("map", map);
		
		return "/shared/claim/viewClaimContent";
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

	
	
	
	
	
	
	//고객이 자신의 클래임을 조회 및 새로운 클래임 등록 링크 제공
	@RequestMapping(value = "/customerViewClaimForm", method=RequestMethod.GET)
	public String customerViewClaimListForm() {
		System.out.println("contractController customerViewClaimForm 실행!!");
		
		
		return "/shared/claim/customerViewClaimForm";
	}	
	
	
	//고객이 자신의 클래임을 조회
	@RequestMapping(value = "/customerViewClaimList")
	public String customerViewClaimList(Model model,Claim claim,ClaimSearch claimSearch) {
		System.out.println("contractController customerViewClaimList 실행!!");
		System.out.println("claim : "+ claim);
		
		List<Claim> claimList = claimService.customerViewClaimList(claim,claimSearch);
		System.out.println("claimList : "+claimList);
		
		model.addAttribute("claim", claim);
		model.addAttribute("claimSearch", claimSearch);
		model.addAttribute("claimList", claimList);
		
		return "/shared/claim/customerViewClaimList";
	}
	
	
	//고객이 자신의 클래임을 조회 및 새로운 클래임 등록 링크 제공
	@RequestMapping(value = "/customerAddClaim", method=RequestMethod.GET)
	public String customerAddClaim() {
		System.out.println("contractController customerAddClaim 실행!!");
		
		
		return "/shared/claim/customerAddClaim";
	}	
	
	
}
