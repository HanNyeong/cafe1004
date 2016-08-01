package com.cafe24.seoje1004.subAccount.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subAccount.service.SubAccountService;
import com.cafe24.seoje1004.subStaff.model.SubStaff;

@Controller
public class SubAccountController {
	@Autowired
	private SubAccountService subAccountService;
	
	
	/**
	    * 직원 급여관리를 하는 컨트롤러 입니다.
	    * 매개변수로 가맹직원 id와 급여 금액을 받아서 서비스 메서드로 
	    * 넘겨줍니다.
	    * int로 리턴받습니다.
	    * @param subStaff
	    * @return
	    */
	   @RequestMapping(value="/subStaffSalary",method=RequestMethod.POST)
	   public String subStaffSalary(SubAccount subAccount){
		   System.out.println("SubAccountController subStaffSalary실행");
		   System.out.println(subAccount);
		   subAccountService.addSubAccountService(subAccount);
		   
		   return "redirect:/viewSubStaffList?subCode="+subAccount.getSubCode();
	   }
	
	
	public String modifySubAccount(Model model, SubLogin subLogin){
		subAccountService.modifySubAccountService(subLogin);
		return "";
	}
	
}
