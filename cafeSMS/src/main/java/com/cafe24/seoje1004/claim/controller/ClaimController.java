package com.cafe24.seoje1004.claim.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafe24.seoje1004.claim.model.Claim;
import com.cafe24.seoje1004.claim.model.ClaimSearch;
import com.cafe24.seoje1004.claim.service.ClaimService;
import com.cafe24.seoje1004.contract.model.Contract;
import com.cafe24.seoje1004.contract.model.ContractSearch;
import com.cafe24.seoje1004.contract.service.ContractService;

@Controller
public class ClaimController {
	/**
	 * 최종수정일 2016-07-31 오성현
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
	public String viewClaimContent(Model model,@RequestParam(value="claimCode")String claimCode
			,@RequestParam(value="customerName", required = false)String customerName){
		System.out.println("contractController viewClaimContent get실행");
		
		/*,@RequestParam(value="customerName", required = false,defaultValue="")String customerName){*/
		
		//claimCode에 해당하는 클래임 상세정보출력
		//상세정보와 클래임 파일리스트를 받으므로 map에다 넣어주자
		Map<String,Object> map = claimService.viewClaimContent(claimCode);
		
		System.out.println("customerName : "+customerName);
		System.out.println("map : "+map);
		
		model.addAttribute("customerName", customerName);
		model.addAttribute("map", map);
		
		return "/shared/claim/viewClaimContent";
	}
	
	//본사가 해당클래임에 답변하기
	@RequestMapping(value="/headAnswerClaimForm", method=RequestMethod.GET)
	public String headAnswerClaimForm(Model model,@RequestParam(value="claimCode")String claimCode){
		System.out.println("contractController headAnswerClaim 실행");
		
		//해당클레임에 대한 정보를 가져와서 수정해야하므로 해당정보를 가져와주자
		Claim claim = claimService.headAnswerClaimForm(claimCode);
		model.addAttribute("claim", claim);
		return	"/shared/claim/headAnswerClaimForm";

	}
	
	//답변처리 즉 업데이트 하기
	@RequestMapping(value="/headAnswerClaim", method=RequestMethod.POST)
	public String headAnswerClaim(Claim claim){
		System.out.println("contractController headAnswerClaim 실행");
		System.out.println("claim :" + claim);
		
		//업데이트 처리
		claimService.headAnswerClaim(claim);
		
		return	"redirect:/headViewClaimList";

	}
	
	
	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	
	
	
	
	
	
	
	
	
	//가맹이 해당점의 클래임리스트 조회
	@RequestMapping(value = "/subViewClaimList")
	public String subViewClaimList(Model model,@RequestParam(value="subCode")String subCode,ClaimSearch claimSearch) {
		System.out.println("contractController subViewClaimList 실행!!");
		System.out.println("subCode : "+subCode);
		//1.해당가맹의 클래임리스트 조회
		
		List<Claim> claimList = claimService.subViewClaimList(subCode, claimSearch);
		
		System.out.println("claimList : " +claimList);
		
		model.addAttribute("subCode", subCode);
		model.addAttribute("claimSearch", claimSearch);
		model.addAttribute("claimList", claimList);
		
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
	
	
	//고객이 클래임을 등록하는 폼
	@RequestMapping(value = "/customerAddClaim", method=RequestMethod.GET)
	public String customerAddClaimForm() {
		System.out.println("contractController customerAddClaimForm 실행!!");
		
		
		return "/shared/claim/customerAddClaim";
	}	
	
	//고객이 클래임 등록을 처리
	@RequestMapping(value = "/customerAddClaim", method=RequestMethod.POST)
	public String customerAddClaim(Claim claim, HttpServletRequest request) {
		System.out.println("contractController customerAddClaim 실행!!");
		System.out.println("claim :" +claim);
		
		claimService.customerAddClaim(claim,request);
		
		return "redirect:/customerViewClaimForm";
	}	
	
	//고객이 클래임을 수정폼
	@RequestMapping(value="/customerUpdateClaimForm", method=RequestMethod.GET)
	public String customerUpdateClaimForm(Model model,@RequestParam(value="claimCode")String claimCode){
		System.out.println("contractController customerUpdateClaimForm 실행");
		
		//claimCode해당하는 정보를 가져와서 폼으로 넘겨주자
		Map<String,Object> map = claimService.viewClaimContent(claimCode);
		
		model.addAttribute("map", map);
		
		return "/shared/claim/customerUpdateClaimForm";
	}
	
	//고객이 클래임을 수정 처리
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@RequestMapping(value="/customerUpdateClaim", method=RequestMethod.POST)
	public String customerUpdateClaim(Model model,Claim claim, HttpServletRequest request){
		System.out.println("contractController customerUpdateClaim 실행");
		System.out.println("claim : "+claim);
		
		//고객이 수정처리후 다시 콘텐츠로 가도록
		String claimCode = claim.getClaimCode();
		String customerName = claim.getCustomerName();
		
		//한글 인코딩 문제 해결
		String customerNames="";
		try {
			customerNames = URLEncoder.encode(customerName, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//1.먼저 claim을 삭제 하고 관련된 file을 삭제
		//고객이 클래임 삭제 처리
		claimService.customerDeleteClaim(claimCode);
		
		//2.새로 클래임을 등록과 파일등록
		claimService.customerAddClaim(claim,request);
		
		
		return "redirect:/viewClaimContent?claimCode="+claimCode+"&customerName="+customerNames;
		
	}
	//고객이 클래임을 삭제
	@RequestMapping(value="/customerDeleteClaim", method=RequestMethod.GET)
	public String customerDelete(Model model,@RequestParam(value="claimCode")String claimCode
			,@RequestParam(value="customerName")String customerName
			,@RequestParam(value="customerPhone")String customerPhone){
		System.out.println("contractController customerDeleteClaim실행");
		
			System.out.println("customerName : "+customerName);
			System.out.println("customerPhone : "+customerPhone);
			
			//한글 인코딩 문제 해결
			String customerNames="";
			try {
				customerNames = URLEncoder.encode(customerName, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//고객이 클래임 삭제 처리
			claimService.customerDeleteClaim(claimCode);
			
		
		return	"redirect:/customerViewClaimList?customerName="+customerNames+"&customerPhone="+customerPhone;
	}
	
}
