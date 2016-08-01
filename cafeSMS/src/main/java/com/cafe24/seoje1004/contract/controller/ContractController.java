package com.cafe24.seoje1004.contract.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	public String subViewContractList(Model model, ContractSearch contractSearch, @RequestParam(value="subCode")String subCodes) {
		System.out.println("contractController subViewContractList 실행!!");
		//1.sub생성 (로그인 기능만 부여)
		//2.계약등록 (이제 해당프로그램 사용가능) 이라는 전제로 한다.
		
		
		
		//가상의 sub_code
		String subCode = subCodes;
		
		//가맹의 계약리스트(subCode는 해당가맹, contractSearch는 검색 및 컬럼별조회기능)
		List<Contract> subContractList = contractService.subViewContractList(subCode, contractSearch);
		System.out.println("subContractList : "+ subContractList);
		System.out.println("contractSearch : "+ contractSearch);
		
		model.addAttribute("subContractList", subContractList);
		model.addAttribute("contractSearch", contractSearch);
		model.addAttribute("subCode", subCode);
		
		return "/shared/contract/subViewContractList";
	}
	
	//가맹점이 계약을 신청  폼
	@RequestMapping(value="/subAddContract", method=RequestMethod.GET)
	public String subAddContractForm(Model model, @RequestParam(value="subCode")String subCodes){
		System.out.println("contractController subAddContract get실행");
		
		//가상의 sub_code
		String subCode=subCodes;
		
		model.addAttribute("subCode", subCode);
		
		return "/shared/contract/subAddContract";
	}
	//가맹점이 계약을 신청
	@RequestMapping(value="/subAddContract", method=RequestMethod.POST)
	public String subAddContract(Contract contract, HttpServletRequest request){
		System.out.println("contractController subAddContract post실행");
		System.out.println("contract : "+contract);

		
		//가맹의 계약등록 신청
		//1.가맹이 계약 등록을 신청하면 head_contract_confirm에 기본값 N으로 인서트
		//2.본사가 승인하면 기본값이 Y로 업데이트
		
		//파일처리는 contractService.subAddContract에서 처리
		//실제 파일경로를 지정해주기 위해서 request를 가져와 넣어주자
		contractService.subAddContract(contract, request);
		
		String subCode = contract.getSubCode();
		
		return "redirect:/subViewContractList?subCode="+subCode;
	}	
	
	//가맹대표코드 중복체크(계약등록시 이미 동일한 가맹대표코드로 등록이 되어있다면 등록되어선 안된다.)
	@RequestMapping(value="/subCodeCheck", method=RequestMethod.POST)
	public void subCodeCheck(@RequestParam(value="subCode")String subCode, HttpServletResponse response) throws IOException{
		System.out.println("contractController subCodeCheck 실행");
		response.setContentType("json/text");
		
		Contract contract = new Contract();
		contract.setSubCode(subCode);
		
		int result = 0;
		try{
			result = contractService.subCodeCheck(subCode);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		if(result == 0){
			System.out.println("사용가능 아이디");
			out.write("{\"result\": \"true\"}");
		}else if(result == 1){
			System.out.println("사용불가 아이디");
			out.write("{\"result\": \"false\"}");
		}
		
		
	}
	
	//가맹이 계약상세정보 링크를 클릭
	@RequestMapping(value="/subViewContractContent", method=RequestMethod.GET)
	public String subViewContractContent(Model model, @RequestParam(value="contractCode")String contractCode){
		System.out.println("contractController subViewContractContent get실행 ");
		System.out.println("contractCode : "+contractCode);
		
		Map<String,Object> map = contractService.subViewContractContent(contractCode);
		
		System.out.println("map : "+ map);
	
		model.addAttribute("map", map);
		
		return "/shared/contract/subViewContractContent";
	}
	
	//가맹이 재계약을 신청 폼
	@RequestMapping(value="/subAddRecharterContract", method=RequestMethod.GET)
	public String subAddRecharterContractForm(Model model, @RequestParam(value="contractCode")String contractCode){
		System.out.println("contractController subAddRecharterContract get실행");
		
		//해당 contractCode에 해당하는 계약정보를 재계약 신청폼으로
		Contract contract = contractService.subSelectContract(contractCode);
		System.out.println("contract :" + contract);
		
		model.addAttribute("contract", contract);
		
		return "/shared/contract/subAddRecharterContract";
	}
	
	//가맹이 재계약을 신청
	@RequestMapping(value="/subAddRecharterContract", method=RequestMethod.POST)
	public String subAddRecharterContract(Contract contract, HttpServletRequest request){
		System.out.println("contractController subAddRecharterContract POST실행");
		System.out.println("contract : "+contract);
		String subCode = contract.getSubCode();
		
		//재계약 신청 등록 처리
		contractService.subAddRecharterContract(contract, request);
			
		return "redirect:/subViewContractList?subCode="+subCode;
	
	}
				
	//가맹이 계약파기를 신청폼
	@RequestMapping(value="/subExpireContract", method=RequestMethod.GET)
	public String subExpireContractForm(Model model,@RequestParam(value="contractCode")String contractCode,@RequestParam(value="subCode")String subCode){
		System.out.println("contractController subExpireContract get 실행");
		
		model.addAttribute("subCode", subCode);
		model.addAttribute("contractCode", contractCode);
		
		return "/shared/contract/subExpireContract";
	}
	
	//가맹이 계약파기를 신청
	@RequestMapping(value="/subExpireContract", method=RequestMethod.POST)
	public String subExpireContract(Contract contract, HttpServletRequest request){
		System.out.println("contractController subExpireContract post 실행");
		//1.해당 contractCode에 해당하는 계약의 계약파기일 update
		//2.파기사유서첨부
		System.out.println("contract : "+contract);
		
		contractService.subExpireContract(contract,request);
		String subCode = contract.getSubCode();
		return "redirect:/subViewContractList?subCode="+subCode;
	}
	
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	

	//본사에서 계약리스트 조회
	@RequestMapping(value="/headViewContractList")	
	public String headViewContractList(Model model, ContractSearch contractSearch){
		System.out.println("contractController headViewContractList");
		//본사에서 전체 계약진행 리스트 조회
		List<Contract> headContractList = contractService.headViewContract(contractSearch);
		System.out.println("headContractList : "+headContractList);
		
		model.addAttribute("headContractList", headContractList);
		
		return "/shared/contract/headViewContractList";
	}
	
	
	//본사에서 신청이 들어온 계약을 승인
	@RequestMapping(value="/headApproveContract", method=RequestMethod.GET)
	public String headApproveContract(@RequestParam(value="contractCode")String contractCode){
		System.out.println("contractController headApproveContract 실행");
		
		//승인처리
		//head_contract_confirm의 값을 Y로 업데이트
		contractService.headApproveContract(contractCode);	
		
		
		return "redirect:/headViewContractList";
	}
	
	
}
