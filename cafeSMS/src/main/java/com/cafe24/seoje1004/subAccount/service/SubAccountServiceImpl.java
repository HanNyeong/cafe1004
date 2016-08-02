package com.cafe24.seoje1004.subAccount.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subAccount.repository.SubAccountDao;
import com.cafe24.seoje1004.subStaff.model.SubStaff;
import com.cafe24.seoje1004.subStaff.repository.SubStaffDao;
@Service
public class SubAccountServiceImpl implements SubAccountService{

	@Autowired
	private SubAccountDao subAccountDao;

	@Override
	public SubStaff subAccountKeeperCheckService(SubStaff subStaff) {
	
		subAccountDao.subAccountKeeperCheck(subStaff);
		return null;
		
	}

	@Override
	public void addSubAccountService(SubAccount subAccount) {
		System.out.println("SubAccountSerivceImpl addSubAccountService실행");
		System.out.println(subAccount);
		subAccountDao.addSubAccount(subAccount);
	}
}
