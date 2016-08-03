package com.cafe24.seoje1004.subAccount.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subAccount.model.SubAccountSearch;
import com.cafe24.seoje1004.subAccount.repository.SubAccountDao;
import com.cafe24.seoje1004.subStaff.model.SubStaff;
import com.cafe24.seoje1004.subStaff.repository.SubStaffDao;
@Service
public class SubAccountServiceImpl implements SubAccountService{

	@Autowired
	private SubAccountDao subAccountDao;

	@Override
	public SubAccount subAccountKeeperCheckService(SubStaff subStaff) {
		System.out.println("SubAccountSerivceImpl subAccountKeeperCheckService실행");
		return subAccountDao.subAccountKeeperCheck(subStaff);
		
	}

	@Override
	public void addSubAccountService(SubAccount subAccount) {
		System.out.println("SubAccountSerivceImpl addSubAccountService실행");
		System.out.println(subAccount);
		subAccountDao.addSubAccount(subAccount);
	}

	@Override
	public SubAccount viewSubAccountListService(SubAccountSearch subAccountSearch) {
		System.out.println("SubStaffServiceImpl viewSubStaffListService실행");
		System.out.println("SubServiceImpl viewSubListService. 조회 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subStaffSearch", subAccountSearch);
		return subAccountDao.viewSubAccountList(map);
		
	}

	
}
