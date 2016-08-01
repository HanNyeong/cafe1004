package com.cafe24.seoje1004.subAccount.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subAccount.repository.SubAccountDao;
@Service
public class SubAccountSerivceImpl implements SubAccountService{

	@Autowired
	private SubAccountDao subAccountDao;

	@Override
	public void modifySubAccountService(SubLogin subLogin) {
		// TODO Auto-generated method stub
		
	}
}
