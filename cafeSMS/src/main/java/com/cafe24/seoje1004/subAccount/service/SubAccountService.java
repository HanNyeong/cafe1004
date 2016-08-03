package com.cafe24.seoje1004.subAccount.service;

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

	SubAccount viewSubAccountListService(SubAccountSearch subAccountSearch);

}
