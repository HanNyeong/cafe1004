package com.cafe24.seoje1004.subAccount.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subAccount.service.SubAccountService;

@Controller
public class SubAccountController {
	@Autowired
	private SubAccountService subAccountService;
	
	public String addSubAccount(Model model, SubAccount subAccount){
		subAccountService.addSubAccountService(subAccount);
		return "";
	}
}
