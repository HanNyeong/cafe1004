package com.cafe24.seoje1004.subAccount.service;

import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subStaff.model.SubStaff;

public interface SubAccountService {
	/**
	 * 
	 * @param subLogin
	 */
	SubStaff subAccountKeeperCheckService(SubStaff subStaff);

	void addSubAccountService(SubAccount subAccount);

}
