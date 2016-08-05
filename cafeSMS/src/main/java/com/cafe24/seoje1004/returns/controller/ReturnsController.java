package com.cafe24.seoje1004.returns.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.returns.model.AddReturns;
import com.cafe24.seoje1004.returns.model.Returns;
import com.cafe24.seoje1004.returns.model.ReturnsSearch;
import com.cafe24.seoje1004.returns.model.SubStock;
import com.cafe24.seoje1004.returns.model.SubStockSearch;
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
	
	//가맹측 환불신청 (해당가맹의 재고리스트)
	@RequestMapping(value="/subAddReturnsForm")
	public String subAddReturnsFrom(Model model, @RequestParam(value="subCode")String subCode, SubStockSearch subStockSearch){
		System.out.println("ReturnsController subAddReturnsFrom 실행");
		System.out.println("subCode : "+subCode);
		
		//1.가맹의 재고에서 출고상태가 N이고 가맹이확인하고 입고한 날짜가 null이 아닌것만 환불신청가능
		//따라서 출고상태가 N, 가맹이확인하고 입고한날짜 not null
		List<SubStock> subStockList	=	returnsService.subAddReturnsForm(subCode, subStockSearch);
		System.out.println("subStockList : "+subStockList);
		
		model.addAttribute("subCode", subCode);
		model.addAttribute("subStockSearch", subStockSearch);
		model.addAttribute("subStockList", subStockList);
		
		return	"/shared/returns/subAddReturnsForm";
	}
	
	//가맹측 환불신청2	(해당재고상품을 환불신청 폼)
	@RequestMapping(value="/subAddReturnsForm2", method=RequestMethod.GET)
	public String subAddReturnsFrom2(Model model,@RequestParam(value="subStockCode")String subStockCode){
		System.out.println("ReturnsController subAddReturnsForm2 실행");
		System.out.println("subStockCode : "+subStockCode);
		
		//해당재고를 기준으로 반품등록에 필요한 정보를 가져오자
		AddReturns addReturns = returnsService.subAddReturnsForm2(subStockCode);
		System.out.println("addReturns : "+addReturns);
		model.addAttribute("addReturns", addReturns);
		
		return	"/shared/returns/subAddReturnsForm2";
	}
	
	//가맹측 환불신청3	(해당재고상품을 환불신청 폼)
	@RequestMapping(value="/subAddReturns", method=RequestMethod.POST)
	public String subAddReturns(Returns returns, HttpServletRequest request){
		System.out.println("ReturnsController subAddReturns 실행");
		System.out.println("returns : "+returns);
		String subCode = returns.getSubCode();
		
		
		
		//1. 해당 재고상품의 출고여부(판매여부)를 N->Y로 변경
		//2. returns테이블에 새로운 환불 등록
		returnsService.subAddReturns(returns, request);
		
		
		return	"redirect:/subAddReturnsForm?subCode="+subCode;
	}
	
	//가맹측 환불 취소
	@RequestMapping(value="/subCancelReturns", method=RequestMethod.GET)
	public String subCancelReturns(@RequestParam(value="returnCode")String returnCode
			,@RequestParam(value="ordersCode")String ordersCode
			,@RequestParam(value="subCode")String subCode){
		System.out.println("ReturnsController subCancelReturns 실행");
		System.out.println("returnCode : "+returnCode);
		System.out.println("ordersCode : "+ordersCode);
		
		returnsService.subCancelReturns(returnCode,ordersCode);
		
		return "redirect:/subViewReturnsList?subCode="+subCode;
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
	
	//본사에서 환불 승인
	@RequestMapping(value="/approvalReturns", method=RequestMethod.GET)
	public String approvalReturns(@RequestParam(value="returnCode")String returnCode){
		System.out.println("ReturnsController approvalReturns 실행");
		System.out.println("returnCode : "+returnCode);
		
		returnsService.approvalReturns(returnCode);
		
		return	"redirect:/headViewReturnsList";
	}
	
	//본사에서 재배송처리
	@RequestMapping(value="/headReturnReDelivery", method=RequestMethod.GET)
	public String headReturnReDelivery(@RequestParam(value="ordersCode")String ordersCode){
		System.out.println("ordersCode : "+ordersCode);
		
		//ordersCode를 기준으로 값을 변경해주면된다.
		//1.환불테이블의 headReturnsConfirm을 Y로 변경 update
		//2.배송테이블의 deliveryReturn을 Y로 변경 update
		//3.
		
		return	"redirect:/headViewReturnsList";
	}
	
}
