package com.cafe24.seoje1004.subAccount.service;

import java.util.List;

import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subAccount.model.SubAccountSearch;
import com.cafe24.seoje1004.subStaff.model.SubStaff;

public interface SubAccountService {
	/**
	 * 
	 * @param subLogin
	 */
	SubAccount subAccountKeeperCheckService(SubStaff subStaff);
	/**
	 * 
	 * @param subAccount
	 */
	void addSubAccountService(SubAccount subAccount);

	List<SubAccount> viewSubAccountListService(SubAccountSearch subAccountSearch,SubStaff subStaff);
	void modifySubAccountService(SubAccount subAccount, SubStaff subStaff);

}
