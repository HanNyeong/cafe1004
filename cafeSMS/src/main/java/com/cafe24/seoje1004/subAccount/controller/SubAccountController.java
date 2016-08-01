package com.cafe24.seoje1004.subAccount.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subAccount.service.SubAccountService;

@Controller
public class SubAccountController {
	@Autowired
	private SubAccountService subAccountService;
	
	public String modifySubAccount(Model model, SubLogin subLogin){
		subAccountService.modifySubAccountService(subLogin);
		return "";
	}
	
}
