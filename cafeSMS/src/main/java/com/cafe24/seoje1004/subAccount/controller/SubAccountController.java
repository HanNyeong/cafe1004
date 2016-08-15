package com.cafe24.seoje1004.subAccount.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subAccount.service.SubAccountService;
import com.cafe24.seoje1004.subStaff.model.SubStaff;
import com.cafe24.seoje1004.util.Search;

@Controller
public class SubAccountController {

	@Autowired
	private SubAccountService subAccountService;

	/**
	 * 직원 급여관리를 하는 컨트롤러 입니다. 매개변수로 가맹직원 id와 급여 금액을 받아서 서비스 메서드로 넘겨줍니다. int로
	 * 리턴받습니다.
	 * 
	 * @param subStaff
	 * @return
	 */
	@RequestMapping(value = "/subAddSubAccount", method = RequestMethod.POST)
	public String subAddSubAccount(SubAccount subAccount) {
		System.out.println("SubAccountController subStaffSalary실행");
		System.out.println(subAccount);
		subAccountService.addSubAccountService(subAccount);
		return "redirect:/viewSubStaffList?subCode=" + subAccount.getSubCode();
	}
	/**
	 * 가맹 점장이 회계 확인을 하는 컨트롤러 입니다.
	 * @param model
	 * @param subStaff
	 * @return
	 */
	@RequestMapping(value = "/subAccountKeeperCheck", method = RequestMethod.GET)
	public String subAccountKeeperCheck(Model model) {
		System.out.println("SubAccountController subAccountKeeperCheck.GET실행");

		return "/sub/subAccount/viewSubAccountList";
	}
	/**
	 * 가맹 점장이 회계 확인을 하는 컨트롤러 입니다.
	 * @param model
	 * @param subStaff
	 * @return
	 */
	@RequestMapping(value = "/subAccountKeeperCheck", method = RequestMethod.POST)
	public String subAccountKeeperCheck(RedirectAttributes redirectAttr, SubStaff subStaff) {
		System.out.println("SubAccountController subAccountKeeperCheck.POST실행");
		System.out.println(subStaff);
		SubAccount subAccount = subAccountService.subAccountKeeperCheckService(subStaff);
		System.out.println("================================================");
		System.out.println(subAccount);
		System.out.println("================================================");
		if(subAccount != null){
			System.out.println("IFIFIFIFIFIFIFIFIFIFIFIFIFIFI");
			subStaff.setSubStaffLevel("점주");
			subStaff.setSubStaffPw("");
			redirectAttr.addFlashAttribute("subAccount", subAccount);
			redirectAttr.addFlashAttribute("subStaff", subStaff);
		}
			
		return "redirect:/viewSubAccountList";
	}
	/**
	 * 가맹통합 회계 리스트를 출력하는 컨트롤러 입니다.
	 * @param model
	 * @param subLogin
	 * @param subAccountSearch
	 * @return
	 */
	@RequestMapping(value = "/viewSubAccountList")
	public String viewSubAccountList(Model model, SubAccount subAccount,Search subAccountSearch,SubStaff subStaff) {
		System.out.println("SubAccountController subAccountList실행");
		System.out.println(subAccount);
		System.out.println("확인하자"+subStaff);
		model.addAttribute("subStaff", subStaff);
		model.addAttribute("subAccountList", subAccountService.viewSubAccountListService(subAccountSearch,subStaff));
		model.addAttribute("subAccountSearch", subAccountSearch);
		return "/sub/subAccount/viewSubAccountList";
	}

}
